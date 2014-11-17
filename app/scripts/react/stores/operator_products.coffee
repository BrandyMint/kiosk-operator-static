BaseStore = require './_base'

_products = {}

window.OperatorProductsStore = _.extend new BaseStore(), {

  isProductExists: (categoryId, productId) ->
    products = _products[categoryId] ? []

    for product in products when product.id == productId
      return true

    false

  replaceProducts: (categoryId, products) ->
    _products[categoryId] = products

  removeProduct: (categoryId, productId) ->
    return unless @isProductExists(categoryId, productId)

    clonedProducts = _products[categoryId][..]

    for clonedProduct, i in clonedProducts when clonedProduct.id == productId
      clonedProducts.splice i, 1
      break

    _products[categoryId] = clonedProducts

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
    when 'productMoved'
      #TODO: moveProduct instead of removeProduct
      OperatorProductsStore.removeProduct action.categoryId, action.productId
      OperatorProductsStore.emitChange()
      break