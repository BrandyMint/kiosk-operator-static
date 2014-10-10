###* @jsx React.DOM ###

###*global React, OperatorCategoriesActions ###

window.OperatorCategories_ItemView = React.createClass
  propTypes:
    category:           React.PropTypes.object
    onDeleteStart:      React.PropTypes.func
    onEditStart:        React.PropTypes.func

  render: ->
    `<span>
      <a className= "operator-categories__item-title"
         onClick=   { this.handleItemClick }>
        &nbsp;&nbsp;&nbsp;
        <span>
          { this.props.category.name }
        </span>
      </a>

      &nbsp;&nbsp;&nbsp;
      <span className="operator-categories__item-counter">
        { this.props.category.products_count }
      </span>
      <span className="pull-right">
        <i className="fa fa-angle-right text-muted" />
      </span>

      <a className= "hoverable operator-categories__item-delete pull-right"
         onClick=   { this.props.onDeleteStart }>
        <i className="fa fa-times" />
      </a>

      <a className= "hoverable operator-categories__item-edit pull-right"
         onClick=   { this.props.onEditStart }>
        <i className="fa fa-pencil" />
      </a>

      <span className="clearfix"></span>

    </span>`

  handleItemClick: (e) ->
    e.preventDefault()
    OperatorCategoriesActions.categorySelected @props.category
