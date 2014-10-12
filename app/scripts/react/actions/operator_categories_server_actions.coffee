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

  categoryUpdated: (category) ->
    OperatorCategoriesDispatcher.handleServerAction
      type: 'updateCategory'
      category: category

  categoryDeleted: (category) ->
    OperatorCategoriesDispatcher.handleServerAction
      type: 'deleteCategory'
      category: category
