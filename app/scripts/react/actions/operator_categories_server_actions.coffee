###*global OperatorCategoriesDispatcher ###

window.OperatorCategoriesServerActions =

  categoriesLoaded: (categories) ->
    OperatorCategoriesDispatcher.handleServerAction
      type: 'receiveAll'
      categories: categories

  addCategory: (category) ->
    OperatorCategoriesDispatcher.handleServerAction
      type: 'addCategory'
      category: category

  categoryUpdated: (category) ->
    OperatorCategoriesDispatcher.handleServerAction
      type: 'updateCategory'
      category: category

  deleteCategory: (category) ->
    OperatorCategoriesDispatcher.handleServerAction
      type: 'deleteCategory'
      category: category
