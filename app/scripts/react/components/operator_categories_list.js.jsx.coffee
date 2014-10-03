###* @jsx React.DOM ###

window.OperatorCategories_List = React.createClass
  propTypes:
    categories: React.PropTypes.array.isRequired

  getInitialState: ->
    categories: @props.categories

  getDefaultProps: ->
    categories:
      [
        {"value": "Браслет-нить", "count": 144}
        {"value": "На шею", "count": 34}
        {"value": "Кольцо", "count": 152}
        {"value": "Браслет", "count": 28}
        {"value": "Украшение на тело", "count": 14}
      ]

  render: ->
    # http://stackoverflow.com/questions/20913288/react-js-how-to-pass-properties-object-to-child-component
    categoryNodes = @state.categories.map (cat) ->
      window.OperatorCategories_Item cat

    `<div className="operator-categories">
      {categoryNodes}
    </div>`
