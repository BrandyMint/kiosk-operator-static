###* @jsx React.DOM ###

LOADING_MORE_STATE = 'loadingMoreState'
LOADING_STATE      = 'loading'
LOADED_STATE       = 'loaded'
EMPTY_STATE        = 'empty'
ERROR_STATE        = 'error'

window.OperatorProducts = React.createClass
  mixins: [React.addons.PureRenderMixin, LoadMoreProductsMixin]

  propTypes:
    categoryId:           React.PropTypes.number.isRequired
    productsFilter:       React.PropTypes.object
    includeSubcategories: React.PropTypes.bool.isRequired

  getInitialState: ->
    currentState:        LOADING_STATE
    products:            null
    page:                1
    isAllProductsLoaded: false

  componentDidMount: ->
    @loadProducts @props.categoryId, @props.includeSubcategories

  componentWillReceiveProps: (nextProps) ->
    @xhr.abort() if @xhr?

    # Category is changed
    if nextProps.categoryId != @props.categoryId
      @setState {
        page: 1
        isAllProductsLoaded: false
      }
      @loadProducts nextProps.categoryId, nextProps.includeSubcategories

  componentWillUnmount: ->
    @xhr.abort() if @xhr?
    @xhr = null

  render: ->
    switch @state.currentState
      when LOADED_STATE       then `<OperatorProducts_List
                                        categoryId={ this.props.categoryId } />`
      when LOADING_STATE      then `<OperatorProducts_Loading />`
      when LOADING_MORE_STATE then `<OperatorProducts_List
                                        categoryId={ this.props.categoryId } />`
      when EMPTY_STATE        then `<OperatorProducts_Empty />`
      when ERROR_STATE        then `<OperatorProducts_LoadingError
                                        message={ this.state.errorMessage } />`
      else console.warn 'Unknown currentState of OperatorProducts component', @state.currentState

  isLoadingMoreState: -> @state.currentState is LOADING_MORE_STATE

  activateErrorState:       -> @setState(currentState: ERROR_STATE)
  activateLoadingState:     -> @setState(currentState: LOADING_STATE)
  activateLoadingMoreState: -> @setState(currentState: LOADING_MORE_STATE)
  activateLoadedState:      -> @setState(currentState: LOADED_STATE)

  loadProducts: (categoryId, includeSubcategories) ->
    @activateLoadingState()

    @xhr = OperatorProductsViewActions.loadProducts {
      data:
        categoryId:           categoryId
        filter:               @props.productsFilter
        includeSubcategories: includeSubcategories
      success: (response) =>
        currentState = if response.total_count == 0 then EMPTY_STATE else LOADED_STATE

        @setState {
          currentState: currentState
          page: response.page
          isAllProductsLoaded: response.products.length == 0
        }
      error: (errMsg) =>
        unless errMsg is 'abort'
          @setState {
            currentState: ERROR_STATE
            errorMessage: errMsg
          }
    }

  loadMoreProducts: ->
    @activateLoadingMoreState()

    @xhr = OperatorProductsViewActions.loadMoreProducts {
      data:
        categoryId:           @props.categoryId
        filter:               @props.productsFilter
        includeSubcategories: @props.includeSubcategories
        page:                 @state.page + 1
      success: (response) =>
        @setState {
          currentState: LOADED_STATE
          page: response.page
          isAllProductsLoaded: response.products.length == 0
        }
      error: (errMsg) =>
        unless errMsg is 'abort'
          @setState {
            currentState: ERROR_STATE
            errorMessage: errMsg
          }
    }