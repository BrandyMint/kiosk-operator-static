###* @jsx React.DOM ###

###*global React, OperatorCategoriesSelectedStore, Routes ###

window.OperatorCategories_GoodsLink = React.createClass
  propTypes:
    selectedCategory: React.PropTypes.object

  render: ->
    if @props.selectedCategory
      productsUrl = Routes.products_by_category_url @props.selectedCategory.id
      count = @props.selectedCategory.products_count
      return `<ul className="nav nav-pills nav-stacked">
                <li>
                  <a href={ productsUrl }>
                    <i>Товары (<span>{ count }</span>)</i>
                  </a>
                </li>
              </ul>`
    else
      null
