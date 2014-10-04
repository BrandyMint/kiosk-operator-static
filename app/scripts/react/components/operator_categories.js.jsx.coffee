###* @jsx React.DOM ###

require './operator_categories_newcat'
require './operator_categories_list'
require './operator_categories_subcats'

window.OperatorCategories = React.createClass
  propTypes:
    categories:       React.PropTypes.array.isRequired

  getInitialState: ->
    categories:       @props.categories
    selectedCategory: null

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
      <div className="col-md-6">
        <OperatorCategories_NewCat />
        <br />
        <OperatorCategories_List categories={this.state.categories} />
      </div>
      <div className="col-md-6">
        {this.state.selectedCategory ? <OperatorCategories_Subcategories /> : null}
      </div>
    </div>`
