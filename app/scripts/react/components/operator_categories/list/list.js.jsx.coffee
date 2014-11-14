###* @jsx React.DOM ###

DRAG_DELAY  = 100
DRAG_REVERT = 100

window.OperatorCategories_List = React.createClass

  propTypes:
    parentCategory:       React.PropTypes.object
    selectedCategory:     React.PropTypes.object
    includeSubcategories: React.PropTypes.bool.isRequired
    onSelectCategory:     React.PropTypes.func.isRequired

  getInitialState: ->
    parentCategory:   @props.parentCategory
    categoriesToShow: OperatorCategoriesStore.getSortedCategoriesByParent @props.parentCategory

  componentDidMount: ->
    OperatorCategoriesStore.addChangeListener @_onStoreChange

    $(@refs.list.getDOMNode()).sortable {
      scope: 'categoriesReorder'
      placeholder: 'adm-categories-item __dropzone'
      forcePlaceholderSize: true
      revert: DRAG_REVERT
      delay: DRAG_DELAY
      stop: @handleDrop
    }

  componentWillReceiveProps: (nextProps) ->
    @setState
      parentCategory:   nextProps.parentCategory
      categoriesToShow: OperatorCategoriesStore.getSortedCategoriesByParent nextProps.parentCategory

  componentWillUnmount: ->
    OperatorCategoriesStore.removeChangeListener @_onStoreChange

  render: ->
    that = @
    categories = @state.categoriesToShow.map (cat) ->
      `<OperatorCategories_ListItem
           category={ cat }
           isActive={ that._isCategoryActive(cat) }
           onSelectCategory={ that.props.onSelectCategory }
           key={ cat.id } />`

    return `<div className="adm-categories-list">

              <OperatorCategories_ListItemWithSubcategories
                  category={ this.props.parentCategory }
                  isActive={ this.props.selectedCategory.id == this.props.parentCategory.id &&
                             this.props.includeSubcategories == true }
                  onSelectCategory={ this.props.onSelectCategory } />

              <span ref="list">{ categories }</span>

              <OperatorCategories_ListItemWithoutCategory
                  category={ this.props.parentCategory }
                  isActive={ this.props.selectedCategory.id == this.props.parentCategory.id &&
                             this.props.includeSubcategories == false }
                  onSelectCategory={ this.props.onSelectCategory } />

              <OperatorCategories_CreateForm parentCategory={ this.props.parentCategory } />

            </div>`

  _isCategoryActive: (cat) ->
    selectedCategory = @props.selectedCategory

    if selectedCategory and not (@state.parentCategory and @state.parentCategory.id == selectedCategory.id)
      (cat.id == selectedCategory.id) or (cat.id == selectedCategory.parent_id)
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
    @props.onSelectCategory @props.parentCategory

  _onStoreChange: ->
    @setState
      categoriesToShow: OperatorCategoriesStore.getSortedCategoriesByParent @state.parentCategory