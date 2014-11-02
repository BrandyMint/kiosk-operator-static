###*global Routes, OperatorProductsServerActions, Requester, $, window ###

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

  getProducts: (callback) ->
    if !@mockMode
      Requester.request
        dataType: 'json'
        url:      Routes.operator_products_url()
        method:   'get'
        error: (xhr, status, err) ->
          if callback then callback err || status
        success: (data) ->
          OperatorProductsServerActions.productsLoaded data.products
          if callback then callback null, data.products
    else
      that = @
      setTimeout ->
        OperatorProductsServerActions.productsLoaded that.mockData.allProductsResponse.products
        if callback then callback null, that.mockData.allProductsResponse.products
      , @mockLatency

  mockMode: false
  mockLatency: 500
  mockData:
    publishResponse: null
    unpublishResponse: null
