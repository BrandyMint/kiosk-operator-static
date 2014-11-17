###* @jsx React.DOM ###

###*global React, ProductsService ###

cx = React.addons.classSet

STATE_PUBLISHED   = 'published'
STATE_HAS_ERRORS  = 'has_errors'
STATE_UNPUBLISHED = 'unpublished'
STATE_ARCHIVE     = 'archive'

MANUAL_STATE_DEFAULT   = 0
MANUAL_STATE_PUBLISHED = 1
MANUAL_STATE_DRAFT     = -1
MANUAL_STATE_ARCHIVE   = -2

window.ProductStatusToggle = React.createClass

  propTypes:
    product_id:        React.PropTypes.number.isRequired
    state:             React.PropTypes.string
    manual_state:      React.PropTypes.number

  getDefaultProps: ->
    state:             STATE_PUBLISHED
    manual_state:      MANUAL_STATE_DEFAULT

  getInitialState: ->
    state:             @props.state
    manual_state:      @props.manual_state
    localChecked:      null
    isLocalChecked:    false

  componentWillReceiveProps: (nextProps) ->
    @setState nextProps

  render: ->
    classes = cx {
      "toggle__block": true
      "checked":       @isChecked()
      "has_errors":    @hasErrors(),
      '__disabled':    @state.isLocalChecked
    }

    return `<label className={ classes }>
              <div className="toggle__block-label-checked pull-left">
                Товар на сайте
              </div>
              <div className="toggle__block-box pull-left">
                <input className="toggle__block-checkbox"
                       type=     "checkbox"
                       checked=  { this.isChecked() }
                       onChange= { this.handleInputChange }
                       ref=      "checkbox" />
                <div className="toggle__block-switch"></div>
                <div className="toggle__block-track"></div>
              </div>
              <div className="toggle__block-label-unchecked pull-left">
                Скрыть товар
              </div>
              <div className="clearfix"></div>
            </label>`

  isChecked: ->
    if @state.isLocalChecked
      @state.localChecked
    else
      @state.state == STATE_PUBLISHED

  hasErrors: ->
    @state.state == STATE_HAS_ERRORS

  # todo: Здесь потенциально имеет место нарушение Flux
  # После встраивания компонента в приложение React, ответы
  # от сервиса не должны напрямую обрабатываться в компоненте
  handleInputChange: (e) ->
    return if @state.isLocalChecked

    savedManualState = @state.manual_state
    options =
      id: @props.product_id
      success: (response) =>
        state=_.pick response, ['state', 'manual_state']
        state.isLocalChecked = false
        @setState state
      error: =>
        @setState manual_state: savedManualState, isLocalChecked: false

    if @refs.checkbox.getDOMNode().checked
      @setState manual_state: MANUAL_STATE_PUBLISHED, localChecked: true, isLocalChecked: true
      ProductsResource.publish options
      
    else
      @setState manual_state: MANUAL_STATE_ARCHIVE, localChecked: false, isLocalChecked: true
      ProductsResource.unpublish options