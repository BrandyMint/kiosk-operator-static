###*global OperatorProductsDispatcher, window, OperatorCategoriesStore, OperatorCategoriesDispatcher ###

window.OperatorProductsServerActions =

  productsLoaded: (productsData) ->
    OperatorProductsDispatcher.handleServerAction
      type: 'receiveAll'
      products: productsData

  productUpdated: (product) ->
    oldProduct = OperatorProductsStore.getProductById product.id
    oldCategory = OperatorCategoriesStore.getCategoryById oldProduct.category_id
    newCategory = OperatorCategoriesStore.getCategoryById product.category_id

    OperatorProductsDispatcher.handleServerAction
      type: 'productUpdated'
      product: product

    OperatorCategoriesDispatcher.handleServerAction
      type: 'changeCategoryProductCount'
      category: oldCategory
      increment: -1

    OperatorCategoriesDispatcher.handleServerAction
      type: 'changeCategoryProductCount'
      category: newCategory
      increment: 1
