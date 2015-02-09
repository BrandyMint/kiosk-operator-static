window.OperatorProductsService =

  loadProducts: ({url, data}) ->
    Requester.request {
      url: url || ApiRoutes.operator_products_by_category_url()
      data:
        category_id:           data.categoryId
        filter:                data.filter
        include_subcategories: data.includeSubcategories
        page:                  1
        per_page:              30
    }
      .then (response) ->
        OperatorProductsServerActions.receiveProducts data.categoryId, response.products
        response

  loadMoreProducts: ({url, data}) ->
    Requester.request {
      url: url || ApiRoutes.operator_products_by_category_url()
      data:
        category_id:           data.categoryId
        filter:                data.filter
        include_subcategories: data.includeSubcategories
        page:                  data.page
        per_page:              30
    }
      .then (response) ->
        OperatorProductsServerActions.receiveMoreProducts data.categoryId, response.products
        response

  changeProductCategory: ({url, productId, newCategoryId, oldCategoryId, success}) ->
    Requester.request
      url: url || ApiRoutes.operator_products_change_category_url productId
      method: 'PUT'
      data:
        new_category_id: newCategoryId
        old_category_id: oldCategoryId
      success: (product) ->
        success?()
        OperatorProductsServerActions.moveProduct
          product:       product
          newCategoryId: newCategoryId
          oldCategoryId: oldCategoryId

  changeProductsCategory: ({url, products, newCategoryId, oldCategoryId}) ->
    completedRequests = 0

    for product in products
      @changeProductCategory {
        url: url
        productId: product.id
        newCategoryId: newCategoryId
        oldCategoryId: oldCategoryId
        success: ->
          completedRequests++

          # Reload changed categories when all requests will complete
          if completedRequests == products.length
            OperatorCategoriesViewActions.reloadCategory(categoryId: newCategoryId)
            OperatorCategoriesViewActions.reloadCategory(categoryId: oldCategoryId)
      }