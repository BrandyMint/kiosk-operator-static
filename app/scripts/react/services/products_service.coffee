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

  pullProductsByCategory: ({category_id, success, error}) ->
    Requester.request
      dataType: 'json'
      data:
        per_page: 10000
        category_id: category_id
      url:      Routes.operator_products_by_category_url()
      method:   'get'
      error: (xhr, status, err) ->
        error err || status
      success: (data) ->
        # TODO Пейджирование
        success data.products

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

  updateProduct: ({product, success, error}) ->
    id = product.id
    if !@mockMode
      Requester.request
        dataType: 'json'
        url:      Routes.operator_products_item_url id
        data:     data
        method:   'put'
        error: (xhr, status, err) ->
          error err || status
        success: (response) ->
          #OperatorProductsServerActions.productUpdated product
          success response
    else
      setTimeout ->
        oldProduct = _.clone OperatorProductsStore.getProductById id
        updatedProduct = _.assign oldProduct, product
        OperatorProductsServerActions.productUpdated updatedProduct
        success updatedProduct
      , @mockLatency

  mockMode: false
  mockLatency: 500
  mockData:
    publishResponse: null
    unpublishResponse: null
