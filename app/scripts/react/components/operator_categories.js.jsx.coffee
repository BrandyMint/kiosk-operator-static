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
        {"id": 123, "value": "Браслет-нить", "count": 144}
        {"id": 115, "value": "На шею", "count": 34}
        {"id": 111, "value": "Кольцо", "count": 152}
        {"id": 102, "value": "Браслет", "count": 28}
        {"id": 100, "value": "Украшение на тело", "count": 14}
      ]

  render: ->
    `<div>
      <div className="col-md-6">
        <OperatorCategories_NewCat />
        <br />
        <OperatorCategories_List categories={this.state.categories} onListItemClick={this.handleCategoryItemClick} />
      </div>
      <div className="col-md-6">
        {this.state.selectedCategory ?
          <OperatorCategories_Subcategories selectedCategory={this.state.selectedCategory} />
          : null}
      </div>
    </div>`

  handleCategoryItemClick: (cat) ->
    @setState selectedCategory: cat
