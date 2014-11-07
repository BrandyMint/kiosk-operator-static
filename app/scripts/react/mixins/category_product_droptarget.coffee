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
    OperatorProductsViewActions.changProductCategory
      product_id:      parseInt ui.draggable.attr 'data-product-id'
      new_category_id: @props.category.id
      old_category_id: parseInt e.attr 'data-category-id'

