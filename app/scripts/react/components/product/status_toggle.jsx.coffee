###* @jsx React.DOM ###

SHOW_STATE    = 'show'
ERROR_STATE   = 'error'
PROCESS_STATE = 'process'

window.StatusToggle = React.createClass

  propTypes:
    titleOn:      React.PropTypes.string.isRequired
    titleOff:     React.PropTypes.string.isRequired
    url:          React.PropTypes.string.isRequired
    method:       React.PropTypes.string.isRequired
    fieldName:    React.PropTypes.string.isRequired
    currentValue: React.PropTypes.bool.isRequired
    disabled:     React.PropTypes.bool

  getDefaultProps: ->
    disabled: false

  getInitialState: ->
    currentState: SHOW_STATE
    checked: @props.currentValue

  render: ->
    statusClasses = React.addons.classSet
      'toggle__block': true
      'checked':       @state.checked

    return `<label className={ statusClasses }>
              <div className="toggle__block-label-checked pull-left">
                { this.props.titleOn }
              </div>
              <div className="toggle__block-box pull-left">
                <input type="checkbox"
                       checked={ this.state.checked }
                       disabled={ this.props.disabled }
                       className="toggle__block-checkbox"
                       onChange={ this.handleInputChange } />
                <div className="toggle__block-switch" />
                <div className="toggle__block-track" />
              </div>
              <div className="toggle__block-label-unchecked pull-left">
                { this.props.titleOff }
              </div>
              <div className="clearfix" />
            </label>`

  isProcessState: -> @state.currentState is PROCESS_STATE

  handleInputChange: (e) ->
    return e.preventDefault() if @isProcessState() || @props.disabled

    checked = e.target.checked
    data = {}
    data[@props.fieldName] = checked

    Requester.request
      url: @props.url
      data: data
      method: @props.method
      success: => @setState(checked: checked)
      error: (data) =>
        alert data.responseJSON?.error || 'Ошибка'
        @setState(checked: !checked)