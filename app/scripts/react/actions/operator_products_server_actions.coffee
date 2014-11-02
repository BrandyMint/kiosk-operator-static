###*global OperatorProductsDispatcher, window ###

window.OperatorProductsServerActions =

  productsLoaded: (productsData) ->
    OperatorProductsDispatcher.handleServerAction
      type: 'receiveAll'
      products: productsData
