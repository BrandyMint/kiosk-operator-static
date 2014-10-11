###* @jsx React.DOM ###

###*global React, OperatorCategoriesActions ###

STATE_INPUT   = 'input'
STATE_POSTING = 'posting'
STATE_ERROR   = 'error'

window.OperatorCategories_CreateForm = React.createClass
  propTypes:
    parentCategoryId: React.PropTypes.number
    onFinish:      React.PropTypes.func

  getInitialState: ->
    currentState: STATE_INPUT

  componentDidMount : -> AppHelpers.reselectAndFocus @refs.input.getDOMNode()

  render: ->
    switch @state.currentState
      when STATE_INPUT
        @inputTag()
      when STATE_POSTING
        `<div>Создаю..</div>`
      when STATE_ERROR
        `<div>fataility</div>`

  inputTag: ->
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
    OperatorCategoriesService.createCategory
      name:      @refs.input.getDOMNode().value
      parent_id: @props.parentCategoryId
      success:   @props.onFinish
      error:     @handleError

  handleError: ->
    @setState currentState: STATE_ERROR
