###* @jsx React.DOM ###

#TODO: i18n
TITLE = 'Добавить новый товар'

OperatorProducts_AddProductButton = React.createClass

  render: ->
   `<button
        className="adm-btn-add-goods"
        onClick={ this.handleClick }>
      <i className="adm-btn-add-goods-icon" />
      { TITLE }
    </button>`

  handleClick: ->
    window.location = Routes.operator_product_new_url()

module.exports = OperatorProducts_AddProductButton