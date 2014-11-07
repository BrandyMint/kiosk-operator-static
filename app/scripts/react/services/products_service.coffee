###*global Routes, OperatorProductsServerActions, Requester, $, window, _, OperatorProductsStore ###

window.ProductsService =
  tryPublish: ({id, success, error}) ->
    if !@mockMode
      $.ajax
        dataType: 'json'
        url:      Routes.operator_products_item_pub_url id
        method:   'post'
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

  tryUnpublish: ({id, success, error}) ->
    if !@mockMode
      $.ajax
        dataType: 'json'
        url:      Routes.operator_products_item_pub_url id
        method:   'delete'
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

  mockMode: false
  mockLatency: 500
  mockData:
    publishResponse: null
    unpublishResponse: null
