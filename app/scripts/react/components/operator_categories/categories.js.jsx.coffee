###* @jsx React.DOM ###

###*global React, OperatorCategoriesStore, OperatorCategoriesSelectedStore, OperatorCategoriesActions ###

window.OperatorCategories = React.createClass
  propTypes:
    categories:          React.PropTypes.array
 
  getInitialState: ->
    categories:          []
    selectedCategory:    null
    selectedSubcategory: null

  getDefaultProps: ->
    categories:          null
    mockMode:            false

  componentDidMount: ->
    if (@props.categories)
      @setState(categories: @props.categories)
    else
      that = @
      OperatorCategoriesStore.addChangeListener @_onChange

    OperatorCategoriesSelectedStore.addChangeListener @_onChange

  componentWillUnmount: ->
    OperatorCategoriesStore.removeChangeListener @_onChange
    OperatorCategoriesSelectedStore.removeChangeListener @_onChange

  render: ->
    subcategoriesPane = @_getSubcategoriesPane()

    return `<div>
              <div className= "col-md-6 user-select-none">
                <OperatorCategories_List categoryLevel={ 0 } />
              </div>
              <div className="col-md-6 user-select-none">
                { subcategoriesPane }
                <br />
                <OperatorCategories_GoodsLink />
              </div>
            </div>`

  _getSubcategoriesPane: ->
    if @state.selectedCategory
      `<OperatorCategories_List categoryLevel={ 1 } />`

  _onChange: ->
    selCat = OperatorCategoriesSelectedStore.getSelectedCategory()
    if selCat and selCat.parentId
      selSubCat = selCat
      selCat = _.find @state.categories, (i) -> i.id == selCat.parentId

    @setState {
      categories: OperatorCategoriesStore.getAllCategories()
      selectedCategory: selCat,
      selectedSubcategory: selSubCat
    }

  handleCategoryCreate: (parentId, name) ->
    OperatorCategoriesActions.createCategory {
      name: name
      parentId: parentId
    }
