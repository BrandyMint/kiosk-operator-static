window.OperatorProductsService =

  loadProducts: ({data, success, error}) ->
    Requester.request
      url: ApiRoutes.operator_products_by_category_url()
      data: {
        category_id: data.categoryId
        query: data.productQuery
        state: data.productState
        include_subcategories: data.includeSubcategories
        per_page: 1000
      }
      error: (xhr, status, err) ->
        error?(err || status)
      success: (response) ->
        OperatorProductsServerActions.receiveProducts data.categoryId, response.products
        # TODO Пейджирование
        success?(response.products)

  changeProductCategory: ({productId, newCategoryId, oldCategoryId}) ->
    Requester.request
      url: ApiRoutes.operator_product_url productId
      method: 'PUT'
      data:
        category_id: newCategoryId
      error: (xhr, status, err) ->

      success: ->
        #TODO: Dispose from 2 additional GET requests. Proccess changes on the front
        OperatorCategoriesViewActions.reloadCategory(categoryId: newCategoryId)
        OperatorCategoriesViewActions.reloadCategory(categoryId: oldCategoryId)

        OperatorProductsServerActions.moveProduct
          productId:  productId
          categoryId: oldCategoryId