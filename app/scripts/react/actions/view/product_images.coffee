window.ProductImagesViewActions =

  preloadImage: ({file, success, error, beforeSend, complete}) ->
    formData = new FormData()
    formData.append 'image', file

    Requester.request
      url: ApiRoutes.operator_products_images_url()
      method: 'POST'
      data: formData
      contentType: false
      processData: false
      beforeSend: beforeSend
      success: (data) => success?(data)
      error: (data) => error?(data)
      complete: complete

  addProductImages: ({files, productId, success, error}) ->
    if files.length
      xhrs = []

      for file in files
        formData = new FormData()
        formData.append 'image', file
        formData.append 'product_id', productId

        #TODO: ProductImagesResource.get
        xhr = Requester.request
          url: ApiRoutes.operator_products_images_url()
          method: 'POST'
          data: formData
          contentType: false
          processData: false
          success: (data) => success?(data)
          error: (data) => error?(data)

        xhrs.push xhr

    $.when.apply($, xhrs).done ->
      ProductsResource.get {
        productId: productId
        success: (product) ->
          OperatorProductsServerActions.updateProduct {
            product:    product
            categoryId: product.category_id
          }
      }