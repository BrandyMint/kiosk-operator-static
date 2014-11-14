###* @jsx React.DOM ###

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

  getInitialState: ->
    currentState: LOADING_STATE
    products:     null

  getDefaultProps: ->
    productState: null
    productQuery: null

  componentDidMount: ->
    @pullProducts @props.categoryId, @props.includeSubcategories

  componentWillReceiveProps: (nextProps) ->
    @pullProducts nextProps.categoryId, nextProps.includeSubcategories

  render: ->
    switch @state.currentState
      when LOADED_STATE then  productsContent = `<OperatorProducts_List
                                                     categoryId={ this.props.categoryId }
                                                     products={ this.state.products } />`
      when LOADING_STATE then productsContent = `<OperatorProducts_Loading />`
      when ERROR_STATE   then productsContent = `<OperatorProducts_LoadingError message={ this.state.errorMessage } />`
      else console.warn 'Unknown currentState of OperatorProducts component', @state.currentState

    productsContent

  activateLoadingState: -> @setState(currentState: LOADING_STATE)
  activateLoadedState:  -> @setState(currentState: LOADED_STATE)

  _onChange: ->
    @activateLoadedState()

  pullProducts: (categoryId, includeSubcategories) ->
    @activateLoadingState()
    #TODO: safeUpdateState
    ProductsResource.index
      data:
        query: @props.productQuery
        state: @props.productState
        category_id: categoryId
        include_subcategories: includeSubcategories
      success: (products) =>
        @setState {
          products: products
          currentState: LOADED_STATE
        }
      error: (error) =>
        @setState {
          currentState: ERROR_STATE
          errorMessage: error
        }