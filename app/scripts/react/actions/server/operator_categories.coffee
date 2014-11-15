window.OperatorCategoriesServerActions =

  receiveCategories: (categories) ->
    OperatorCategoriesDispatcher.handleServerAction
      type: 'categoriesLoaded'
      categories: categories