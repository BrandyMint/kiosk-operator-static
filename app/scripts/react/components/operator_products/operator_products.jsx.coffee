###* @jsx React.DOM ###

LOADING_STATE = 'loading'
LOADED_STATE  = 'loaded'
ERROR_STATE   = 'error'

window.OperatorProducts = React.createClass
  mixins: [React.addons.PureRenderMixin]

  propTypes:
    categoryId:           React.PropTypes.number.isRequired
    includeSubcategories: React.PropTypes.bool.isRequired

  getInitialState: ->
    currentState: LOADING_STATE
    products:     null

  componentDidMount: ->
    @loadProducts @props.categoryId, @props.includeSubcategories

  componentWillReceiveProps: (nextProps) ->
    @loadProducts nextProps.categoryId, nextProps.includeSubcategories

  render: ->
    switch @state.currentState
      when LOADED_STATE
        productsContent = `<OperatorProducts_List categoryId={ this.props.categoryId } />`
      when LOADING_STATE
        productsContent = `<OperatorProducts_Loading />`
      when ERROR_STATE
        productsContent = `<OperatorProducts_LoadingError message={ this.state.errorMessage } />`
      else console.warn 'Unknown currentState of OperatorProducts component', @state.currentState

    productsContent

  activateErrorState:   -> @setState(currentState: ERROR_STATE)
  activateLoadingState: -> @setState(currentState: LOADING_STATE)
  activateLoadedState:  -> @setState(currentState: LOADED_STATE)

  loadProducts: (categoryId, includeSubcategories) ->
    @activateLoadingState()
    #TODO: safeUpdateState

    OperatorProductsViewActions.loadProducts {
      data: {
        categoryId:           categoryId
        includeSubcategories: includeSubcategories
      }
      success: @activateLoadedState
      error: (errMsg) =>
        @setState {
          currentState: ERROR_STATE
          errorMessage: errMsg
        }
    }