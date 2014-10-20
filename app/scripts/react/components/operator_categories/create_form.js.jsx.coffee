###* @jsx React.DOM ###

###*global React, OperatorCategoriesActions ###

STATE_INPUT   = 'input'
STATE_POSTING = 'posting'
STATE_ERROR   = 'error'

window.OperatorCategories_CreateForm = React.createClass
  propTypes:
    parentCategory:   React.PropTypes.object

  getInitialState: ->
    currentState: STATE_INPUT

  render: ->
    switch @state.currentState
      when STATE_INPUT
        @_inputTag()
      when STATE_POSTING
        `<div className="adm-categories-item">
           <span className="adm-categories-item-name text-muted">
             { this.state.newName }
           </span>
           <span className="adm-categories-item-name">
             <i className="fa fa-spinner fa-spin" />
           </span>
         </div>`
      when STATE_ERROR
        `<div>Ошибка создания категории.</div>`

  _inputTag: ->
    `<div className="adm-categories-item __edit">
      <input className=    "adm-categories-item-field"
             type=         "text"
             placeholder=  { "Новая категория" }
             ref=          "input"
             onKeyDown=    { this.handleInputKeyDown }
             onBlur=       { this.handleInputBlur } />
    </div>`

  handleInputKeyDown: (e) ->
    switch e.key
      when "Enter"
        e.preventDefault()
        @_createCategory()
      when "Escape"
        e.preventDefault()
        @_blur()

  handleInputBlur: (e) ->
    e.preventDefault()
    @_blur()

  _createCategory: ->
    @setState {
      currentState: STATE_POSTING
      newName: @refs.input.getDOMNode().value
    }
    parent_id = if @props.parentCategory then @props.parentCategory.id else null
    OperatorCategoriesService.createCategory
      name:      @refs.input.getDOMNode().value
      parent_id: parent_id
      success:   @_refresh
      error:     @handleError

  _refresh: ->
    that = @
    @setState { currentState: STATE_INPUT }, ->
      inputNode = that.refs.input.getDOMNode()
      inputNode.value = ""
      AppHelpers.reselectAndFocus inputNode

  _blur: ->
    that = @
    @setState { currentState: STATE_INPUT }, ->
      inputNode = that.refs.input.getDOMNode()
      inputNode.value = ""
      $(inputNode).blur()

  handleError: ->
    @setState currentState: STATE_ERROR
