###*global _, window, EventEmitter, OperatorProductsDispatcher, OperatorCategoriesStore ###

window.OperatorProductsStore = _.extend {}, EventEmitter.prototype


OperatorProductsStore.dispatchToken = OperatorProductsDispatcher.register (payload) ->
  # nothing
