###* @jsx React.DOM ###

###*global React, OperatorCategoriesActions ###

window.OperatorCategories_CreateForm = React.createClass
  propTypes:
    parentCategoryId: React.PropTypes.number
    caption:          React.PropTypes.string
    placeholder:      React.PropTypes.string
    onCreateEnd:      React.PropTypes.func

  componentDidMount : ->
    @_refreshAndFocusInput()

  render: ->
    `<div>
      <h3>{ this.props.caption }</h3>
      <form accept-charset= "UTF-8"
            className=      "simple_form new_category">
        <div className="form-group string required category_name">
          <input ref=          "input"
                 type=         "text"
                 placeholder=  { this.props.placeholder }
                 className=    "string required form-control"
                 onKeyDown=    { this.handleInputKeyDown }
                 defaultValue= "" />
        </div>
        <p>
          <input className= "btn btn-primary"
                 type=      "submit"
                 onClick=   { this.handleCreateConfirm }
                 value=     "Добавить" />
          <input className= "btn btn-default"
                 type=      "button"
                 onClick=   { this.handleCreateCancel }
                 value=     "Завершить" />
        </p>
      </form>
      <hr />
    </div>`

  handleCreateConfirm: (e) ->
    e.preventDefault()
    @_confirmCreate()

  handleCreateCancel: (e) ->
    e.preventDefault()
    @_cancelCreate()

  handleInputKeyDown: (e) ->
    switch e.key
      when "Enter"
        e.preventDefault()
        @_confirmCreate()
      when "Escape"
        e.preventDefault()
        @_cancelCreate()

  _refreshAndFocusInput: ->
    inputNode = @refs.input.getDOMNode()
    inputNode.value = ""
    inputNode.focus()
    inputNode.selectionStart = inputNode.selectionEnd = inputNode.value.length

  _confirmCreate: ->
    OperatorCategoriesActions.createCategory {
      name:      @refs.input.getDOMNode().value
      parent_id: @props.parentCategoryId 
    }
    @_refreshAndFocusInput()

  _cancelCreate: ->
    @props.onCreateEnd()
