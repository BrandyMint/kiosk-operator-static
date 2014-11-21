###* @jsx React.DOM ###

window.OperatorCategories_Loaded = React.createClass

  propTypes:
    parentCategory:       React.PropTypes.object.isRequired
    currentCategory:      React.PropTypes.object.isRequired
    productQuery:         React.PropTypes.string
    productState:         React.PropTypes.string
    includeSubcategories: React.PropTypes.bool.isRequired
    onCategorySelect:     React.PropTypes.func.isRequired

  render: ->
    currentCategory      = @props.currentCategory
    currentCategoryLevel = OperatorCategoriesStore.getCategoryLevel currentCategory

    if currentCategoryLevel == 0
      categoriesContent = `<OperatorCategories_OneCategory
                               parentCategory={ this.props.parentCategory }
                               currentCategory={ currentCategory }
                               includeSubcategories={ this.props.includeSubcategories }
                               onCategorySelect={ this.props.onCategorySelect } />`
    else
      categoriesContent = `<OperatorCategories_TwoCategories
                               parentCategory={ this.props.parentCategory }
                               currentCategory={ currentCategory }
                               includeSubcategories={ this.props.includeSubcategories }
                               onCategorySelect={ this.props.onCategorySelect } />`

    categoriesContent

    return `<div className="adm-categories-grid">
              { categoriesContent }
              <div className="adm-categories-grid-col __wide">
                <OperatorProducts
                    categoryId={ this.props.currentCategory.id }
                    productState={ this.props.productState }
                    productQuery={ this.props.productQuery }
                    includeSubcategories={ this.props.includeSubcategories } />
              </div>
            </div>`