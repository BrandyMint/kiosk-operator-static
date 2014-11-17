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

    switch currentCategoryLevel
      when 0
        categoriesContent = `<OperatorCategories_OneCategory
                                 parentCategory={ this.props.parentCategory }
                                 currentCategory={ currentCategory }
                                 productQuery={ this.props.productQuery }
                                 productState={ this.props.productState }
                                 includeSubcategories={ this.props.includeSubcategories }
                                 onCategorySelect={ this.props.onCategorySelect } />`

      when 1
        categoriesContent = `<OperatorCategories_TwoCategories
                                 firstCategory={ this.props.parentCategory }
                                 secondCategory={ currentCategory }
                                 currentCategory={ currentCategory }
                                 productQuery={ this.props.productQuery }
                                 productState={ this.props.productState }
                                 includeSubcategories={ this.props.includeSubcategories }
                                 onCategorySelect={ this.props.onCategorySelect } />`

      when 2
        secondCategory = OperatorCategoriesStore.getCategoryById currentCategory.parent_id
        categoriesContent = `<OperatorCategories_TwoCategories
                                 firstCategory={ this.props.parentCategory }
                                 secondCategory={ secondCategory }
                                 currentCategory={ currentCategory }
                                 productQuery={ this.props.productQuery }
                                 productState={ this.props.productState }
                                 includeSubcategories={ this.props.includeSubcategories }
                                 onCategorySelect={ this.props.onCategorySelect } />`

    categoriesContent