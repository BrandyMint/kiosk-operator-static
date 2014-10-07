###* @jsx React.DOM ###

window.OperatorCategories = React.createClass
  propTypes:
    categories:          React.PropTypes.array
    mockMode:            React.PropTypes.bool
 
  getInitialState: ->
    categories:          []
    selectedCategory:    null
    selectedSubcategory: null

  getDefaultProps: ->
    categories:          null
    mockMode:            false

  componentDidMount: ->
    if !@props.categories
      OperatorCategories_API.mockMode = @props.mockMode
      that = @
      OperatorCategories_API.getCategories (err, categories) ->
        if that.isMounted()
          if err
            console.error 'OperatorCategories: get error', err
          else
            that.setState(categories: categories)

  render: ->
    subcategoriesPane = @_getSubcategoriesPane()
    goodsCountPane = @_getGoodsCountPane()

    return `<div>
              <div className= "col-md-6 user-select-none">
                <OperatorCategories_NewCat parentCategoryId={ null }
                                           onCategoryCreate={ this.handleCategoryCreate } />
                <br />
                <OperatorCategories_List categories=       { this.state.categories }
                                         parentCategoryId= { null }
                                         onListItemClick=  { this.handleCategoryItemClick }
                                         onCategoryDelete= { this.handleCategoryDelete }
                                         onCategoryUpdate= { this.handleCategoryUpdate }
                                         onCategoryReorder={ this.handleCategoryReorder } />
              </div>
              <div className="col-md-6 user-select-none">
                { subcategoriesPane }
                <br />
                { goodsCountPane }
              </div>
            </div>`

  _getSubcategoriesPane: ->
    if @state.selectedCategory
      `<div>
        <OperatorCategories_NewCat parentCategoryId={ this.state.selectedCategory.id }
                                   onCategoryCreate={ this.handleCategoryCreate } />
        <br />
        <OperatorCategories_List categories=       { this.state.categories }
                                 parentCategoryId= { this.state.selectedCategory.id }
                                 onListItemClick=  { this.handleSubcategoryItemClick }
                                 onCategoryDelete= { this.handleCategoryDelete }
                                 onCategoryUpdate= { this.handleCategoryUpdate }
                                 onCategoryReorder={ this.handleCategoryReorder } />
      </div>`

  _getGoodsCountPane: ->
    if @state.selectedCategory or @state.selectedSubcategory
      catForCount = if @state.selectedSubcategory
        @state.selectedSubcategory
      else @state.selectedCategory
      productsUrl = Routes.products_by_category_url(catForCount.id)
      return `<ul className="nav nav-pills nav-stacked">
                <li>
                  <a href={ productsUrl }>
                    <i>Товары (<span>{ catForCount.count }</span>)</i>
                  </a>
                </li>
              </ul>`

  handleCategoryItemClick: (cat) ->
    @setState(selectedCategory: cat)

  handleSubcategoryItemClick: (cat) ->
    @setState(selectedSubcategory: cat)

  handleCategoryDelete: (cat) ->
    # На случай удаления "выбранной" категории
    if @state.selectedCategory and @state.selectedCategory.id == cat.id
      selectedUpdate = null
    else
      selectedUpdate = @state.selectedCategory

    @setState {
      categories: _.reject @state.categories, (i) -> i.id == cat.id
      selectedCategory: selectedUpdate
    }
    OperatorCategories_API.deleteCategory cat.id, (err, response) ->
      if err
        # todo: обработка ошибок с фидбэком для пользователя
        console.error 'Ошибка удаления категории', err

  handleCategoryUpdate: (cat) ->
    @setState(categories: _.map @state.categories, (i) -> if i.id == cat.id then cat else i)
    OperatorCategories_API.updateCategory cat, (err, response) ->
      if err
        # todo: обработка ошибок с фидбэком для пользователя
        console.error 'Ошибка обновления категории', err

  handleCategoryCreate: (parentId, name) ->
    newCat = @_getNewCategory(parentId, name)
    @setState(categories: @state.categories.concat([newCat]))
    that = @
    OperatorCategories_API.createCategory newCat, (err, createdCat) ->
      if err
        # todo: обработка ошибок с фидбэком для пользователя
        console.error 'Ошибка обновления порядка категорий', err
      # Возможно следовало бы заблокировать интерфейс до этого момента
      @setState {
        categories: _.map that.state.categories, (i) ->
          if i.id == newCat.id then createdCat else i
      }

  handleCategoryReorder: (cat, insertIdx) ->
    positionChanges = @_getNewPositions cat, insertIdx
    if positionChanges.length
      @_applyPositions positionChanges
    OperatorCategories_API.updateCategories positionChanges, (err, response) ->
      if err
        # todo: обработка ошибок с фидбэком для пользователя
        console.error 'Ошибка обновления порядка категорий', err

  _getNewCategory: (parentId, name) ->
    # Стратегию генерации временного id нужно скорректировать по api
    tmpId = 100000 + Math.floor(Math.random() * 100000)
    curList = _.filter @state.categories, (i) -> i.parent_id == parentId
    if curList.length
      lastPosition = (_.max curList, (i) -> i.position).position
    else
      lastPosition = 0

    return {
      "id":            tmpId
      "name":          name
      "parent_id":     parentId
      "count":         0
      "position":      lastPosition + 1
      "has_children?": false
    }

  _applyPositions: (changes) ->
    reorderedCategories = @state.categories.slice(0) # Clone
    for category in reorderedCategories
      for change in changes
        if category.id == change.id
          category.position = change.position
    @setState(categories: reorderedCategories)

  _getNewPositions: (cat, insertIdx) ->
    # Хитрые разборки с целью несколько минимизировать объём обновлений
    # Оптимальный алгоритм уж делать не стал - только минимальная оптимизация
    # в частных случаях

    oldPositions =
      _.filter @state.categories, (i) -> i.parent_id == cat.parent_id
        .sort((a, b) -> a.position > b.position)

    originalIdx = _.findIndex oldPositions, (i) -> i.id == cat.id

    # Нужно ли менять позицию вообще
    if insertIdx == originalIdx or insertIdx == originalIdx + 1
      return []

    leftCat = oldPositions[insertIdx - 1] unless insertIdx < 1
    rightCat = oldPositions[insertIdx] unless insertIdx > oldPositions.length - 1

    # Если вставка в конец, это просто
    if !rightCat
      return [{
        id: cat.id
        position: leftCat.position + 1
      }]

    # Если вставка в начало, имитируем левый элемент
    # для упрощения последующих алгоритмов
    if !leftCat
      leftCat =
        position: -1
        id:       null

    # Если есть "место" в номерах позиций - просто используем его
    posDiff = rightCat.position - leftCat.position
    if posDiff > 1
      return [{
        id:       cat.id
        position: leftCat.position + 1
      }]

    # Если оптимизации не сработали, просто сдвигаем хвост вниз
    slicePosition = leftCat.position + 1
    newPositions = [{
      id:       cat.id,
      position: slicePosition
      name:     cat.name
    }]
    oldTail = oldPositions[insertIdx..]
    oldTail = _.reject oldTail, (i) -> i.id == cat.id

    for catToShift in oldTail
      minPosition = slicePosition + 1
      currentPosition = catToShift.position
      # Проверяем: возможно, не надо двигать все элементы
      if currentPosition < minPosition
        currentPosition = minPosition
        newPositions.push {
          id:       catToShift.id
          position: currentPosition
          name:     catToShift.name
        }
        slicePosition = currentPosition + 1

    return newPositions
