window.AppHelpers =

  # Ставит фокус на input и выделяет содержимое
  reselectAndFocus: (el) ->
    el.focus()
    el.selectionStart = el.selectionEnd = el.value.length

  productImageUrl: (product, style='50x50') ->
    if product.image?.url
      ThumborService.image_url product.image.url, style
    else
      gon.fallback_product_thumb_url


