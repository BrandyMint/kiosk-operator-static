###*global Routes, OperatorCategoriesServerActions ###

# На основе http://api.kormilica.info/#!/operator

window.OperatorCategoriesService =
  getCategories: (callback) ->
    if !@mockMode
      $.ajax
        dataType: 'json'
        url:      Routes.operator_categories_url()
        method:   'get'
        error: (xhr, status, err) ->
          if callback then callback err || status
        success: (data) ->
          OperatorCategoriesServerActions.categoriesLoaded data
          if callback then callback null, data
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
        url:      Routes.operator_categories_url()
        data:     data
        method:   'post'
        error: (xhr, status, err) ->
          error err || status
        success: (category) ->
          OperatorCategoriesServerActions.categoryCreated category
          success category
    else
      setTimeout ->
        data.id = Math.floor(Math.random() * 100000000)
        OperatorCategoriesServerActions.categoryCreated data
        success data
      , @mockLatency

  # Пока непонятно, зачем этот маршрут в API, так как getCategories даёт
  # полную информацию по всем категориям
  getCategory: (id, callback) ->
    if !@mockMode
      $.ajax
        dataType: 'json'
        url:      Routes.operator_categories_item_url id
        method:   'get'
        error: (xhr, status, err) ->
          callback err || status
        success: (data) ->
          callback null, data
    else
      setTimeout ->
        callback null
      , @mockLatency

  updateCategory: (data, callback) ->
    id = data.id
    data = _.pick data, ['name', 'position', 'parent_id']
    if !@mockMode
      $.ajax
        dataType: 'json'
        url:      Routes.operator_categories_item_url id
        data:     data
        method:   'put'
        error: (xhr, status, err) ->
          callback err || status
        success: (data) ->
          callback null, data
    else
      setTimeout ->
        callback null
      , @mockLatency

  deleteCategory: (id, callback) ->
    if !@mockMode
      $.ajax
        dataType: 'json'
        url:      Routes.operator_categories_item_url id
        method:   'delete'
        error: (xhr, status, err) ->
          callback err || status
        success: (data) ->
          callback null, data
    else
      setTimeout ->
        callback null
      , @mockLatency

  updateCategories: (data, callback) ->
    # todo. Очень грубая замена. Надо бы делать хотя бы async.parallel
    done = _.after data.length, ->
      callback()
    that = @
    _.each data, (i) ->
      that.updateCategory i, done

  mockMode: false
  mockLatency: 500
  mockData: []
