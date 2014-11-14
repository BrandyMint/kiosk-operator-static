###* @jsx React.DOM ###

window.OperatorProducts_List = React.createClass

  propTypes:
    # Передается чтобы легко было определять что нужно перерендерить
    # в будущем будет page и per_page,
    # но ,скорее всего, это нужно делать в промежуточном компоненте
    categoryId: React.PropTypes.number.isRequired
    products:   React.PropTypes.array.isRequired

  shouldComponentUpdate: (nextProps) ->
    nextProps.categoryId != @props.categoryId

  render: ->
    products = @props.products.map (product) ->
      `<OperatorProducts_ListItem
            product={ product }
            key={ product.id } />`

    return `<div className = "adm-categories-content">
              <table className="adm-categories-goods">
                <thead>
                  <tr>
                    <td colSpan="2">Товар</td>
                    <td className="adm-categories-goods-price">Цена</td>
                    <td className="adm-categories-goods-status">Статус</td>
                  </tr>
                </thead>
                <tbody>{ products }</tbody>
              </table>
            </div>`