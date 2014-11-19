window.CategoryDroppable =

  componentDidMount: ->
    that = @

    $(@getDOMNode()).droppable {
      scope: 'productsToCategories'
      addClasses: false
      tolerance: 'pointer'
      drop: @handleProductDrop
      accept: _.throttle (productNode) ->
        category_id = parseInt productNode.attr 'data-category-id'
        return category_id != that.props.category.id
    }

  handleProductDrop: (e, ui) ->
    OperatorProductsService.changeProductsCategory {
      products: DragStateStore.getDraggedProducts()
      newCategoryId: @props.category.id
      oldCategoryId: parseInt ui.draggable.attr 'data-category-id'
    }

  componentWillUnmount: ->
    $(@getDOMNode()).droppable 'destroy'