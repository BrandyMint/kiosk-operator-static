###* @jsx React.DOM ###

window.ProductThumb = React.createClass

  propTypes:
    product: React.PropTypes.object.isRequired
    style:   React.PropTypes.string

  getDefaultProps: ->
    style: '50x50'

  render: ->
    `<img src={ this.imageUrl() }
          className="adm-categories-goods-thumb"
          alt={ this.props.product.title } />`

  imageUrl: ->
    if @props.product.image?.url
      ThumborService.image_url @props.product.image.url, @props.style
    else
      gon.fallback_product_thumb_url