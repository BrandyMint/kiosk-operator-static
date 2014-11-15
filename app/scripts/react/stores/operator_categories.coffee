window.BaseStore = require './_base'

_categories = []

window.OperatorCategoriesStore = _.extend new BaseStore(), {

  pushCategories: (categories)

}

OperatorCategoriesStore.dispatchToken = OperatorCategoriesDispatcher.register (payload) ->
  action = payload.action

  switch action.type
    when 'categoriesLoaded'
      OperatorCategoriesStore.pushCategories action.categories
      OperatorCategoriesStore.emitChange()