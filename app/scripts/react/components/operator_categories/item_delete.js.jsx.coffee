###* @jsx React.DOM ###

###*global React, OperatorCategoriesActions ###

DELETE_TIMEOUT = 5 * 1000 # (мс) Через сколько самозакрывается форма подтверждения удаления 

window.OperatorCategories_ItemDelete = React.createClass
  propTypes:
    category:         React.PropTypes.object
    onDeleteEnd:      React.PropTypes.func

  getInitialState: ->
    delTimeOutHandle: setTimeout @props.onDeleteEnd, DELETE_TIMEOUT

  componentWillUnmount: ->
    clearTimeout @state.delTimeOutHandle

  render: ->
    `<span>

      <span className="operator-categories__item-title">
        &nbsp;&nbsp;&nbsp;
        { this.props.category.name }
        &nbsp;&nbsp;&nbsp;
        <span className="operator-categories__item-counter">
          { this.props.category.products_count }
        </span>
      </span>

      <input type="button"
             onClick={ this.props.onDeleteEnd }
             className="pull-right btn btn-default btn-xs operator-categories__item-cancel-edit"
             value="Отменить" />
      <input type="button"
             onClick={ this.handleDelete }
             className="pull-right btn btn-danger btn-xs operator-categories__item-delete"
             value="Удалить" />

      <span className="pull-right">
        <strong>
          Удалить категорию?
          &nbsp;&nbsp;
        </strong>
      </span>

      <span className="clearfix"></span>

    </span>`

  handleDelete: (e) ->
    e.preventDefault()
    OperatorCategoriesActions.deleteCategory @props.category
