###* @jsx React.DOM ###

LOADING_MORE_STATE = 'loading_more_state'
LOADING_STATE      = 'loading'
LOADED_STATE       = 'loaded'
EMPTY_STATE        = 'empty'
ERROR_STATE        = 'error'

window.OperatorProducts = React.createClass
  mixins: [React.addons.PureRenderMixin, LoadMoreProductsMixin]

  propTypes:
    categoryId:           React.PropTypes.number.isRequired
    productState:         React.PropTypes.string
    productQuery:         React.PropTypes.string
    includeSubcategories: React.PropTypes.bool.isRequired

  getDefaultProps: ->
    productState: null
    productQuery: null

  getInitialState: ->
    currentState:        LOADING_STATE
    products:            null
    page:                1
    isAllProductsLoaded: false

  componentDidMount: ->
    @loadProducts @props.categoryId, @props.includeSubcategories

  componentWillReceiveProps: (nextProps) ->
    # Category is changed
    if nextProps.categoryId != @props.categoryId
      @setState {
        page: 1
        isAllProductsLoaded: false
      }
      @loadProducts nextProps.categoryId, nextProps.includeSubcategories

  render: ->
    productsContent = switch @state.currentState
      when LOADED_STATE
        `<OperatorProducts_List categoryId={ this.props.categoryId } />`
      when LOADING_STATE
        `<OperatorProducts_Loading />`
      when LOADING_MORE_STATE
        #TODO: Display spinner at the end of products list
        `<OperatorProducts_List categoryId={ this.props.categoryId } />`
      when EMPTY_STATE
        `<OperatorProducts_Empty />`
      when ERROR_STATE
        `<OperatorProducts_LoadingError message={ this.state.errorMessage } />`
      else console.warn 'Unknown currentState of OperatorProducts component', @state.currentState

    productsContent

  isLoadingMoreState: -> @state.currentState is LOADING_MORE_STATE

  activateErrorState:       -> @setState(currentState: ERROR_STATE)
  activateLoadingState:     -> @setState(currentState: LOADING_STATE)
  activateLoadingMoreState: -> @setState(currentState: LOADING_MORE_STATE)
  activateLoadedState:      -> @setState(currentState: LOADED_STATE)

  loadProducts: (categoryId, includeSubcategories) ->
    @activateLoadingState()

    OperatorProductsViewActions.loadProducts {
      data:
        categoryId:           categoryId
        productQuery:         @props.productQuery
        productState:         @props.productState
        includeSubcategories: includeSubcategories
      success: (response) =>
        currentState = if response.total_count == 0 then EMPTY_STATE else LOADED_STATE

        @setState {
          currentState: currentState
          page: response.page
          isAllProductsLoaded: response.products.length == 0
        }
      error: (errMsg) =>
        @setState {
          currentState: ERROR_STATE
          errorMessage: errMsg
        }
    }

  loadMoreProducts: ->
    @activateLoadingMoreState()

    OperatorProductsViewActions.loadMoreProducts {
      data:
        categoryId:           @props.categoryId
        productQuery:         @props.productQuery
        productState:         @props.productState
        includeSubcategories: @props.includeSubcategories
        page:                 @state.page + 1
      success: (response) =>
        @setState {
          currentState: LOADED_STATE
          page: response.page
          isAllProductsLoaded: response.products.length == 0
        }
      error: (errMsg) =>
        @setState {
          currentState: ERROR_STATE
          errorMessage: errMsg
        }
    }