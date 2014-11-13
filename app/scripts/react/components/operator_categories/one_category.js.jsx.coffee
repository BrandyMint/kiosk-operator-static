###* @jsx React.DOM ###

window.OperatorCategories_OneCategory = React.createClass

  propTypes:
    parentCategory:   React.PropTypes.object.isRequired
    selectedCategory: React.PropTypes.object.isRequired
    productQuery:     React.PropTypes.string
    productState:     React.PropTypes.string
    onSelectCategory: React.PropTypes.func.isRequired

  render: ->
   `<div className="adm-categories-grid">
      <div className="adm-categories-grid-col">
        <OperatorCategories_List
            parentCategory={ this.props.parentCategory }
            selectedCategory={ this.props.selectedCategory }
            onSelectCategory={ this.props.onSelectCategory } />
      </div>
      <div className="adm-categories-grid-col __wide">
        <OperatorProducts
            categoryId={ this.props.selectedCategory.id }
            productState={ this.props.productState }
            productQuery={ this.props.productQuery } />
      </div>
    </div>`