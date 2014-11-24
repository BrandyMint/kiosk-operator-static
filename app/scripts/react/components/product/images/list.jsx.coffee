###* @jsx React.DOM ###

ProductImages_Image = require './image'

ProductImages_List = React.createClass

  propTypes:
    images:        React.PropTypes.array.isRequired
    onRemoveImage: React.PropTypes.func.isRequired

  render: ->
    that = @
    images = @props.images.map (image) ->
      `<ProductImages_Image
          image={ image }
          onRemoveImage={ that.props.onRemoveImage }
          key={ image.id || image.src } />`

    return `<div className="products__new-form-images-list-list">
              { images }
            </div>`

module.exports = ProductImages_List