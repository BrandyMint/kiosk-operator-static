###* @jsx React.DOM ###

DRAG_DELAY  = 100
DRAG_REVERT = 100

window.OperatorCategories_List = React.createClass

  propTypes:
    parentCategory:   React.PropTypes.object
    currentCategory:  React.PropTypes.object
    onCategorySelect: React.PropTypes.func.isRequired

  getInitialState: ->
    parentCategory:   @props.parentCategory
    categoriesToShow: OperatorCategoriesStore.getSortedCategoriesByParent @props.parentCategory

  componentDidMount: ->
    OperatorCategoriesStore.addChangeListener @_onStoreChange

    # $(@refs.list.getDOMNode()).sortable {
    #   scope: 'categoriesReorder'
    #   placeholder: 'adm-categories-item __dropzone'
    #   forcePlaceholderSize: true
    #   revert: DRAG_REVERT
    #   delay: DRAG_DELAY
    #   stop: @handleDrop
    # }

  componentWillReceiveProps: (nextProps) ->
    @setState
      parentCategory:   nextProps.parentCategory
      categoriesToShow: OperatorCategoriesStore.getSortedCategoriesByParent nextProps.parentCategory

  componentWillUnmount: ->
    OperatorCategoriesStore.removeChangeListener @_onStoreChange

  render: ->
    that = @
    categories = @state.categoriesToShow.map (cat) ->
      `<OperatorCategories_ListItemManager
           category={ cat }
           isActive={ that._isCategoryActive(cat) }
           onCategorySelect={ that.props.onCategorySelect }
           key={ cat.id } />`

    return `<div className="adm-categories-list">

              <span ref="list">{ categories }</span>

              <OperatorCategories_CreateForm parentCategory={ this.props.parentCategory } />
            </div>`

  _isCategoryActive: (cat) ->
    currentCategory = @props.currentCategory

    if currentCategory and not (@state.parentCategory and @state.parentCategory.id == currentCategory.id)
      (cat.id == currentCategory.id) or (cat.id == currentCategory.parent_id)
    else
      false

  handleDrop: (evt, ui) ->
    # Считываем нужные параметры перед завершением drag&drop, затем отменяем его.
    # Если не отменить, ui.sortable сам меняет порядок элементов в DOM,
    # что вступает в конфликт с рендерингом React, и всё ломается.
    srcId = parseInt ui.item.attr('data-objectid')
    insertIdx = ui.item.index()
    $(@refs.list.getDOMNode()).sortable 'cancel'
    OperatorCategoriesService.reorderCategories srcId, insertIdx

  handleTotalCountClick: (e) ->
    e.preventDefault()
    @props.onCategorySelect @props.parentCategory

  _onStoreChange: ->
    @setState
      categoriesToShow: OperatorCategoriesStore.getSortedCategoriesByParent @state.parentCategory