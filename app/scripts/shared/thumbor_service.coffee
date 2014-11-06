window.ThumborService =
  thumbor_url: gon?.thumbor_url

  image_url:  (url, style="100x100") ->
    if gon.env is 'static-development'
      return url
    else
      @thumbor_url + "unsafe/#{style}/" + url
