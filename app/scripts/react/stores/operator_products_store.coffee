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

window.OperatorProductsStore = _.extend {}, EventEmitter.prototype, {
  emitChange: ->
    @emit CHANGE_EVENT

  addChangeListener: (callback) ->
    @on CHANGE_EVENT, callback

  removeChangeListener: (callback) ->
    @off CHANGE_EVENT, callback

  getSortedProductsByCategory: (category) ->
    _getSortedProductsByCategory category
}

OperatorProductsStore.dispatchToken = OperatorProductsDispatcher.register (payload) ->
  action = payload.action

  switch action.type
    when 'receiveAll'
      _pushProducts action.products
      OperatorProductsStore.emitChange()
