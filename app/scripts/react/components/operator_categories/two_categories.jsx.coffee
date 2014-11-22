###* @jsx React.DOM ###

window.OperatorCategories_TwoCategories = React.createClass

  propTypes:
    parentCategory:       React.PropTypes.object.isRequired
    currentCategory:      React.PropTypes.object.isRequired
    includeSubcategories: React.PropTypes.bool.isRequired
    onCategorySelect:     React.PropTypes.func.isRequired

  render: ->
    currentCategory      = @props.currentCategory
    currentCategoryLevel = OperatorCategoriesStore.getCategoryLevel currentCategory

    if currentCategoryLevel == 1
      secondCategory = currentCategory
    else
      secondCategory = OperatorCategoriesStore.getCategoryById currentCategory.parent_id

    return `<span>
              <div className="adm-categories-grid-col">
                <OperatorCategories_List
                    parentCategory={ this.props.parentCategory }
                    currentCategory={ this.props.currentCategory }
                    includeSubcategories={ this.props.includeSubcategories }
                    onCategorySelect={ this.props.onCategorySelect } />
              </div>
              <div className="adm-categories-grid-col">
                 <OperatorCategories_List
                     parentCategory={ secondCategory }
                     currentCategory={ this.props.currentCategory }
                     includeSubcategories={ this.props.includeSubcategories }
                     onCategorySelect={ this.props.onCategorySelect } />
              </div>
            </span>`