###* @jsx React.DOM ###

###*global React, OperatorCategoriesActions ###

window.OperatorCategories_CreateButton = React.createClass
  propTypes:
    caption:       React.PropTypes.string
    onCreateStart: React.PropTypes.func

  render: ->
    `<div>
      <a className="btn btn-default"
         onClick={ this.props.onCreateStart }>
        { this.props.caption }
      </a>
    </div>`
