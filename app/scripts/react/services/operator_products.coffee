window.OperatorProductsService =

  loadProducts: ({data, success, error}) ->
    Requester.request
      url: ApiRoutes.operator_products_by_category_url()
      data: {
        category_id: data.categoryId
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

  # createCategory: ({name, parentId, success, error}) ->
  #   Requester.request
  #     url: ApiRoutes.operator_categories_url()
  #     method: 'POST'
  #     data:
  #       name:      name
  #       parent_id: parentId
  #       position:  OperatorCategoriesStore.getCategoryPosition(parent_id: parentId)
  #     error: (xhr, status, err) ->
  #       error?(err || status)
  #     success: (category) ->
  #       OperatorCategoriesServerActions.createCategory category
  #       success?(category)

  # # updateSingleCategory: ({category, success, error}) ->
  # #   @updateCategory
  # #     category: category
  # #     success:  ->
  # #       OperatorCategoriesServerActions.categoryUpdated category
  # #       success category
  # #     error: error

  # updateCategory: ({category, success, error}) ->
  #   Requester.request
  #     url: ApiRoutes.operator_category_url category.id
  #     method: 'PUT'
  #     data:
  #       name:      category.name
  #       position:  category.position
  #       parent_id: category.parent_id
  #     error: (xhr, status, err) ->
  #       error?(err || status)
  #     success: (category) ->
  #       OperatorCategoriesServerActions.updateCategory category
  #       success?(category)

  # deleteCategory: ({category, error}) ->
  #   Requester.request
  #     url: ApiRoutes.operator_category_url category.id
  #     method: 'DELETE'
  #     error: (xhr, status, err) ->
  #       error?(err || status)
  #     success: (response) ->
  #       OperatorCategoriesServerActions.deleteCategory category
  #       success?(response)

  # # reorderCategories: (categoryId, insertIdx) ->
  # #   positionChanges = OperatorCategoriesStore.getReorderedPositions categoryId, insertIdx
  # #   if positionChanges.length
  # #     OperatorCategoriesActions.reorderCategories positionChanges
  # #     @updateCategories positionChanges, (err, response) ->
  # #       if err
  # #         console.error err # todo

  # # updateCategories: (data, callback) ->
  # #   # todo. Очень грубая замена. Надо бы делать хотя бы async.parallel
  # #   done = _.after data.length, ->
  # #     callback()
  # #   that = @
  # #   _.each data, (i) ->
  # #     that.updateCategory
  # #       category: i
  # #       success: done

  # # mockMode: false
  # # mockLatency: 500
  # # mockData: []