###* @jsx React.DOM ###

ProductImages_Placeholder = require './placeholder'
ProductImages_List        = require './list'
ImagesMixin               = require './mixins/images'

window.ProductImages = React.createClass
  mixins: [ImagesMixin]

  propTypes:
    images:    React.PropTypes.array.isRequired
    fieldName: React.PropTypes.string.isRequired

  getDefaultProps: ->
    fieldName: 'product[image_ids][]'
    images: [
      {id: 4682, src: 'assets/product-1-square.png?1'}
      {id: 4681, src: 'assets/product-2-square.png?1'}
      {id: 4680, src: 'assets/product-3-square.png?1'}
    ]

  getInitialState: ->
    images: @convertRawImages()

  render: ->
   `<div className="products__new-form-images-list __small">
      <ProductImages_Placeholder onImagesAdd={ this.pushImages } />
      <ProductImages_List
          images={ this.state.images }
          fieldName={ this.props.fieldName }
          onImagesReorder={ this.updateImages }
          onImagePreload={ this.updateImage }
          onImageDelete={ this.deleteImage } />
    </div>`