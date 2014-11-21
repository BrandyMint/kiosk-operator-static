window.OperatorProductsViewActions =

  loadProducts: (options) ->
    OperatorProductsService.loadProducts options

  loadMoreProducts: (options) ->
    OperatorProductsService.loadMoreProducts options

  changeProductCategory: (options) ->
    OperatorProductsService.changeProductCategory options