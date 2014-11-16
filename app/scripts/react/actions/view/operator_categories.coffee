window.OperatorCategoriesViewActions =

  loadCategories: (options) ->
    OperatorCategoriesService.loadCategories options

  createCategory: (options) ->
    OperatorCategoriesService.createCategory options

  updateCategory: (options) ->
    OperatorCategoriesService.updateCategory options

  deleteCategory: (options) ->
    OperatorCategoriesService.deleteCategory options

  # # Пробую исопльзовать actions для более сложной логики
  # # нежели простой вызов диспетчера
  # reloadCategory: (category_id) ->
  #   CategoriesResource.get
  #     id: category_id
  #     success: (category) ->
  #       OperatorCategoriesDispatcher.handleServerAction
  #         type: 'updateCategory'
  #         category: category

  # categorySelected: (category) ->
  #   OperatorCategoriesDispatcher.handleViewAction
  #     type: 'categorySelected'
  #     category: category

  # reorderCategories: (newOrder) ->
  #   OperatorCategoriesDispatcher.handleViewAction
  #     type: 'reorderCategories'
  #     newOrder: newOrder
