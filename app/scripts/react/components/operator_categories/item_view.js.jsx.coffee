###* @jsx React.DOM ###

###*global React, OperatorCategoriesActions ###

window.OperatorCategories_ItemView = React.createClass
  propTypes:
    category:           React.PropTypes.object.isRequired
    onEditStart:        React.PropTypes.func.isRequired

  render: ->
    `<span>
      <span>
        <span className="adm-categories-item-name">
          { this.props.category.name }
        </span>
        <span className="adm-categories-item-counter">
          { this.props.category.products_count }
        </span>
      </span>
      <button className="adm-btn-edit-category"
              title=    "Редактировать"
              onClick=  { this.props.onEditStart }>
        <span>
          Редактировать
        </span>
      </button>
    </span>`
