###* @jsx React.DOM ###

###*global React, OperatorCategoriesStore, OperatorCategoriesSelectedStore, OperatorCategoriesActions ###

#ReactCSSTransitionGroup = React.addons.CSSTransitionGroup

window.OperatorCategories_List = React.createClass
  propTypes:
    categoryLevel:       React.PropTypes.number

  getInitialState: ->
    parentCategory = OperatorCategoriesSelectedStore.getSelectedCategoryForLevel @props.categoryLevel
    return {
      needDropZone:    false
      dropTargetIndex: null
      beDragTarget:    false
      parentCategoryId: if parentCategory then parentCategory.id else null
      categories: OperatorCategoriesStore.getAllCategories()
    }

  componentDidMount: ->
    OperatorCategoriesStore.addChangeListener @_onChange
    OperatorCategoriesSelectedStore.addChangeListener @_onChange

  componentWillUnmount: ->
    OperatorCategoriesStore.removeChangeListener @_onChange
    OperatorCategoriesSelectedStore.removeChangeListener @_onChange

  render: ->
    that = @

    categoriesToShow =
      _.filter(@state.categories, (i) -> i.parent_id == that.state.parentCategoryId)
        .sort((a, b) -> a.position - b.position)

    # Подготовка списка категорий при необходимости со вставленной в него дроп-зоной
    categoryNodes = []
    categoriesToShow.map (cat, i) ->
      if that.state.needDropZone and that.state.dropTargetIndex == i
        categoryNodes.push(
          `<OperatorCategories_ItemDropzone key={ "dz" } />`)
      categoryNodes.push(
          `<OperatorCategories_Item key=               { cat.id }
                                    idx=               { i }
                                    category=          { cat }
                                    onDragStart=       { that.handleDragStart }
                                    onDragEnd=         { that.handleDragEnd }
                                    onDragOver=        { that.handleDragOver }
                                    beDragTarget=      { that.state.beDragTarget } />`)
    if that.state.needDropZone and that.state.dropTargetIndex == categoriesToShow.length
      categoryNodes.push(
        `<OperatorCategories_ItemDropzone key={ "dz" } />`)

    return `<div>
              <OperatorCategories_Create parentCategoryId={ this.state.parentCategoryId } />
              <br />
              <div className="operator-categories">
                { categoryNodes }
              </div>
            </div>`

  _onChange: ->
    parentCategory = OperatorCategoriesSelectedStore.getSelectedCategoryForLevel @props.categoryLevel
    @setState {
      parentCategoryId: if parentCategory then parentCategory.id else null
      categories: OperatorCategoriesStore.getAllCategories()
    }

  handleDragStart: ->
    @setState(beDragTarget: true)

  handleDragEnd: (cat) ->
    @setState {
      needDropZone: false
      beDragTarget: false
    }
    OperatorCategoriesActions.reorderCategories cat, @state.dropTargetIndex

  handleDragOver: (idx, isUpper) ->
    dzIdx = idx + (if isUpper then 0 else 1)
    @setState {
      needDropZone:    true
      dropTargetIndex: dzIdx
    }
