window.OperatorCategoriesViewActions =

  loadCategories: ({success, error}) ->
    console.log 'loadCategories'
    CategoriesResource.index {
      success: (categories) ->
        OperatorCategoriesServerActions.receiveCategories categories
        success?(categories)
      error: (xhr, status, err) ->
        error?(err || status)
    }

  reorderCategories: (options) ->
    console.log 'reorderCategories'
    OperatorCategoriesService.reorderCategories options

  reloadCategory: (options) ->
    console.log 'reloadCategory'
    OperatorCategoriesService.reloadCategory options

  createCategory: (options) ->
    console.log 'createCategory'
    OperatorCategoriesService.createCategory options
    
  updateCategory: (options) ->
    console.log 'updateCategory'
    OperatorCategoriesService.updateCategory options

  deleteCategory: (options) ->
    console.log 'deleteCategory'
    OperatorCategoriesService.deleteCategory options

  # categorySelected: (category) ->
  #   OperatorCategoriesDispatcher.handleViewAction
  #     type: 'categorySelected'
  #     category: category

  # reorderCategories: (newOrder) ->
  #   OperatorCategoriesDispatcher.handleViewAction
  #     type: 'reorderCategories'
  #     newOrder: newOrder