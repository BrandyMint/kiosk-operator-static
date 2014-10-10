###*global OperatorCategoriesDispatcher ###

window.OperatorCategoriesServerActions =

  categoriesLoaded: (categoriesData) ->
    OperatorCategoriesDispatcher.handleServerAction {
      type: 'receiveAll'
      categories: categoriesData
    }

  categoryCreated: (tmpId, category) ->
    OperatorCategoriesDispatcher.handleServerAction {
      type: 'categoryCreated'
      tmpId: tmpId
      category: category
    }
