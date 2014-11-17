window.ThumborService =
  thumbor_url: gon?.thumbor_url

  image_url:  (url, style="100x100") ->
    return url if gon.env is 'static-development'

    if @thumbor_url
      @thumbor_url + "/unsafe/#{style}/" + url
    else
      url