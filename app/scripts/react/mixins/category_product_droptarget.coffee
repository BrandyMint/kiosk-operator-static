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
        category_id = parseInt productNode.attr 'data-category-id'
        return category_id != that.props.category.id
    }

  handleProductDrop: (e, ui) ->
    productId = parseInt ui.draggable.attr 'data-product-id'
    productUpdate =
      id: productId
      category_id: @props.category.id

    ProductsService.updateProduct
      product: productUpdate
      success: ->
        # TODO Продукт удалился из текущего списка
      error: (error) ->
        KioskOperatorApp.error_alert error

        #todo?
