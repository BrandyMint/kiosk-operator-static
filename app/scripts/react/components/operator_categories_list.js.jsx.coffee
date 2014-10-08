###* @jsx React.DOM ###

window.OperatorCategories_List = React.createClass
  propTypes:
    categories:          React.PropTypes.array.isRequired
    parentCategoryId:    React.PropTypes.number
    onListItemClick:     React.PropTypes.func.isRequired
    onCategoryDelete:    React.PropTypes.func.isRequired
    onCategoryUpdate:    React.PropTypes.func.isRequired
    onCategoryReorder:   React.PropTypes.func

  getInitialState: ->
    needDropZone:    false
    dropTargetIndex: null
    beDragTarget:    false

  render: ->
    that = @
    categoriesToShow =
      _.filter(@props.categories, (i) -> i.parent_id == that.props.parentCategoryId)
        .sort((a, b) -> a.position > b.position)

    # ReactCSSTransitionGroup = React.addons.CSSTransitionGroup

    # Подготовка списка категорий при необходимости со вставленной в него дроп-зоной
    categoryNodes = []
    categoriesToShow.map (cat, i) ->
      if that.state.needDropZone and that.state.dropTargetIndex == i
        categoryNodes.push(
          `<OperatorCategories_Item key=               { 99999 }
                                    isDropZone=        { true }
                                    onLeaveDropZone=   { that.handleLeaveDropZone } />`)
      categoryNodes.push(
          `<OperatorCategories_Item key=               { cat.id }
                                    idx=               { i }
                                    category=          { cat }
                                    onItemClick=       { that.props.onListItemClick }
                                    onCategoryDelete=  { that.props.onCategoryDelete }
                                    onCategoryUpdate=  { that.props.onCategoryUpdate }
                                    onDragStart=       { that.handleDragStart }
                                    onDragEnd=         { that.handleDragEnd }
                                    onDragOver=        { that.handleDragOver }
                                    beDragTarget=      { that.state.beDragTarget } />`)
    if that.state.needDropZone and that.state.dropTargetIndex == categoriesToShow.length
      categoryNodes.push(
        `<OperatorCategories_Item key=               { 99999 }
                                  isDropZone=        { true }
                                  onLeaveDropZone=   { that.handleLeaveDropZone } />`)

    return `<div className="operator-categories">
              {/*
                Не удалось заставить анимацию нормально ужится с drag&drop.
                Требуется доработка.
              */}
              {/*<ReactCSSTransitionGroup transitionName="operator-categories-transition">*/}
                { categoryNodes }
              {/*</ReactCSSTransitionGroup>*/}
            </div>`

  handleDragStart: ->
    @setState(beDragTarget: true)

  handleDragEnd: (cat) ->
    @setState {
      needDropZone: false
      beDragTarget: false
    }
    @props.onCategoryReorder cat, @state.dropTargetIndex

  handleDragOver: (idx, isUpper) ->
    dzIdx = idx + (if isUpper then 0 else 1)
    @setState {
      needDropZone:    true
      dropTargetIndex: dzIdx
    }

  handleLeaveDropZone: ->
    @setState(needDropZone: false)
