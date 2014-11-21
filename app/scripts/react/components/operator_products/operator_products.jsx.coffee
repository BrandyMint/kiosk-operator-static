###* @jsx React.DOM ###

THRESHOLD     = 50
LOADING_STATE = 'loading'
LOADED_STATE  = 'loaded'
ERROR_STATE   = 'error'

window.OperatorProducts = React.createClass
  mixins: [React.addons.PureRenderMixin]

  propTypes:
    categoryId:           React.PropTypes.number.isRequired
    productState:         React.PropTypes.string
    productQuery:         React.PropTypes.string
    includeSubcategories: React.PropTypes.bool.isRequired

  getDefaultProps: ->
    productState: null
    productQuery: null

  getInitialState: ->
    currentState: LOADING_STATE
    products:     null
    page:         1

  componentDidMount: ->
    @loadProducts @props.categoryId, @props.includeSubcategories

    $(window).on 'scroll', @handleScroll

  componentDidUpdate: (prevProps, prevState) ->
    if prevState.page != @state.page
      @loadProducts @props.categoryId, @props.includeSubcategories

  componentWillReceiveProps: (nextProps) ->
    @loadProducts nextProps.categoryId, nextProps.includeSubcategories

  componentWillUnmount: ->
    $(window).off 'scroll', @handleScroll

  render: ->
    switch @state.currentState
      when LOADED_STATE
        productsContent = `<OperatorProducts_List
                               categoryId={ this.props.categoryId } />`
      when LOADING_STATE
        productsContent = `<OperatorProducts_List
                               categoryId={ this.props.categoryId } />`
      when ERROR_STATE
        productsContent = `<OperatorProducts_LoadingError
                               message={ this.state.errorMessage } />`
      else console.warn 'Unknown currentState of OperatorProducts component', @state.currentState

    productsContent

  isLoadingState: -> @state.currentState is LOADING_STATE

  activateErrorState:   -> @setState(currentState: ERROR_STATE)
  activateLoadingState: -> @setState(currentState: LOADING_STATE)
  activateLoadedState:  -> @setState(currentState: LOADED_STATE)

  loadProducts: (categoryId, includeSubcategories) ->
    console.log 'грузим продукты'
    @activateLoadingState()
    #TODO: safeUpdateState

    OperatorProductsViewActions.loadProducts {
      data: {
        categoryId:           categoryId
        productQuery:         @props.productQuery
        productState:         @props.productState
        includeSubcategories: includeSubcategories
        page:                 @state.page
      }
      success: @activateLoadedState
      error: (errMsg) =>
        @setState {
          currentState: ERROR_STATE
          errorMessage: errMsg
        }
    }

  handleScroll: ->
    isNearBottom = $(window).scrollTop() + $(window).height() > $(document).height() - THRESHOLD

    if isNearBottom && !@isLoadingState()
      @setState(page: @state.page + 1)
      # @props.onBottomNear lastItemId