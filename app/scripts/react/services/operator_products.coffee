window.OperatorProductsService =

  loadProducts: ({data, success, error}) ->
    Requester.request
      url: ApiRoutes.operator_products_by_category_url()
      data: {
        category_id:           data.categoryId
        query:                 data.productQuery
        state:                 data.productState
        include_subcategories: data.includeSubcategories
        page:                  1
        per_page:              30
      }
      error: (xhr, status, err) ->
        error?(err || status)
      success: (response) ->
        OperatorProductsServerActions.receiveProducts data.categoryId, response.products
        # TODO Пейджирование
        success?(response)

  loadMoreProducts: ({data, success, error}) ->
    Requester.request
      url: ApiRoutes.operator_products_by_category_url()
      data: {
        category_id:           data.categoryId
        query:                 data.productQuery
        state:                 data.productState
        include_subcategories: data.includeSubcategories
        page:                  data.page
        per_page:              30
      }
      error: (xhr, status, err) ->
        error?(err || status)
      success: (response) ->
        OperatorProductsServerActions.receiveMoreProducts data.categoryId, response.products
        success?(response)

  changeProductCategory: ({productId, newCategoryId, oldCategoryId, success}) ->
    Requester.request
      url: ApiRoutes.operator_product_url productId
      method: 'PUT'
      data:
        category_id: newCategoryId
      error: (xhr, status, err) ->
        error?(err || status)
      success: ->
        success?()
        OperatorProductsServerActions.moveProduct
          productId:  productId
          categoryId: oldCategoryId

  changeProductsCategory: ({products, newCategoryId, oldCategoryId}) ->
    completedRequests = 0

    for product in products
      @changeProductCategory {
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