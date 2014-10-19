###* @jsx React.DOM ###

###*global React ###

STATE_LOADING = 'loading'
STATE_LOADED  = 'loaded'

window.ModalComponent = React.createClass

  propTypes:
    url:   React.PropTypes.string.isRequired

  getInitialState: ->
    state: STATE_LOADING

  componentDidMount: ->
    jqNode = $ @getDOMNode()
    jqNode.modal 'show'
    that = @
    $(that.refs.content.getDOMNode()).load that.props.url, ->
      that.setState(state: STATE_LOADED)
      jqNode.on 'hidden.bs.modal', ->
        React.unmountComponentAtNode jqNode[0]
        jqNode.remove()

  render: ->
    spinner = if @state.state == STATE_LOADING
     `<div className="modal-body">
        <div className="text-center">
          <i className="fa fa-spinner fa-5x fa-spin" />
        </div>
      </div>`
    else
      null

    return `<div className   = "modal fade"
                 aria-hidden = "true"
                 tabIndex    = "-1">
              <div className = "modal-dialog modal-lg">
                <div className = "modal-content">
                  { spinner }
                  <div ref = "content" />
                </div>
              </div>
            </div>`
