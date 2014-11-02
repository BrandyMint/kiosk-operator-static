###* @jsx React.DOM ###

###*global window, React ###

window.OperatorProducts_Row = React.createClass
  propTypes:
    product: React.PropTypes.object.isRequired

  render: ->
    `<tr onClick={ this.handleItemClick }>
      <td className  = "adm-categories-goods-cover"
          data-title = "Товар"
          role>
        <img
          src="assets/product-50x50-1.jpg"
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
        <span className="label label-success">
          Опубликован
        </span>
      </td>
    </tr>`

  handleItemClick: (e) ->
    e.preventDefault()
    ModalService.show "modal-edit-product.html"
