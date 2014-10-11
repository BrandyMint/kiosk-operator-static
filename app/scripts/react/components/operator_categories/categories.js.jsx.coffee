###* @jsx React.DOM ###

###*global React, OperatorCategoriesSelectedStore,
  OperatorCategoriesServerActions, OperatorCategoriesStore###

window.OperatorCategories = React.createClass
  propTypes:
    categories:     React.PropTypes.array
 
  getInitialState: ->
    rightParentCat: null

  getDefaultProps: ->
    categories:     null

  componentDidMount: ->
    # Если категории пришли в props, имитируем загрузку с сервера
    if (@props.categories)
      OperatorCategoriesServerActions.categoriesLoaded @props.categories

    OperatorCategoriesSelectedStore.addChangeListener @_onChange

  componentWillUnmount: ->
    OperatorCategoriesSelectedStore.removeChangeListener @_onChange

  render: ->
    subcategoriesPane = @_getSubcategoriesPane()

    return `<div>
              <div className= "col-md-6 user-select-none">
                <OperatorCategories_List parentCategory={ null } />
              </div>
              <div className="col-md-6 user-select-none">
                { subcategoriesPane }
                <br />
                <OperatorCategories_GoodsLink />
              </div>
            </div>`

  _getSubcategoriesPane: ->
    if @state.rightParentCat
      `<OperatorCategories_List parentCategory={ this.state.rightParentCat } />`

  _onChange: ->
    selectedCat = OperatorCategoriesSelectedStore.getSelectedCategory()
    if selectedCat and selectedCat.parent_id
      rightParentCat = OperatorCategoriesStore.getCategoryById selectedCat.parent_id
    else
      rightParentCat = selectedCat

    @setState(rightParentCat: rightParentCat)
