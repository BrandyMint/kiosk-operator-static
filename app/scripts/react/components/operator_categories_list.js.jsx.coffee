###* @jsx React.DOM ###

window.OperatorCategories_List = React.createClass
  propTypes:
    categories:  React.PropTypes.array.isRequired
    onListItemClick: React.PropTypes.func.isRequired

  render: ->
    _this = @
    categoryNodes = @props.categories.map (cat) ->
      `<OperatorCategories_Item key={cat.id} category={cat} onItemClick={_this.props.onListItemClick} />`

    `<div className="operator-categories">
      {categoryNodes}
    </div>`
