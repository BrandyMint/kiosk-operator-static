###* @jsx React.DOM ###

#TODO: i18n
TITLE = 'Без категории'

window.OperatorCategories_ListItemWithoutCategory = React.createClass

  propTypes:
    category:         React.PropTypes.object.isRequired
    isActive:         React.PropTypes.bool.isRequired
    onSelectCategory: React.PropTypes.func.isRequired

  render: ->
    totalCount = @props.category.products_count
    itemClasses = React.addons.classSet {
      'adm-categories-item': true
      'selected': @props.isActive
    }

    return `<div className={ itemClasses }
                 onClick={ this.props.onSelectCategory.bind(null, this.props.category, false) }>
              <span className="adm-categories-item-name">
                { TITLE }
              </span>
              <span className="adm-categories-item-counter">
                { totalCount }
              </span>
            </div>`