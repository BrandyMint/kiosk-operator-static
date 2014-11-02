###* @jsx React.DOM ###

###*global window, React, ProductState, ModalService, Routes ###

window.OperatorProducts_Row = React.createClass
  mixins: [ProductDraggable]

  propTypes:
    product: React.PropTypes.object.isRequired

  render: ->
    imageUrl = if @props.product.image?.url
      ThumborService.image_url @props.product.image.url, '50x50'
    else
      "assets/product-50x50-1.jpg"

    `<tr onClick      ={ this.handleItemClick }
         data-objectid={ this.props.product.id }>
      <td className  = "adm-categories-goods-cover"
          data-title = "Товар"
          role>
        <img
          src={ imageUrl }
          alt={ this.props.product.title }
        />
      </td>
      <td className="adm-categories-goods-content"
          role>
        { this.props.product.title }
      </td>
      <td className  = "adm-categories-goods-price"
          data-title = "Сумма"
          role>
        <span className="nobr">
          { (this.props.product.price.cents/100).toLocaleString('ru-RU') } руб
        </span>
      </td>
      <td className  = "adm-categories-goods-status"
          data-title = "Статус"
          role>
        <ProductState state={ this.props.product.state } />
      </td>
    </tr>`

  handleItemClick: (e) ->
    if not @state.isDragged
      ModalService.show Routes.operator_product_path @props.product.id
