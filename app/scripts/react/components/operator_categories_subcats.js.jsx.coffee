###* @jsx React.DOM ###

window.OperatorCategories_Subcategories = React.createClass
  propTypes:
    selectedCategory: React.PropTypes.object.isRequired

  render: ->
    # todo: Возможно, базовый url нужно принимать в параметрах?
    productsUrl = 'products?category_id=' + @props.selectedCategory.id

    `<div>
      <a className="btn btn-default" href="#todo">Новая подкатегория</a>
      <br />
      {/* todo: Subcategory list */}
      <br />
      <ul className="nav nav-pills nav-stacked">
        <li>
          <a href={productsUrl}>
            <i>Товары (<span>{this.props.selectedCategory.count}</span>)</i>
          </a>
        </li>
      </ul>
    </div>`
