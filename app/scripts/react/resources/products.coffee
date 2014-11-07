window.ProductsResource =
  deleteImage: ({image_id}) ->
    $.ajax
      url:    RoutesApi.operator_product_image_delete_url(image_id)
      method: 'delete'

  publish: ({id, success, error}) ->
    if !@mockMode
      $.ajax
        dataType: 'json'
        method:   'post'
        url:      RoutesApi.operator_product_publicate_url id
        error: (xhr, status, err) ->
          if error then error err || status
        success: (data) ->
          if success then success data
    else
      console.info "Mocked ProductsService: tryPublish id=#{ id }"
      that = @
      setTimeout ->
        if success
          success that.mockData.publishResponse
      , @mockLatency

  unpublish: ({id, success, error}) ->
    if !@mockMode
      $.ajax
        dataType: 'json'
        method:   'delete'
        url:      RoutesApi.operator_product_publicate_url id
        error: (xhr, status, err) ->
          if error then error err || status
        success: (data) ->
          if success then success data
    else
      console.info "Mocked ProductsService: tryUnpublish id=#{ id }"
      that = @
      setTimeout ->
        if success
          success that.mockData.unpublishResponse
      , @mockLatency

  index: ({data, success, error}) ->
    error ||= KioskOperatorApp.error_alert
    data.per_page ||= 1000
    Requester.request
      dataType: 'json'
      url:      RoutesApi.operator_products_by_category_url()
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
        url:      RoutesApi.operator_product_url id
        data:     data

        error: (xhr, status, err) -> error err || status
        success: success
    else
      setTimeout success, @mockLatency


  mockMode: false
  mockLatency: 500
  mockData:
    publishResponse: null
    unpublishResponse: null
