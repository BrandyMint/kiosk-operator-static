###* @jsx React.DOM ###

require './operator_categories_newcat'
require './operator_categories_list'

window.OperatorCategories = React.createClass
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
    `<div>
      <OperatorCategories_NewCat />
      <br />
      <OperatorCategories_List categories={this.state.categories} />
    </div>`