window.OperatorCategoriesViewActions =

  loadCategories: (options) ->
    OperatorCategoriesService.loadCategories options

  reloadCategory: (options) ->
    OperatorCategoriesService.reloadCategory options

  createCategory: (options) ->
    OperatorCategoriesService.createCategory options
    
  updateCategory: (options) ->
    OperatorCategoriesService.updateCategory options

  deleteCategory: (options) ->
    OperatorCategoriesService.deleteCategory options

  # categorySelected: (category) ->
  #   OperatorCategoriesDispatcher.handleViewAction
  #     type: 'categorySelected'
  #     category: category

  # reorderCategories: (newOrder) ->
  #   OperatorCategoriesDispatcher.handleViewAction
  #     type: 'reorderCategories'
  #     newOrder: newOrder