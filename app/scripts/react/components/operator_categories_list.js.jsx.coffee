###* @jsx React.DOM ###

require './operator_categories_item'

window.OperatorCategories_List = React.createClass
  propTypes:
    categories: React.PropTypes.array.isRequired

  render: ->
    # http://stackoverflow.com/questions/20913288/react-js-how-to-pass-properties-object-to-child-component
    categoryNodes = @props.categories.map (cat) ->
      window.OperatorCategories_Item cat

    `<div className="operator-categories">
      {categoryNodes}
    </div>`
