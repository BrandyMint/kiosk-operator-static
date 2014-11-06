###*global window, React ###

window.CategoryProductDroptarget =
  componentDidMount: ->
    that = @
    $(@getDOMNode()).droppable {
      scope: 'productsToCategories'
      activeClass: '__droptarget-active'
      addClasses: false
      hoverClass: '__droptarget-hover'
      tolerance: 'pointer'
      drop: @handleProductDrop
      accept: _.throttle (productNode) ->
        productId = parseInt productNode.attr 'data-objectid'
        product = OperatorProductsStore.getProductById productId
        return product.category_id != that.props.category.id
    }

  handleProductDrop: (e, ui) ->
    productId = parseInt ui.draggable.attr 'data-objectid'
    productUpdate =
      id: productId
      category_id: @props.category.id
    ProductsService.updateProduct
      product: productUpdate
      success: ->
        #todo?
      error: ->
        #todo?
