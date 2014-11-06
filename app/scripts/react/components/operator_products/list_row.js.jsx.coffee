###* @jsx React.DOM ###

###*global window, React, ProductState, ModalService, Routes ###

window.OperatorProducts_Row = React.createClass
  mixins: [ProductDraggable]

  propTypes:
    product: React.PropTypes.object.isRequired

  render: ->
    `<tr onClick      ={ this.handleItemClick }
         data-category-id={this.props.product.category_id}
         data-product-id={ this.props.product.id }>
      <td className  = "adm-categories-goods-cover"
          data-title = "Товар">
            <ProductThumb product={this.props.product} />
      </td>
      <td className="adm-categories-goods-content">
        { this.props.product.title }
      </td>
      <td className  = "adm-categories-goods-price"
          data-title = "Сумма" >
        <span className="nobr">
          { (this.props.product.price.cents/100).toLocaleString('ru-RU') } руб
        </span>
      </td>
      <td className  = "adm-categories-goods-status"
          data-title = "Статус">
        <ProductState state={ this.props.product.state } />
      </td>
    </tr>`


  handleItemClick: (e) ->
    if not @state.isDragged
      ModalService.show Routes.edit_operator_product_url @props.product.id
