window.OperatorCategoriesActions =

  categorySelected: (category) ->
    OperatorCategoriesDispatcher.handleViewAction {
      type: 'categorySelected'
      category: category
    }

  deleteCategory: (category) ->
    OperatorCategoriesDispatcher.handleViewAction {
      type: 'deleteCategory'
      category: category
    }

  updateCategory: (category) ->
    OperatorCategoriesDispatcher.handleViewAction {
      type: 'updateCategory'
      category: category
    }

  createCategory: (data) ->
    OperatorCategoriesDispatcher.handleViewAction {
      type: 'createCategory'
      data: data
    }

  reorderCategories: (category, insertIdx) ->
    OperatorCategoriesDispatcher.handleViewAction {
      type: 'reorderCategories'
      category: category
      insertIdx: insertIdx
    }
