###* @jsx React.DOM ###

# Через сколько самозакрывается форма подтверждения удаления (мс)
OPERATOR_CATEGORY_DELETE_TIMEOUT = 5 * 1000

window.OperatorCategories_Item = React.createClass
  propTypes:
    category:         React.PropTypes.object
    onItemClick:      React.PropTypes.func
    onCategoryDelete: React.PropTypes.func
    onCategoryUpdate: React.PropTypes.func

    # Drag & drop special
    idx:              React.PropTypes.number
    isDropZone:       React.PropTypes.bool
    onDragStart:      React.PropTypes.func
    onDragEnd:        React.PropTypes.func
    onDragOver:       React.PropTypes.func
    beDragTarget:     React.PropTypes.bool

  getInitialState: ->
    status:   if @props.isDropZone then 'dropzone' else 'view'
    dragging: false

  getDefaultProps: ->
    beDragTarget: false

  componentDidUpdate: ->
    if @state.status == 'edit'
      inputNode = @refs.input.getDOMNode()
      inputNode.focus()
      inputNode.selectionStart = inputNode.selectionEnd = inputNode.value.length

  componentWillUnmount: ->
    clearTimeout @state.delTimeOutHandle

  render: ->
    return switch @state.status
        when 'view'
          style = if @state.dragging
            position: 'absolute'
            left:     @state.left
            top:      @state.top
            width:    @state.elementWidth
          else
            {}

          cx = React.addons.classSet
          classes = cx {
            'hoverable-container':          true
            'operator-categories__item':    true
            'operator-categories-dragging': @state.dragging
          }

          `<div className=   { classes }
                style=       { style }
                onMouseOver= { this.handleMouseOver } >

            <i className=   "fa fa-bars operator-categories-drag-handle"
               onMouseDown= { this.handleGripZoneMoseDown } />
            <a className= "operator-categories__item-title"
               onClick=   { this.handleItemClick }>
              &nbsp;&nbsp;&nbsp;
              <span>
                { this.props.category.name }
              </span>
            </a>

            &nbsp;&nbsp;&nbsp;
            <span className="operator-categories__item-counter">
              { this.props.category.count }
            </span>
            <span className="pull-right">
              <i className="fa fa-angle-right text-muted" />
            </span>

            <a className= "hoverable operator-categories__item-delete pull-right"
               onClick=   { this.handleDeleteStart }>
              <i className="fa fa-times" />
            </a>

            <a className= "hoverable operator-categories__item-edit pull-right"
               onClick=   { this.handleEditStart }>
              <i className="fa fa-pencil" />
            </a>

            <span className="clearfix"></span>

          </div>`

        when 'edit'
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

        when 'delete'
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

        when 'dropzone'
          `<div className=    "hoverable-container operator-categories__item-dropzone"
                onMouseOver=  { this.handleMouseOver } >
            <span className="operator-categories__item-title">
              &nbsp;
            </span>
          </div>`

  handleItemClick: (e) ->
    e.preventDefault()
    @props.onItemClick @props.category

  handleEditStart: (e) ->
    e.preventDefault()
    @setState(status: 'edit')

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

  handleDeleteStart: (e) ->
    e.preventDefault()
    that = @
    toHandle = setTimeout(->
      that.cancelDelete()
    , OPERATOR_CATEGORY_DELETE_TIMEOUT)
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
    @_confirmDelete()

  _confirmEdit: ->
    updatedCategory = @props.category
    updatedCategory.name = @refs.input.getDOMNode().value
    @props.onCategoryUpdate updatedCategory
    @setState(status: 'view')

  _cancelEdit: ->
    @setState(status: 'view')

  _confirmDelete: ->
    @props.onCategoryDelete @props.category

  cancelDelete: ->
    if (@state.status == 'delete')
      @setState(status: 'view')

  # Функции, относящиеся к перетаскиванию.
  # Их бы абстрагироватьв какой-нибудь mixin, но пока не знаю как это сделать хорошо.

  handleGripZoneMoseDown: (e) ->
    if e.button == 0 # Left or only button
      e.stopPropagation()
      @_subscribeToMouseEvents()
      layerOffsetX = e.pageX - e.nativeEvent.layerX
      pageOffset = $(@getDOMNode()).position()

      @setState
        originX:      e.pageX
        originY:      e.pageY
        elementX:     pageOffset.left
        elementY:     pageOffset.top
        elementWidth: @getDOMNode().getBoundingClientRect().width

  handleMouseMove: (e) ->
    deltaX = e.pageX - @state.originX
    deltaY = e.pageY - @state.originY
    distance = Math.abs(deltaX) + Math.abs(deltaY)

    if !@state.dragging and distance > 5 # Drag threshold
      @setState(dragging: true)
      @props.onDragStart()
      @props.onDragOver @props.idx, @_isInUpperHalf e

    if @state.dragging
      @setState
        left: @state.elementX + deltaX + document.body.scrollLeft
        top: @state.elementY + deltaY + document.body.scrollTop

  handleMouseUp: (e) ->
    if @state.dragging
      @_unsubscribeFromMouseEvents()
      @setState(dragging: false)
      @props.onDragEnd @props.category

  handleMouseOver: (e) ->
    if !@state.dragging and @props.beDragTarget
      @props.onDragOver @props.idx, @_isInUpperHalf e

  _subscribeToMouseEvents: ->
    document.addEventListener 'mousemove', @handleMouseMove
    document.addEventListener 'mouseup', @handleMouseUp

  _unsubscribeFromMouseEvents: ->
    document.removeEventListener 'mousemove', @handleMouseMove
    document.removeEventListener 'mouseup', @handleMouseUp

  _isInUpperHalf: (e) ->
    bounds = @getDOMNode().getBoundingClientRect()
    e.clientY < bounds.top + bounds.height / 2
