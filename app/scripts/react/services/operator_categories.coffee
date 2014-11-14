###*global Routes, OperatorCategoriesServerActions ###

# На основе http://api.kormilica.info/#!/operator

window.OperatorCategoriesService =
  getCategories: (options) ->
    if !@mockMode
      Requester.request
        url: RoutesApi.operator_categories_url()
        error: (xhr, status, err) ->
          options?.error?(err || status)
        success: (categories) ->
          OperatorCategoriesServerActions.categoriesLoaded categories
          options?.success?(null, categories)
    else
      that = @
      setTimeout ->
        OperatorCategoriesServerActions.categoriesLoaded that.mockData
        if callback then callback null, that.mockData
      , @mockLatency

  createCategory: ({name, parent_id, success, error}) ->
    data = OperatorCategoriesStore.positionCategory
      name: name
      parent_id: parent_id
    if !@mockMode
      $.ajax
        dataType: 'json'
        url:      RoutesApi.operator_categories_url()
        data:     data
        method:   'post'
        error: (xhr, status, err) ->
          error err || status
        success: (category) ->
          OperatorCategoriesServerActions.addCategory category
          success category
    else
      setTimeout ->
        data.id = Math.floor(Math.random() * 100000000)
        data.products_count = 0
        data.deep_products_count = 0
        OperatorCategoriesServerActions.addCategory data
        success data
      , @mockLatency

  updateSingleCategory: ({category, success, error}) ->
    @updateCategory
      category: category
      success:  ->
        OperatorCategoriesServerActions.categoryUpdated category
        success category
      error: error

  updateCategory: ({category, success, error}) ->
    id = category.id
    data = _.pick category, ['name', 'position', 'parent_id']
    if !@mockMode
      $.ajax
        dataType: 'json'
        url:      RoutesApi.operator_category_url id
        data:     data
        method:   'put'
        error: (xhr, status, err) ->
          error err || status
        success: (response) ->
          success response
    else
      setTimeout ->
        success category
      , @mockLatency

  reorderCategories: (categoryId, insertIdx) ->
    positionChanges = OperatorCategoriesStore.getReorderedPositions categoryId, insertIdx
    if positionChanges.length
      OperatorCategoriesActions.reorderCategories positionChanges
      @updateCategories positionChanges, (err, response) ->
        if err
          console.error err # todo

  updateCategories: (data, callback) ->
    # todo. Очень грубая замена. Надо бы делать хотя бы async.parallel
    done = _.after data.length, ->
      callback()
    that = @
    _.each data, (i) ->
      that.updateCategory
        category: i
        success: done

  mockMode: false
  mockLatency: 500
  mockData: []