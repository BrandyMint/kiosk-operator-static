window.CategoryDroppable =

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
    OperatorProductsViewActions.changeProductCategory
      productId:     parseInt ui.draggable.attr 'data-product-id'
      newCategoryId: @props.category.id
      oldCategoryId: parseInt ui.draggable.attr 'data-category-id'