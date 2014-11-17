window.OperatorCategoriesService =

  loadCategories: ({success, error}) ->
    Requester.request
      url: ApiRoutes.operator_categories_url()
      error: (xhr, status, err) ->
        error?(err || status)
      success: (categories) ->
        OperatorCategoriesServerActions.receiveCategories categories
        success?(categories)

  reorderCategories: ({categoryId, insertIdx}) ->
    #TODO: refactor
    newPositions = OperatorCategoriesStore.getReorderedPositions categoryId, insertIdx

    if newPositions.length
      OperatorCategoriesServerActions.reorderCategories newPositions
      @updateCategories newPositions, (err, response) ->
        console.error(err) if err # todo

  updateCategories: (data, callback) ->
    #TODO: refactor
    #TODO: Очень грубая замена. Надо бы делать хотя бы async.parallel
    done = _.after data.length, ->
      callback()
    that = @
    _.each data, (i) ->
      that.updateCategory
        category: i
        success: done

  reloadCategory: ({categoryId}) ->
    Requester.request
      url: ApiRoutes.operator_category_url categoryId
      error: (xhr, status, err) ->
        error?(err || status)
      success: (category) ->
        OperatorCategoriesServerActions.receiveCategory category
        success?(category)

  createCategory: ({name, parentId, success, error}) ->
    Requester.request
      url: ApiRoutes.operator_categories_url()
      method: 'POST'
      data:
        name:      name
        parent_id: parentId
        position:  OperatorCategoriesStore.getCategoryPosition(parent_id: parentId)
      error: (xhr, status, err) ->
        error?(err || status)
      success: (category) ->
        OperatorCategoriesServerActions.createCategory category
        success?(category)

  updateCategory: ({category, success, error}) ->
    Requester.request
      url: ApiRoutes.operator_category_url category.id
      method: 'PUT'
      data:
        name:      category.name
        position:  category.position
        parent_id: category.parent_id
      error: (xhr, status, err) ->
        error?(err || status)
      success: (category) ->
        OperatorCategoriesServerActions.updateCategory category
        success?(category)

  deleteCategory: ({category, error}) ->
    Requester.request
      url: ApiRoutes.operator_category_url category.id
      method: 'DELETE'
      error: (xhr, status, err) ->
        error?(err || status)
      success: (response) ->
        OperatorCategoriesServerActions.deleteCategory category
        success?(response)