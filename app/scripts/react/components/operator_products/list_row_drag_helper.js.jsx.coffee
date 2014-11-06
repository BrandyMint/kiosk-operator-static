###* @jsx React.DOM ###

###*global window, React ###

window.OperatorProducts_Row_DragHelper = React.createClass
  propTypes:
    product: React.PropTypes.object.isRequired

  render: ->
    imageUrl = if @props.product.image?.url
      ThumborService.image_url @props.product.image.url, '50x50'
    else
      "assets/product-50x50-1.jpg"

    `<span className="adm-categories-goods-draghelper"><table><tbody><tr>
      <td className  = "adm-categories-goods-cover"
          data-title = "Товар">
        <img
          src={ imageUrl }
          alt={ this.props.product.title }
        />
      </td>
      <td className="adm-categories-goods-content">
        { this.props.product.title }
      </td>
    </tr></tbody></table>
    <hr />
    <i>
      Перетащите товар в категорию
    </i></span>`
