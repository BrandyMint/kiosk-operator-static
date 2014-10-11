###* @jsx React.DOM ###

###*global $, React, OperatorCategoriesStore, OperatorCategoriesSelectedStore, OperatorCategoriesActions ###

#ReactCSSTransitionGroup = React.addons.CSSTransitionGroup

DRAG_DELAY  = 100 # мс
DRAG_REVERT = 100 # мс

window.OperatorCategories_List = React.createClass
  propTypes:
    parentCategory: React.PropTypes.object

  getInitialState: ->
    parentCategory:   @props.parentCategory
    categoriesToShow: OperatorCategoriesStore.getSortedCategoriesByParent @props.parentCategory

  componentDidMount: ->
    OperatorCategoriesStore.addChangeListener @_onChange

    $(@refs.list.getDOMNode()).sortable {
      placeholder: 'operator-categories__item-dropzone'
      forcePlaceholderSize: true
      revert: DRAG_REVERT
      delay: DRAG_DELAY
      stop: @handleDrop
    }

  componentWillReceiveProps: (newProps) ->
    @setState
      parentCategory:   newProps.parentCategory
      categoriesToShow: OperatorCategoriesStore.getSortedCategoriesByParent newProps.parentCategory

  componentWillUnmount: ->
    OperatorCategoriesStore.removeChangeListener @_onChange

  render: ->
    that = @
    categoryNodes = @state.categoriesToShow.map (cat) ->
      `<OperatorCategories_Item key=               { cat.id }
                                category=          { cat }
                                onDragStart=       { that.handleDragStart }
                                onDragEnd=         { that.handleDragEnd }
                                onDragOver=        { that.handleDragOver }
                                beDragTarget=      { that.state.beDragTarget } />`

    return `<div>
              <OperatorCategories_Create parentCategory={ this.state.parentCategory } />
              <br />
              <div className= "operator-categories"
                   ref=       "list">
                { categoryNodes }
              </div>
            </div>`

  _onChange: ->
    @setState
      categoriesToShow: OperatorCategoriesStore.getSortedCategoriesByParent @state.parentCategory

  handleDrop: (evt, ui) ->
    # Считываем нужные параметры перед завершением drag&drop, затем отменяем его.
    # Если не отменить, ui.sortable сам меняет порядок элементов в DOM,
    # что вступает в конфликт с рендерингом React, и всё ломается.
    srcId = parseInt ui.item.attr('data-objectid')
    insertIdx = ui.item.index()
    $(@refs.list.getDOMNode()).sortable 'cancel'
    OperatorCategoriesActions.reorderCategories srcId, insertIdx
