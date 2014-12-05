###* @jsx React.DOM ###

#TODO: i18n
TITLE = 'Без категории'

window.OperatorCategories_ListItemWithoutCategory = React.createClass

  propTypes:
    category:         React.PropTypes.object.isRequired
    isActive:         React.PropTypes.bool.isRequired
    onCategorySelect: React.PropTypes.func.isRequired

  render: ->
    totalCount = @props.category.current_products_count
    itemClasses = React.addons.classSet {
      'adm-categories-item': true
      '__muted': true
      'selected': @props.isActive
    }

    return `<div className={ itemClasses }
                 onClick={ this.handleClick }>
              <span className="adm-categories-item-name">
                { TITLE }
              </span>
              <span className="adm-categories-item-counter">
                { totalCount }
              </span>
            </div>`

  handleClick: ->
    @props.onCategorySelect {
      category: @props.category
      includeSubcategories: false
    }
