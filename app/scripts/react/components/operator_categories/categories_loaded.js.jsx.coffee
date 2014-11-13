###* @jsx React.DOM ###

window.OperatorCategories_CategoriesLoaded = React.createClass

  propTypes:
    parentCategory:   React.PropTypes.object.isRequired
    selectedCategory: React.PropTypes.object.isRequired
    productQuery:     React.PropTypes.string
    productState:     React.PropTypes.string
    onSelectCategory: React.PropTypes.func.isRequired

  render: ->
    selectedCategory = @props.selectedCategory
    selectedLevel    = OperatorCategoriesStore.getCategoryLevel selectedCategory

    switch selectedLevel
      when 0 then categoriesContent = `<OperatorCategories_OneCategory
                                           parentCategory={ this.props.parentCategory }
                                           selectedCategory={ selectedCategory }
                                           productQuery={ this.props.productQuery }
                                           productState={ this.props.productState }
                                           onSelectCategory={ this.props.onSelectCategory } />`

      when 1 then categoriesContent = `<OperatorCategories_TwoCategories
                                           firstCategory={ this.props.parentCategory }
                                           secondCategory={ selectedCategory }
                                           selectedCategory={ selectedCategory }
                                           productQuery={ this.props.productQuery }
                                           productState={ this.props.productState }
                                           onSelectCategory={ this.props.onSelectCategory } />`

      when 2
        secondCategory = OperatorCategoriesStore.getCategoryById selectedCategory.parent_id
        categoriesContent = `<OperatorCategories_TwoCategories
                                 firstCategory={ this.props.parentCategory }
                                 secondCategory={ secondCategory }
                                 selectedCategory={ selectedCategory }
                                 productQuery={ this.props.productQuery }
                                 productState={ this.props.productState }
                                 onSelectCategory={ this.props.onSelectCategory } />`

    categoriesContent