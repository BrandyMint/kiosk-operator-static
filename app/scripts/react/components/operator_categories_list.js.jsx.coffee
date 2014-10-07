###* @jsx React.DOM ###

ReactCSSTransitionGroup = React.addons.CSSTransitionGroup

window.OperatorCategories_List = React.createClass
  propTypes:
    categories:       React.PropTypes.array.isRequired
    onListItemClick:  React.PropTypes.func.isRequired
    onCategoryDelete: React.PropTypes.func.isRequired
    onCategoryUpdate: React.PropTypes.func.isRequired

  getInitialState: ->
    # Пока берём только категории высшего уровня (корневые)
    categoryList: _.filter(@props.categories, (i) -> i.parent_id == null)

  render: ->
    that = @
    categoryNodes = @state.categoryList.map (cat) ->
      `<OperatorCategories_Item key=              { cat.id }
                                category=         { cat }
                                onItemClick=      { that.props.onListItemClick }
                                onCategoryDelete= { that.props.onCategoryDelete }
                                onCategoryUpdate= { that.props.onCategoryUpdate } />`

    return `<div className="operator-categories">
              {/*
                Похоже, здесь срабатывает какой-то баг, типа этого
                https://github.com/facebook/react/issues/2104
                не получается толком задать параметры анимации (в _categories.sass)
              */}
              <ReactCSSTransitionGroup transitionName="operator-categories-transition">
                { categoryNodes }
              </ReactCSSTransitionGroup>
            </div>`
