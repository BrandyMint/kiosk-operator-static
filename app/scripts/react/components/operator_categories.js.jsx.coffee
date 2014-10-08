###* @jsx React.DOM ###

window.OperatorCategories = React.createClass
  propTypes:
    categories:       React.PropTypes.array.isRequired

  getInitialState: ->
    categories:       @props.categories
    selectedCategory: null

  getDefaultProps: ->
    categories:
      [
        {
          id: 100
          name: "Украшение на тело"
          full_name: "Украшение на тело"
          parent_id: null
          updated_at: "2014-09-28T23:42:13.261+04:00"
          position: 24
          count: 123
        }
        {
          id: 102
          name: "Браслет"
          full_name: "Браслет"
          parent_id: null
          updated_at: "2014-09-28T23:42:14.937+04:00"
          position: 22
          count: 321
        }
      ]

  render: ->
    subcategories = @_getSubcategories()

    return `<div>
              <div className= "col-md-6 user-select-none">
                <OperatorCategories_NewCat onCategoryCreate={ this.handleCategoryCreate } />
                <br />
                <OperatorCategories_List categories=       { this.state.categories }
                                         onListItemClick=  { this.handleCategoryItemClick }
                                         onCategoryDelete= { this.handleCategoryDelete }
                                         onCategoryUpdate= { this.handleCategoryUpdate }
                                         onCategoryReorder={ this.handleCategoryReorder } />
              </div>
              <div className="col-md-6">
                { subcategories }
              </div>
            </div>`

  _getSubcategories: ->
    if @state.selectedCategory
      `<OperatorCategories_Subcategories selectedCategory={ this.state.selectedCategory } />`

  handleCategoryItemClick: (cat) ->
    @setState(selectedCategory: cat)

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
    # todo: http delete

  handleCategoryUpdate: (cat) ->
    @setState(categories: _.map @state.categories, (i) -> if i.id == cat.id then cat else i)
    # todo: http put

  handleCategoryCreate: (name) ->
    @setState(categories: @state.categories.concat([@_getNewCategory(name)]))
    # todo: http post + update id

  handleCategoryReorder: (cat, insertIdx) ->
    positionChanges = @_getNewPositions cat, insertIdx
    if positionChanges.length
      @_applyPositions positionChanges
    # todo: http update

  _getNewCategory: (name) ->
    # Стратегию генерации временного id нужно скорректировать по api
    tmpId = 100000 + Math.floor(Math.random() * 100000)
    # todo: фильтровать по произвольному parent_id
    if (@state.categories.length)
      lastPosition = (_.max _.filter(@state.categories, (i) -> i.parent_id == null), (j) -> j.position).position
    else
      lastPosition = 0
    return {
      "id":            tmpId
      "name":          name
      "parent_id":     null
      "count":         0
      "position":      lastPosition + 1
      "has_children?": false
    }

  _applyPositions: (changes) ->
    reorderedCategories = @state.categories.slice(0)
    for category in reorderedCategories
      for change in changes
        if category.id == change.id
          category.position = change.position
    @setState(categories: reorderedCategories)

  _getNewPositions: (cat, insertIdx) ->
    # Хитрые разборки с целью несколько минимизировать объём обновлений
    # Оптимальный алгоритм уж делать не стал - так, только минимальная оптимизация
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
