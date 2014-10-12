###* @jsx React.DOM ###

###*global React, OperatorCategoriesActions ###

STATE_INPUT   = 'input'
STATE_POSTING = 'posting'
STATE_ERROR   = 'error'

window.OperatorCategories_CreateForm = React.createClass
  propTypes:
    parentCategory:   React.PropTypes.object
    onFinish:         React.PropTypes.func

  getInitialState: ->
    currentState: STATE_INPUT

  componentDidMount : ->
    AppHelpers.reselectAndFocus @refs.input.getDOMNode()

  render: ->
    switch @state.currentState
      when STATE_INPUT
        @_inputTag()
      when STATE_POSTING
        `<div>Создание категории...</div>`
      when STATE_ERROR
        `<div>Ошибка создания категории.</div>`

  _inputTag: ->
    `<div>
      <form accept-charset= "UTF-8"
            className=      "simple_form new_category">
        <div className="form-group string required category_name">
          <input ref=          "input"
                 type=         "text"
                 placeholder=  "Название категории"
                 className=    "string required form-control"
                 onKeyDown=    { this.handleInputKeyDown }
                 defaultValue= "" />
        </div>
        <p>
          <input className= "btn btn-primary"
                 type=      "submit"
                 onClick=   { this.handleCreate }
                 value=     "Добавить" />
          <input className= "btn btn-default"
                 type=      "button"
                 onClick=   { this.handleCancel }
                 value=     "Завершить" />
        </p>
      </form>
      <hr />
    </div>`

  handleCreate: (e) ->
    e.preventDefault()
    @_createCategory()

  handleCancel: (e) ->
    e.preventDefault()
    @props.onFinish()

  handleInputKeyDown: (e) ->
    switch e.key
      when "Enter"
        e.preventDefault()
        @_createCategory()
      when "Escape"
        e.preventDefault()
        @props.onFinish()

  _createCategory: ->
    @setState(currentState: STATE_POSTING)
    parent_id = if @props.parentCategory then @props.parentCategory.id else null
    OperatorCategoriesService.createCategory
      name:      @refs.input.getDOMNode().value
      parent_id: parent_id
      success:   @props.onFinish
      error:     @handleError

  handleError: ->
    @setState currentState: STATE_ERROR
