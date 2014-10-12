###*global OperatorCategoriesDispatcher ###

window.OperatorCategoriesServerActions =

  categoriesLoaded: (categoriesData) ->
    OperatorCategoriesDispatcher.handleServerAction
      type: 'receiveAll'
      categories: categoriesData

  categoryCreated: (category) ->
    OperatorCategoriesDispatcher.handleServerAction
      type: 'addCategory'
      category: category
