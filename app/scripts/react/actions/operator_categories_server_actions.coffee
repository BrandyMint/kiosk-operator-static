###*global OperatorCategoriesDispatcher ###

window.OperatorCategoriesServerActions =

  categoriesLoaded: (categoriesData) ->
    OperatorCategoriesDispatcher.handleServerAction
      type: 'receiveAll'
      categories: categoriesData

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
