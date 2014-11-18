###* @jsx React.DOM ###

window.OperatorProducts_ListItem = React.createClass
  mixins: [ProductDraggable]

  propTypes:
    product: React.PropTypes.object.isRequired

  render: ->
   `<tr data-category-id={ this.props.product.category_id }
        data-product-id={ this.props.product.id }>
      <td className="adm-categories-goods-cover"
          data-title="Товар">
        <ProductThumb product={ this.props.product } />
      </td>
      <td className="adm-categories-goods-content">
        <a href={ Routes.edit_operator_product_url(this.props.product.id) }>
          { this.props.product.title }
        </a>
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
    # unless @state.isDragged
    #   ModalController.show Routes.edit_operator_product_url @props.product.id