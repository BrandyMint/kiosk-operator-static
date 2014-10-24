###*global Routes, OperatorCategoriesServerActions ###

# На основе http://api.kormilica.info/#!/operator
#
class RequesterClass
  constructor: ({eb}) ->
    @start = false
    @eb = eb
    eb.on 'start', =>
      @start = true
      console.log 'Requester started'

  request: (options) =>
    if @start
      $.ajax options
    else
      @eb.on 'start', -> $.ajax options

window.Requester = new RequesterClass eb: window.EB

window.OperatorCategoriesService =
  getCategories: (callback) ->
    if !@mockMode
      Requester.request
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
        data.products_count = 0
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
        url:      Routes.operator_categories_item_url id
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

  deleteCategory: ({category, success, error}) ->
    if !@mockMode
      $.ajax
        dataType: 'json'
        url:      Routes.operator_categories_item_url category.id
        method:   'delete'
        error: (xhr, status, err) ->
          error err || status
        success: (response) ->
          OperatorCategoriesServerActions.categoryDeleted category
          success()
    else
      setTimeout ->
        success()
        OperatorCategoriesServerActions.categoryDeleted category
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
