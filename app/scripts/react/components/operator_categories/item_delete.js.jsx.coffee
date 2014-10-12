###* @jsx React.DOM ###

###*global React, OperatorCategoriesActions ###

STATE_INPUT    = 'input'
STATE_DELETING = 'deleting'
STATE_ERROR    = 'error'

DELETE_TIMEOUT = 5 * 1000 # (мс) Через сколько самозакрывается форма подтверждения удаления 

window.OperatorCategories_ItemDelete = React.createClass
  propTypes:
    category:         React.PropTypes.object.isRequired
    onFinish:         React.PropTypes.func.isRequired

  getInitialState: ->
    currentState:     STATE_INPUT
    delTimeOutHandle: setTimeout @props.onFinish, DELETE_TIMEOUT

  componentWillUnmount: ->
    clearTimeout @state.delTimeOutHandle

  render: ->
    switch @state.currentState
      when STATE_INPUT
        @_inputForm()
      when STATE_DELETING
        `<span>
          &nbsp;&nbsp;&nbsp;
          <i>Удаление категории...</i>
        </span>`
      when STATE_ERROR
        `<span>
          &nbsp;&nbsp;&nbsp;
          <i>Ошибка удаления категории.</i>
        </span>`

  _inputForm: ->
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
             onClick={ this.props.onFinish }
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
    clearTimeout @state.delTimeOutHandle
    @setState(currentState: STATE_DELETING)
    OperatorCategoriesService.deleteCategory
      category: @props.category
      success:  ->
      error:    @handleError

  handleError: (e) ->
    @setState(currentState: STATE_ERROR)
