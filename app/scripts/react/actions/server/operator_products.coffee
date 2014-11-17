window.OperatorProductsServerActions =

  receiveProducts: (categoryId, products) ->
    OperatorProductsDispatcher.handleServerAction
      type: 'productsLoaded'
      categoryId: categoryId
      products: products

  moveProduct: ({productId, categoryId}) ->
    #TODO: increment newCategoryId counter without additional get request
    OperatorProductsDispatcher.handleServerAction
      type: 'productMoved'
      categoryId: categoryId
      productId: productId

  # createCategory: (category) ->
  #   OperatorCategoriesDispatcher.handleServerAction
  #     type: 'categoryCreated'
  #     category: category

  # updateCategory: (category) ->
  #   OperatorCategoriesDispatcher.handleServerAction
  #     type: 'categoryUpdated'
  #     category: category

  # deleteCategory: (category) ->
  #   OperatorCategoriesDispatcher.handleServerAction
  #     type: 'categoryDeleted'
  #     category: category