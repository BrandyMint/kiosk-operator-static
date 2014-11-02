###*global _, window, EventEmitter, OperatorProductsDispatcher, OperatorCategoriesStore ###

CHANGE_EVENT = 'change'

_products = []

_pushProducts = (products) ->
  _products = products

_getSortedProductsByCategory = (category) ->
  categories = [category].concat OperatorCategoriesStore.getDescendands category
  catIds = _.map categories, (i) -> i.id
  _.filter _products, (i) -> i.category_id in catIds
    .sort((a, b) -> a.position - b.position)

_updateProduct = (product) ->
  _products = _.map _products, (i) -> if i.id == product.id then product else i

_getProductById = (id) ->
  _.find _products, (i) -> i.id == id

window.OperatorProductsStore = _.extend {}, EventEmitter.prototype, {
  emitChange: ->
    @emit CHANGE_EVENT

  addChangeListener: (callback) ->
    @on CHANGE_EVENT, callback

  removeChangeListener: (callback) ->
    @off CHANGE_EVENT, callback

  getSortedProductsByCategory: (category) ->
    _getSortedProductsByCategory category

  getProductById: (id) ->
    _getProductById id
}

OperatorProductsStore.dispatchToken = OperatorProductsDispatcher.register (payload) ->
  action = payload.action

  switch action.type
    when 'receiveAll'
      _pushProducts action.products
      OperatorProductsStore.emitChange()

    when 'productUpdated'
      _updateProduct action.product
      OperatorProductsStore.emitChange()
