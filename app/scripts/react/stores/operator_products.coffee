BaseStore = require './_base'

_products = {}

window.OperatorProductsStore = _.extend new BaseStore(), {

  replaceProducts: (categoryId, products) ->
    _products[categoryId] = products

  getProducts: (categoryId) ->
    _products[categoryId] ? []

}

OperatorProductsStore.dispatchToken = OperatorProductsDispatcher.register (payload) ->
  action = payload.action

  switch action.type
    when 'productsLoaded'
      #TODO: pushProducts instead of replaceProducts
      OperatorProductsStore.replaceProducts action.categoryId, action.products
      OperatorProductsStore.emitChange()
      break