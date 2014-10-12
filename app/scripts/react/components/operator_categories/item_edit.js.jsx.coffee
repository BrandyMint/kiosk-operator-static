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
          &nbsp;&nbsp;&nbsp;
          <i>Обновление категории...</i>
        </span>`
      when STATE_ERROR
        `<span>
          &nbsp;&nbsp;&nbsp;
          <i>Ошибка обновления категории.</i>
        </span>`

  _inputForm: ->
    `<span>
      &nbsp;&nbsp;&nbsp;
      <input type="text"
             ref="input"
             className="operator-categories__item-input"
             defaultValue={ this.props.category.name }
             onKeyDown={ this.handleInputKeyDown } />

      <span className="pull-right">
        <i className="fa fa-angle-right text-muted" />
      </span>

      <a className="hoverable operator-categories__item-delete pull-right"
         onClick={ this.props.onDeleteStart }>
        <i className="fa fa-times" />
      </a>
      <a className="hoverable operator-categories__item-cancel-edit pull-right"
         onClick={ this.handleEditCancel }>
        <i className="fa fa-times-circle" />
      </a>
      <a className="hoverable operator-categories__item-confirm-edit pull-right"
         onClick={ this.handleEditConfirm }>
        <i className="fa fa-check" />
      </a>
      <span className="clearfix"></span>
    </span>`

  handleEditCancel: (e) ->
    e.preventDefault()
    @props.onFinish()

  handleEditConfirm: (e) ->
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

  _confirmEdit: ->
    @setState(currentState: STATE_POSTING)
    updatedCategory = _.clone @props.category
    updatedCategory.name = @refs.input.getDOMNode().value
    OperatorCategoriesService.updateSingleCategory
      category: updatedCategory
      success:  @props.onFinish
      error:    @handleError
