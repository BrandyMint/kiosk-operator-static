window.OperatorCategoriesServerActions =

  receiveCategories: (categories) ->
    OperatorCategoriesDispatcher.handleServerAction
      type: 'receiveCategories'
      categories: categories