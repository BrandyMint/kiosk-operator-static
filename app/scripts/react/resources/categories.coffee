window.CategoriesResource=
  delete: ({category, success, error}) ->
    if !@mockMode
      $.ajax
        dataType: 'json'
        url:      Routes.operator_category_url category.id
        method:   'delete'
        error: (xhr, status, err) ->
          error err || status
        success: (response) ->
          OperatorCategoriesServerActions.deleteCategory category
          success?()
    else
      setTimeout ->
        success?()
        OperatorCategoriesServerActions.deleteCategory category
      , @mockLatency

  # Пока непонятно, зачем этот маршрут в API, так как getCategories даёт
  # полную информацию по всем категориям
  get: ({id, success, error}) ->
    if !@mockMode
      $.ajax
        dataType: 'json'
        url:      Routes.operator_category_url id
        method:   'get'
        error: (xhr, status, err) ->
          error err || status
        success: (data) ->
          success data
    else
      setTimeout ->
        callback null
      , @mockLatency


