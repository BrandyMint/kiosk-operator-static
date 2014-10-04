###* @jsx React.DOM ###

require './operator_categories_item'

window.OperatorCategories_List = React.createClass
  propTypes:
    categories: React.PropTypes.array.isRequired

  render: ->
    categoryNodes = @props.categories.map (cat) ->
      `<OperatorCategories_Item key={cat.id} category={cat} />`

    `<div className="operator-categories">
      {categoryNodes}
    </div>`
