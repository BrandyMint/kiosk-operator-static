###* @jsx React.DOM ###

###*global React, ProductsService ###

cx = React.addons.classSet

STATE_PUBLISHED   = 'published'
STATE_HAS_ERRORS  = 'has_errors'
STATE_UNPUBLISHED = 'unpublished'
STATE_ARCHIVE     = 'archive'

MANUAL_STATE_DEFAULT   = 0
MANUAL_STATE_PUBLISHED = 1
MANUAL_STATE_DRAFT     = 2
MANUAL_STATE_ARCHIVE   = 3

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

  componentWillReceiveProps: (nextProps) ->
    @setState nextProps

  render: ->
    isChecked = @state.state == STATE_PUBLISHED and
      @state.manual_state in [MANUAL_STATE_DEFAULT, MANUAL_STATE_PUBLISHED]
    hasErrors = @state.state == STATE_HAS_ERRORS

    classes = cx {
      "toggle__block": true
      "checked":       isChecked
      "has_errors":    hasErrors
    }

    return `<label className={ classes }
                   role=     "product-toggle">
              <div className="toggle__block-label-checked pull-left">
                Товар на сайте
              </div>
              <div className="toggle__block-box pull-left">
                <input className="toggle__block-checkbox"
                       type=     "checkbox"
                       checked=  { isChecked }
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

  # todo: Здесь потенциально имеет место нарушение Flux
  # После встраивания компонента в приложение React, ответы
  # от сервиса не должны напрямую обрабатываться в компоненте
  handleInputChange: (e) ->
    that = @
    if @refs.checkbox.getDOMNode().checked
      @setState {
        state:        STATE_PUBLISHED
        manual_state: MANUAL_STATE_PUBLISHED
      }
      ProductsService.tryPublish {
        id: @props.product_id
        success: (response) ->
          that.setState _.pick response, ['state', 'manual_state']
      }
    else
      if @state.manual_state in [MANUAL_STATE_DEFAULT, MANUAL_STATE_PUBLISHED]
        @setState(state: STATE_UNPUBLISHED)
      ProductsService.tryUnpublish {
        id: @props.product_id
        success: (response) ->
          that.setState _.pick response, ['state', 'manual_state']
      }
