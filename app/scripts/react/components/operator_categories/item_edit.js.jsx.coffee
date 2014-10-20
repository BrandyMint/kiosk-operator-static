###* @jsx React.DOM ###

###*global React, OperatorCategoriesActions ###

STATE_INPUT   = 'input'
STATE_POSTING = 'posting'
STATE_ERROR   = 'error'

window.OperatorCategories_ItemEdit = React.createClass
  propTypes:
    category:         React.PropTypes.object.isRequired
    onDeleteStart:    React.PropTypes.func.isRequired
    onFinish:         React.PropTypes.func.isRequired

  getInitialState: ->
    currentState: STATE_INPUT

  componentDidMount: ->
     AppHelpers.reselectAndFocus @refs.input.getDOMNode()

  render: ->
    switch @state.currentState
      when STATE_INPUT
        @_inputForm()
      when STATE_POSTING
        `<span>
           <span className="adm-categories-item-name text-muted">
             { this.state.newName }
           </span>
           <span className="adm-categories-item-name">
             <i className="fa fa-spinner fa-spin" />
           </span>
         </span>`
      when STATE_ERROR
        `<span>
          &nbsp;&nbsp;&nbsp;
          <i>Ошибка обновления категории.</i>
        </span>`

  _inputForm: ->
    `<span>
      <input className=    "adm-categories-item-field"
             type=         "text"
             ref=          "input"
             defaultValue= { this.props.category.name }
             onKeyDown=    { this.handleInputKeyDown }
             onBlur=       { this.handleInputBlur } />
      <span className="adm-categories-item-remove"
            onClick=  { this.handleDeleteClick } />
    </span>`

  handleInputBlur: (e) ->
    e.preventDefault()
    @_confirmEdit()

  handleInputKeyDown: (e) ->
    switch e.key
      when "Enter"
        e.preventDefault()
        @_confirmEdit()
      when "Escape"
        e.preventDefault()
        @props.onFinish()

  handleError: ->
    @setState(currentState: STATE_ERROR)

  handleDeleteClick: (e) ->
    e.preventDefault()
    if window.confirm 'Удалить категорию "' + @props.category.name + '"?'
      OperatorCategoriesService.deleteCategory
        category: @props.category
        success:  ->
        error:    @handleError

  _confirmEdit: ->
    @setState {
      currentState: STATE_POSTING
      newName:      @refs.input.getDOMNode().value
    }
    updatedCategory = _.clone @props.category
    updatedCategory.name = @refs.input.getDOMNode().value
    OperatorCategoriesService.updateSingleCategory
      category: updatedCategory
      success:  @props.onFinish
      error:    @handleError
