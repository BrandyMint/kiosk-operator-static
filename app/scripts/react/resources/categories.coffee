window.CategoriesResource =

  index: ({success, error}) ->
    Requester.request
      url: ApiRoutes.operator_categories_url()
      success: (categories) ->
        success?(categories)
      error: (xhr, status, err) ->
        error?(err || status)

  get: ({categoryId, success, error}) ->
    Requester.request
      url: ApiRoutes.operator_category_url categoryId
      success: (category) ->
        success?(category)
      error: (xhr, status, err) ->
        error?(err || status)

  create: ({data, success, error}) ->
    Requester.request
      url: ApiRoutes.operator_categories_url()
      method: 'POST'
      data: data
      success: (category) ->
        success?(category)
      error: (xhr, status, err) ->
        error?(err || status)

  update: ({data, categoryId, success, error}) ->
    Requester.request
      url: ApiRoutes.operator_category_url categoryId
      method: 'PUT'
      data: data
      success: (category) ->
        success?(category)
      error: (xhr, status, err) ->
        error?(err || status)

  delete: ({categoryId, success, error}) ->
    Requester.request
      url: ApiRoutes.operator_category_url categoryId
      method: 'DELETE'
      error: (xhr, status, err) ->
        error?(err || status)
      success: (response) ->
        success?(response)