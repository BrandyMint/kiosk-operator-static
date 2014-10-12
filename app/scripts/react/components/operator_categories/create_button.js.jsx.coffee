###* @jsx React.DOM ###

###*global React, OperatorCategoriesActions ###

window.OperatorCategories_CreateButton = React.createClass
  propTypes:
    onClick: React.PropTypes.func.isRequired

  render: ->
    `<div>
      <a className="btn btn-default" onClick={ this.props.onClick }>Создать категорию</a>
    </div>`
