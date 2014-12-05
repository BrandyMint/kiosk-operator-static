window.ThumborService =

  image_url: (url, style='100x100') ->
    url = _.escape url
    thumborUrl = gon?.thumbor_url
    fallbackImageUrl = gon?.fallback_product_thumb_url

    if url? && url != ''
      if @isExternalImage url
        imageUrl = thumborUrl + "/unsafe/#{style}/" + url
      else
        imageUrl = url
    else
      imageUrl = thumborUrl + "/unsafe/#{style}/" + fallbackImageUrl

    imageUrl

  isExternalImage: (url) ->
    externalImageMatcher = new RegExp '^http:'
    externalImageMatcher.test url