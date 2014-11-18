###* @jsx React.DOM ###

window.OperatorProducts_ListItem = React.createClass
  mixins: [ProductDraggable]

  propTypes:
    product: React.PropTypes.object.isRequired

  render: ->
   `<tr className="adm-categories-goods-item"
        data-category-id={ this.props.product.category_id }
        data-product-id={ this.props.product.id }
        onClick={ this.handleClick }>
      <td className="adm-categories-goods-cover"
          data-title="Товар">
        <ProductThumb product={ this.props.product } />
      </td>
      <td className="adm-categories-goods-content">
        { this.props.product.title }
      </td>
      <td className="adm-categories-goods-price"
          data-title="Сумма">
        <Money money={ this.props.product.price } />
      </td>
      <td className="adm-categories-goods-status"
          data-title="Статус">
        <ProductState state={ this.props.product.state } />
      </td>
    </tr>`

  handleClick: (e) ->
    window.location = Routes.edit_operator_product_url @props.product.id
    # unless @state.isDragged
    #   ModalController.show Routes.edit_operator_product_url @props.product.id