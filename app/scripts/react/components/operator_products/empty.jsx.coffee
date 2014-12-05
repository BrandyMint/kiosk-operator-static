###* @jsx React.DOM ###

OperatorProducts_AddProductButton = require './buttons/add_product'

window.OperatorProducts_Empty = React.createClass

  render: ->
   `<div className="adm-categories-content">
      <OperatorProducts_AddProductButton />
      <div className="adm-categories-content-empty">
        В данной категории товаров нет.
      </div>
    </div>`