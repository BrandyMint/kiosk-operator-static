window.OperatorCategoriesActions =

  categorySelected: (category) ->
    OperatorCategoriesDispatcher.handleViewAction {
      type: 'categorySelected'
      category: category
    }

  reorderCategories: (newOrder) ->
    OperatorCategoriesDispatcher.handleViewAction {
      type: 'reorderCategories'
      newOrder: newOrder
    }
