window.ProductDraggable =

  getInitialState: ->
    isDragged: false

  componentDidMount: ->
    that = @
    $(@getDOMNode()).draggable {
      scope: 'productsToCategories'
      addClasses: false
      appendTo: 'body'
      zIndex: 100
      cursor: 'default'
      cursorAt:
        top: -5
        left: -15
      helper: ->
        $ React.renderComponentToString OperatorProducts_ListItemDrag(product: that.props.product)
      start: (e) ->
        that.setState(isDragged: true)
      stop: (e) ->
        # Небольшой хак для помощи в предотвращении срабатывания клика после drop.
        # В целом правильнее было бы сначала повесить событие drag, потом click,
        # но в Реактовской инфраструктуре это выглядело бы кривовато.
        setTimeout ->
          that.setState(isDragged: false)
        , 0
    }