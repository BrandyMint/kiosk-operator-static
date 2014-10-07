###* @jsx React.DOM ###

window.OperatorCategories_NewCat = React.createClass
  propTypes:
    parentCategoryId: React.PropTypes.number
    onCategoryCreate: React.PropTypes.func.isRequired

  getInitialState: ->
    creating: false

  componentDidUpdate : ->
    if @state.creating
      @_refreshAndFocusInput()

  render: ->
    text = if @props.parentCategoryId
      caption: "Добавить подкатегории"
      placeholder: "Наименование подкатегории"
    else
      caption: "Добавить новые категории"
      placeholder: "Наименование категории"

    displayTemplate =
      `<div>
        <a className="btn btn-default"
           onClick={ this.handleCreateStart }>
          { text.caption }
        </a>
      </div>`

    createTemplate =
      `<div>
        <h3>{ text.caption }</h3>
        <form accept-charset= "UTF-8"
              className=      "simple_form new_category">
          <div className="form-group string required category_name">
            <input ref=          "input"
                   type=         "text"
                   placeholder=  { text.placeholder }
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

    return if @state.creating
      createTemplate
    else
      displayTemplate

  handleCreateStart: (e) ->
    e.preventDefault()
    @setState(creating: true)

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
    if @state.creating
      inputNode = @refs.input.getDOMNode()
      inputNode.value = ""
      inputNode.focus()
      inputNode.selectionStart = inputNode.selectionEnd = inputNode.value.length

  _confirmCreate: ->
    @props.onCategoryCreate @props.parentCategoryId, @refs.input.getDOMNode().value
    @_refreshAndFocusInput()

  _cancelCreate: ->
    @setState(creating: false)
