window.OperatorCategoriesViewActions =

  loadCategories: (options) ->
    OperatorCategoriesService.loadCategories options

  # # Пробую исопльзовать actions для более сложной логики
  # # нежели простой вызов диспетчера
  # reloadCategory: (category_id) ->
  #   CategoriesResource.get
  #     id: category_id
  #     success: (category) ->
  #       OperatorCategoriesDispatcher.handleServerAction
  #         type: 'updateCategory'
  #         category: category

  # deleteCategory: ({category, error}) ->
  #   CategoriesResource.delete
  #     category: category
  #     error:    error

  # categorySelected: (category) ->
  #   OperatorCategoriesDispatcher.handleViewAction
  #     type: 'categorySelected'
  #     category: category

  # reorderCategories: (newOrder) ->
  #   OperatorCategoriesDispatcher.handleViewAction
  #     type: 'reorderCategories'
  #     newOrder: newOrder
