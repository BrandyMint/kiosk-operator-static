###* @jsx React.DOM ###

###*global $, React, OperatorCategoriesStore, OperatorCategoriesActions ###

#ReactCSSTransitionGroup = React.addons.CSSTransitionGroup

DRAG_DELAY  = 100 # мс
DRAG_REVERT = 100 # мс

window.OperatorCategories_List = React.createClass
  propTypes:
    parentCategory:   React.PropTypes.object
    selectedCategory: React.PropTypes.object
    onSelectCategory: React.PropTypes.func.isRequired

  getInitialState: ->
    parentCategory:   @props.parentCategory
    categoriesToShow: OperatorCategoriesStore.getSortedCategoriesByParent @props.parentCategory

  componentDidMount: ->
    OperatorCategoriesStore.addChangeListener @_onChange

    $(@refs.list.getDOMNode()).sortable {
      placeholder: 'adm-categories-item __dropzone'
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
                                isActive=          { that._isCategoryActive(cat) }
                                onSelectCategory=  { that.props.onSelectCategory } />`

    return `<div className="adm-categories-list">
              <span ref="list">
                { categoryNodes }
              </span>
              <OperatorCategories_CreateForm parentCategory= { this.props.parentCategory } />
            </div>`

  _onChange: ->
    @setState
      categoriesToShow: OperatorCategoriesStore.getSortedCategoriesByParent @state.parentCategory

  _isCategoryActive: (cat) ->
    selectedCat = @props.selectedCategory
    if selectedCat and not (@state.parentCategory and @state.parentCategory.id == selectedCat.id)
      (cat.id == selectedCat.id) or (cat.id == selectedCat.parent_id)
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
