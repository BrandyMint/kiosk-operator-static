###* @jsx React.DOM ###

ProductImages_Placeholder = require './placeholder'
ProductImages_List        = require './list'

window.ProductImages = React.createClass

  propTypes:
    images:    React.PropTypes.array.isRequired
    fieldName: React.PropTypes.string.isRequired

  getDefaultProps: ->
    images: [
      {id: 4682, src: 'assets/product-1-square.png?1'}
      {id: 4681, src: 'assets/product-2-square.png?1'}
      {id: 4680, src: 'assets/product-3-square.png?1'}
    ]

  getInitialState: ->
    images: @props.images

  render: ->
   `<div className="products__new-form-images-list __small">
      <ProductImages_Placeholder onImagesAdd={ this.pushImages } />
      <ProductImages_List
          images={ this.state.images }
          fieldName={ this.props.fieldName }
          onImagePreload={ this.updateImage }
          onImageDelete={ this.deleteImage } />
    </div>`

  updateImage: (oldImage, data) ->
    newImages = @state.images[..]

    for newImage in newImages when newImage is oldImage
      _.extend newImage, data
      break

    @setState(images: newImages)

  pushImages: (images) ->
    newImages = @state.images.concat images

    @setState(images: newImages)

  deleteImage: (image) ->
    newImages = @state.images[..]

    for newImage, i in newImages when newImage is image
      newImages.splice i, 1
      break

    @setState(images: newImages)