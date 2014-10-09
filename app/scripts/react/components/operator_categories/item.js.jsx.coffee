###* @jsx React.DOM ###

###*global React ###

cx = React.addons.classSet

DRAG_THRESHOLD = 5 # (px)

window.OperatorCategories_Item = React.createClass
  propTypes:
    category:         React.PropTypes.object

    # Drag & drop special
    idx:              React.PropTypes.number
    onDragStart:      React.PropTypes.func
    onDragEnd:        React.PropTypes.func
    onDragOver:       React.PropTypes.func
    beDragTarget:     React.PropTypes.bool

  getInitialState: ->
    status:   'view'
    isDragged: false

  getDefaultProps: ->
    beDragTarget: false

  render: ->
    style = if @state.isDragged
      position: 'absolute'
      left:     @state.left
      top:      @state.top
      width:    @state.elementWidth
    else
      {}

    classes = cx {
      'hoverable-container':          true
      'operator-categories__item':    true
      'operator-categories-dragging': @state.isDragged
    }

    return `<div className=   { classes }
                 style=       { style } 
                 onMouseOver= { this.handleMouseOver }>
              <i className=   "fa fa-bars operator-categories-drag-handle"
                 onMouseDown= { this.handleGripZoneMoseDown } />
              { this._getItemNode() }
            </div>`

  _getItemNode: ->
    return switch @state.status
      when 'view'
        `<OperatorCategories_ItemView
           category=           { this.props.category }
           onDeleteStart=      { this.handleDeleteStart }
           onEditStart=        { this.handleEditStart }
         />`
      when 'edit'
        `<OperatorCategories_ItemEdit
           category=           { this.props.category }
           onEditEnd=          { this._backToView }
           onDeleteStart =     { this.handleDeleteStart }
         />`
      when 'delete'
        `<OperatorCategories_ItemDelete
           category=           { this.props.category }
           onDeleteEnd=        { this._backToView }
         />`

  _backToView: ->
    @setState(status: 'view')

  handleEditStart: (e) ->
    e.preventDefault()
    @setState(status: 'edit')

  handleDeleteStart: (e) ->
    e.preventDefault()
    @setState(status: 'delete')

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

    if !@state.isDragged and distance > DRAG_THRESHOLD
      @setState(isDragged: true)
      @props.onDragStart()
      @props.onDragOver @props.idx, @_isInUpperHalf e

    if @state.isDragged
      @setState
        left: @state.elementX + deltaX + document.body.scrollLeft
        top: @state.elementY + deltaY + document.body.scrollTop

  handleMouseUp: (e) ->
    if @state.isDragged
      @_unsubscribeFromMouseEvents()
      @setState(isDragged: false)
      @props.onDragEnd @props.category

  handleMouseOver: (e) ->
    if !@state.isDragged and @props.beDragTarget
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
