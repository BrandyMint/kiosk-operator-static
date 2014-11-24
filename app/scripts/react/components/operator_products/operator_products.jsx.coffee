###* @jsx React.DOM ###

LOADING_MORE_STATE = 'loading_more_state'
LOADING_STATE      = 'loading'
LOADED_STATE       = 'loaded'
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
    # Category is changed
    if nextProps.categoryId != @props.categoryId
      @setState {
        page: 1
        isAllProductsLoaded: false
      }
      @loadProducts nextProps.categoryId, nextProps.includeSubcategories

  render: ->
    switch @state.currentState
      when LOADED_STATE
        productsContent = `<OperatorProducts_List
                               categoryId={ this.props.categoryId } />`
      when LOADING_STATE
        productsContent = `<OperatorProducts_Loading />`
      when LOADING_MORE_STATE
        #TODO: Display spinner at the end of products list
        productsContent = `<OperatorProducts_List
                               categoryId={ this.props.categoryId } />`
      when ERROR_STATE
        productsContent = `<OperatorProducts_LoadingError
                               message={ this.state.errorMessage } />`
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
      data: {
        categoryId:           categoryId
        filter:               @props.productsFilter
        includeSubcategories: includeSubcategories
      }
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

  loadMoreProducts: ->
    @activateLoadingMoreState()

    OperatorProductsViewActions.loadMoreProducts {
      data: {
        categoryId:           @props.categoryId
        filter:               @props.productsFilter
        includeSubcategories: @props.includeSubcategories
        page:                 @state.page + 1
      }
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