###* @jsx React.DOM ###

###*global React, OperatorCategoriesActions ###

window.OperatorCategories_ItemEdit = React.createClass
  propTypes:
    category:         React.PropTypes.object
    onDeleteStart:    React.PropTypes.func
    onEditEnd:        React.PropTypes.func

  componentDidMount: ->
    inputNode = @refs.input.getDOMNode()
    inputNode.focus()
    inputNode.selectionStart = inputNode.selectionEnd = inputNode.value.length

  render: ->
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
    @_cancelEdit()

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
        @_cancelEdit()

  _confirmEdit: ->
    updatedCategory = @props.category
    updatedCategory.name = @refs.input.getDOMNode().value
    OperatorCategoriesActions.updateCategory updatedCategory
    @props.onEditEnd()

  _cancelEdit: ->
    @props.onEditEnd()
