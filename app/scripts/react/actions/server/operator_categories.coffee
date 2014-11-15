window.OperatorCategoriesServerActions =

  receiveCategories: (categories) ->
    OperatorCategoriesDispatcher.handleServerAction
      type: 'categoriesLoaded'
      categories: categories

  createCategory: (category) ->
    OperatorCategoriesDispatcher.handleServerAction
      type: 'categoryCreated'
      category: category