window.ProductsResource =
  index: ({data, success, error}) ->
    error ||= KioskOperatorApp.error_alert
    data.per_page ||= 1000
    Requester.request
      dataType: 'json'
      url:      Routes.operator_products_by_category_url()
      method:   'get'
      data: data
      error: (xhr, status, err) ->
        error err || status
      success: (data) ->
        # TODO Пейджирование
        success data.products

  update: ({id, data, success, error}) ->
    error ||= KioskOperatorApp.error_alert
    if !@mockMode
      Requester.request
        dataType: 'json'
        method:   'put'
        url:      Routes.operator_products_item_url id
        data:     data

        error: (xhr, status, err) -> error err || status
        success: success
    else
      setTimeout success, @mockLatency


