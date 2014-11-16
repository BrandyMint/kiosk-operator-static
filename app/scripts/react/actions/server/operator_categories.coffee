window.OperatorCategoriesServerActions =

  receiveCategories: (categories) ->
    OperatorCategoriesDispatcher.handleServerAction
      type: 'categoriesLoaded'
      categories: categories

  createCategory: (category) ->
    OperatorCategoriesDispatcher.handleServerAction
      type: 'categoryCreated'
      category: category

  updateCategory: (category) ->
    OperatorCategoriesDispatcher.handleServerAction
      type: 'categoryUpdated'
      category: category

  deleteCategory: (category) ->
    OperatorCategoriesDispatcher.handleServerAction
      type: 'categoryDeleted'
      category: category