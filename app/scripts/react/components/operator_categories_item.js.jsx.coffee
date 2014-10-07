###* @jsx React.DOM ###

# Через сколько самозакрывается форма подтверждения удаления (мс)
DELETE_TIMEOUT = 5 * 1000

window.OperatorCategories_Item = React.createClass
  propTypes:
    category:         React.PropTypes.object.isRequired
    onItemClick:      React.PropTypes.func.isRequired
    onCategoryDelete: React.PropTypes.func.isRequired
    onCategoryUpdate: React.PropTypes.func.isRequired

  getInitialState: ->
    status: 'view'

  componentDidUpdate: ->
    if @state.status == 'edit'
      inputNode = @refs.input.getDOMNode()
      inputNode.focus()
      inputNode.selectionStart = inputNode.selectionEnd = inputNode.value.length

  componentWillUnmount: ->
    clearTimeout @state.delTimeOutHandle

  render: ->
    viewTemplate =
      `<div className="hoverable-container operator-categories__item">

        <a className="operator-categories__item-title"
           onClick={ this.handleItemClick }>
          <i className="fa fa-bars" />
          &nbsp;&nbsp;&nbsp;
          <span>
            { this.props.category.name }
          </span>
          &nbsp;&nbsp;&nbsp;
          <span className="operator-categories__item-counter">
            { this.props.category.count }
          </span>
          <span className="pull-right">
            <i className="fa fa-angle-right text-muted" />
          </span>
        </a>

        <a className="hoverable operator-categories__item-delete pull-right"
           onClick={ this.handleDeleteStart }>
          <i className="fa fa-times" />
        </a>

        <a className="hoverable operator-categories__item-edit pull-right"
           onClick={ this.handleEditStart }>
          <i className="fa fa-pencil" />
        </a>

        <span className="clearfix"></span>

      </div>`

    editTemplate =
      `<div className="hoverable-container operator-categories__item">
        <i className="fa fa-bars" />
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
           onClick={ this.handleDeleteStart }>
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
      </div>`

    deleteTemplate =
      `<div className="hoverable-container operator-categories__item">

        <span className="operator-categories__item-title">
          <i className="fa fa-times" />
          &nbsp;&nbsp;&nbsp;
          <span>
            Удалить категорию
            &nbsp;
            <strong>
              { this.props.category.name }
            </strong>
            &nbsp;
            <span className="operator-categories__item-counter">
              (товаров: { this.props.category.count })
            </span>
            &nbsp;?
          </span>
        </span>

        <input type="button"
               onClick={ this.handleDeleteCancel }
               className="pull-right btn btn-default btn-xs operator-categories__item-cancel-edit"
               value="Отменить" />
        <input type="button"
               onClick={ this.handleDelete }
               className="pull-right btn btn-danger btn-xs operator-categories__item-delete"
               value="Удалить" />

        <span className="clearfix"></span>

      </div>`

    return switch @state.status
      when 'view' then viewTemplate
      when 'edit' then editTemplate
      when 'delete' then deleteTemplate

  handleItemClick: (e) ->
    e.preventDefault()
    @props.onItemClick @props.category

  handleEditStart: (e) ->
    e.preventDefault()
    @setState(status: 'edit')

  handleEditCancel: (e) ->
    e.preventDefault()
    @cancelEdit()

  handleEditConfirm: (e) ->
    e.preventDefault()
    @confirmEdit()

  handleInputKeyDown: (e) ->
    switch e.key
      when "Enter"
        e.preventDefault()
        @confirmEdit()
      when "Escape"
        e.preventDefault()
        @cancelEdit()

  handleDeleteStart: (e) ->
    e.preventDefault()
    that = @
    toHandle = setTimeout(->
      that.cancelDelete()
    , DELETE_TIMEOUT)
    @setState {
      delTimeOutHandle: toHandle
      status:           'delete'
    }

  handleDeleteCancel: (e) ->
    e.preventDefault()
    clearTimeout @state.delTimeOutHandle
    @setState(status: 'view')

  handleDelete: (e) ->
    e.preventDefault()
    @confirmDelete()

  confirmEdit: ->
    updatedCategory = @props.category
    updatedCategory.name = @refs.input.getDOMNode().value
    @props.onCategoryUpdate updatedCategory
    @setState(status: 'view')

  cancelEdit: ->
    @setState(status: 'view')

  confirmDelete: ->
    @props.onCategoryDelete @props.category

  cancelDelete: ->
    if (@state.status == 'delete')
      @setState(status: 'view')
