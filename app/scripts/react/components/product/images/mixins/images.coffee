ImagesMixin = 

  propTypes:
    images: React.PropTypes.array.isRequired

  updateImages: (imagesData) ->
    newImages = @state.images[..]

    for newImage in newImages
      for imageData in imagesData when imageData.id == newImage.id
        _.extend newImage, imageData
        break

    @setState(images: newImages)

  updateImage: (oldImage, data) ->
    newImages = @state.images[..]

    for newImage in newImages when newImage is oldImage
      _.extend newImage, data
      break

    @setState(images: newImages)

  pushImages: (images) ->
    newImages = @state.images[..]
    lastImagePosition = 0

    if newImages.length
      lastImagePosition = newImages[newImages.length - 1].position + 1

    for image in images
      _.extend image, { position: ++lastImagePosition }
      newImages.push image

    @setState(images: newImages)

  deleteImage: (image) ->
    newImages = @state.images[..]

    for newImage, i in newImages when newImage is image
      newImages.splice i, 1
      break

    @setState(images: newImages)

  convertRawImages: ->
    @props.images.map (image, i) ->
      image.position = i
      image

module.exports = ImagesMixin