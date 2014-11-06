###* @jsx React.DOM ###

###*global window, React, OperatorProductsStore, OperatorProducts_Row ###

window.OperatorProducts_ListBody = React.createClass
  propTypes:
    # Передается чтобы легко было определять что нужно перерендерить
    # в будущем будет page и per_page,
    # но ,скорее всего, это нужно делать в промежуточном компоненте
    category_id:      React.PropTypes.number.isRequired
    products:         React.PropTypes.array.isRequired

  shouldComponentUpdate: (nextProps, nextState) ->
    nextProps.category_id!=@props.category_id

  render: ->
    productRows = @props.products.map (product) ->
      `<OperatorProducts_Row
        key=     { product.id }
        product= { product }
      />`

    return `<div className = "adm-categories-content">
            <table className="adm-categories-goods">
              <thead>
                <tr>
                  <td colSpan="2">Товар</td>
                  <td className="adm-categories-goods-price">Цена</td>
                  <td className="adm-categories-goods-status">Статус</td>
                </tr>
              </thead>
              <tbody>{ productRows }</tbody>
            </table>
          </div>`

