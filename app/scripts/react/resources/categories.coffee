#TODO: Refactor

window.CategoriesResource =

  delete: ({category, success, error}) ->
    $.ajax
      dataType: 'json'
      url:      ApiRoutes.operator_category_url category.id
      method:   'delete'
      error: (xhr, status, err) ->
        error err || status
      success: (response) ->
        OperatorCategoriesServerActions.deleteCategory category
        success?()

  # Пока непонятно, зачем этот маршрут в API, так как getCategories даёт
  # полную информацию по всем категориям
  get: ({id, success, error}) ->
    $.ajax
      dataType: 'json'
      url:      ApiRoutes.operator_category_url id
      method:   'get'
      error: (xhr, status, err) ->
        error err || status
      success: (data) ->
        success data