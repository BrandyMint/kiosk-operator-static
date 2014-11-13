###* @jsx React.DOM ###

window.OperatorCategories_TwoCategories = React.createClass

  propTypes:
    firstCategory:    React.PropTypes.object.isRequired
    secondCategory:   React.PropTypes.object.isRequired
    selectedCategory: React.PropTypes.object.isRequired
    productQuery:     React.PropTypes.string
    productState:     React.PropTypes.string
    onSelectCategory: React.PropTypes.func.isRequired

  render: ->
   `<div className="adm-categories-grid">
      <div className="adm-categories-grid-col">
        <OperatorCategories_List
            parentCategory={ this.props.firstCategory }
            selectedCategory={ this.props.selectedCategory }
            onSelectCategory={ this.props.onSelectCategory } />
      </div>
      <div className="adm-categories-grid-col">
         <OperatorCategories_List
             parentCategory={ this.props.secondCategory }
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