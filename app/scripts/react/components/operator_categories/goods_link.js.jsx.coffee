###* @jsx React.DOM ###

###*global React, OperatorCategoriesSelectedStore, Routes ###

getStateFromStore = ->
  return {
    selectedCategory: OperatorCategoriesSelectedStore.getSelectedCategory()
  }

window.OperatorCategories_GoodsLink = React.createClass
  getInitialState: ->
    getStateFromStore()

  componentDidMount: ->
    OperatorCategoriesSelectedStore.addChangeListener @_onChange

  componentWillUnmount: ->
    OperatorCategoriesSelectedStore.removeChangeListener @_onChange

  render: ->
    if @state.selectedCategory
      productsUrl = Routes.products_by_category_url @state.selectedCategory.id
      count = @state.selectedCategory.products_count
      return `<ul className="nav nav-pills nav-stacked">
                <li>
                  <a href={ productsUrl }>
                    <i>Товары (<span>{ count }</span>)</i>
                  </a>
                </li>
              </ul>`
    else
      null

  _onChange: ->
    @setState getStateFromStore()
