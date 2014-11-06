###* @jsx React.DOM ###

###*global window, React ###

window.OperatorProducts_Row_DragHelper = React.createClass
  propTypes:
    product: React.PropTypes.object.isRequired

  render: ->

    `<span className="adm-categories-goods-draghelper"><table><tbody><tr>
      <td className  = "adm-categories-goods-cover"
          data-title = "Товар">
        <img
          src={ this.imageUrl() }
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


  imageUrl: -> AppHelpers.productImageUrl @props.product
