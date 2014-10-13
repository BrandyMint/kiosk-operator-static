###* @jsx React.DOM ###

cx = React.addons.classSet

window.ProductStatusToggle = React.createClass

  propTypes:
    isPublishedByUser: React.PropTypes.bool.isRequired
    hasError:          React.PropTypes.bool
    onChange:          React.PropTypes.func

  getDefaultProps: ->
    hasError: false

  getInitialState: ->
    isChecked: @props.isPublishedByUser and not @props.hasError

  componentWillReceiveProps: (nextProps) ->
    _updateChecked nextProps.isPublishedByUser, nextProps.hasError

  render: ->
    classes = cx {
      "toggle__block": true
      "checked":       @state.isChecked
      "disabled":      @props.hasError #<div className="form-group">
    }

    `<label className={ classes }
           role=     "product-toggle">
      <div className="toggle__block-label-checked pull-left">
        Товар на сайте
      </div>
      <div className="toggle__block-box pull-left">
        <input className="toggle__block-checkbox"
               type=     "checkbox"
               checked=  { this.state.isChecked }
               onChange= { this.handleInputChange }
               ref=      "checkbox"
               disabled= { this.props.hasError } />
        <div className="toggle__block-switch"></div>
        <div className="toggle__block-track"></div>
      </div>
      <div className="toggle__block-label-unchecked pull-left">
        Скрыть товар
      </div>
      <div className="clearfix"></div>
    </label>`

  handleInputChange: (e) ->
    @_updateChecked @refs.checkbox.getDOMNode().checked, @props.hasError

  _updateChecked: (checked, hasError) ->
    prevChecked = @state.isChecked
    nextChecked = checked and not hasError
    @setState(isChecked: nextChecked)
    if @onChange and (prevChecked != nextChecked)
      @onChange(checked: nextChecked)
