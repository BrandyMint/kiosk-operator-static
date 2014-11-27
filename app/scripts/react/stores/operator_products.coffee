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

  pushProducts: (categoryId, products) ->
    _products[categoryId] ||= []
    clonedProducts = _products[categoryId][..]

    for product in products
      unless @isProductExists categoryId, product
        clonedProducts.push product

    _products[categoryId] = clonedProducts

  updateProduct: (data) ->
    for _product in _products when _product.id == data.id
      _.extend _product, data
      break

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
    when 'moreProductsLoaded'
      OperatorProductsStore.pushProducts action.categoryId, action.products
      OperatorProductsStore.emitChange()
    when 'productMoved'
      #TODO: moveProduct instead of removeProduct
      OperatorProductsStore.removeProduct action.categoryId, action.productId
      OperatorProductsStore.emitChange()
    when 'productUpdated'
      OperatorProductsStore.updateProduct action.product
      OperatorProductsStore.emitChange()