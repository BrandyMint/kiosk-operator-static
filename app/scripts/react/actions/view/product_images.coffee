window.ProductImagesViewActions =

  preloadImage: ({file, success, error}) ->
    formData = new FormData()
    formData.append 'image', file

    Requester.request
      url: ApiRoutes.operator_products_images_url()
      method: 'POST'
      data: formData
      contentType: false
      processData: false
      success: (data) => success?(data)
      error: (data) => error?(data)