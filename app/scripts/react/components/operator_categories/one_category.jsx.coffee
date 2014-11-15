###* @jsx React.DOM ###

window.OperatorCategories_OneCategory = React.createClass

  propTypes:
    parentCategory:   React.PropTypes.object.isRequired
    currentCategory:  React.PropTypes.object.isRequired
    onCategorySelect: React.PropTypes.func.isRequired

  render: ->
   `<div className="adm-categories-grid">
      <div className="adm-categories-grid-col">
        <OperatorCategories_List
            parentCategory={ this.props.parentCategory }
            currentCategory={ this.props.currentCategory }
            onCategorySelect={ this.props.onCategorySelect } />
      </div>
      <div className="adm-categories-grid-col __wide">

      </div>
    </div>`

# <OperatorProducts
  # categoryId={ this.props.currentCategory.id } />