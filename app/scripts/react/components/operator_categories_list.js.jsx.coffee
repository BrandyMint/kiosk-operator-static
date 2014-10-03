###* @jsx React.DOM ###

window.OperatorCategories_List = React.createClass
  propTypes:
    categories:       React.PropTypes.array.isRequired
    onListItemClick:  React.PropTypes.func.isRequired

  render: ->
    that = @
    categoryNodes = @props.categories.map (cat) ->
      `<OperatorCategories_Item key={ cat.id } 
                                category={ cat }
                                onItemClick={ that.props.onListItemClick } />`

    return `<div className="operator-categories">
              { categoryNodes }
            </div>`
