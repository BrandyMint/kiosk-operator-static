###* @jsx React.DOM ###

window.OperatorCategories_Item = React.createClass
  propTypes:
    category:     React.PropTypes.object.isRequired
    onItemClick:  React.PropTypes.func.isRequired

  render: ->
    `<div className="hoverable-container operator-categories__item">

      <a className="operator-categories__item-title" onClick={this.itemClick}>
        <i className="fa fa-bars"></i>
        &nbsp;&nbsp;&nbsp;
        <span>{this.props.category.value}</span>
        &nbsp;&nbsp;&nbsp;
        <span className="operator-categories__item-counter">{this.props.category.count}</span>
        <span className="pull-right">
          <i className="fa fa-angle-right text-muted"></i>
        </span>
      </a>

      <a className="hoverable operator-categories__item-delete pull-right" href="#todo">
        <i className="fa fa-times"></i>
      </a>

      <a className="hoverable operator-categories__item-edit pull-right" href="#todo">
        <i className="fa fa-pencil"></i>
      </a>

      <span className="clearfix"></span>

    </div>`

  itemClick: (e) ->
    e.preventDefault
    @props.onItemClick @props.category
    false
