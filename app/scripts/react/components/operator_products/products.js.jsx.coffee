###* @jsx React.DOM ###

###*global React, OperatorProductsServerActions, ProductsService, OperatorProductsStore ###

STATE_LOADING = 'loading'
STATE_READY   = 'ready'
STATE_ERROR   = 'error'

window.OperatorProducts = React.createClass
  mixins: [React.addons.PureRenderMixin]
  propTypes:
    category_id:    React.PropTypes.number.isRequired
    productState:   React.PropTypes.string
    productQuery:   React.PropTypes.string

  getInitialState: ->
    currentState:   STATE_LOADING
    products:       null

  getDefaultProps: ->
    productState:   null
    productQuery:   null

  componentDidMount: -> @pullProducts @props.category_id

  componentWillReceiveProps: (nextProps) -> @pullProducts nextProps.category_id

  render: ->
    switch @state.currentState
      when STATE_READY
        return `<OperatorProducts_ListBody category_id={this.props.category_id} products={this.state.products} />`
      when STATE_LOADING
        return `<OperatorProducts_Process />`
      when STATE_ERROR
        return `<OperatorProducts_Error message={this.state.errorMessage}/>`
      else
        console.error? "Unknown state: #{@state.currentState}"

  _onChange: ->
    @setState
      currentState: STATE_READY

  pullProducts: (category_id) ->
    @setState currentState: STATE_LOADING
    ProductsResource.index
      data:
        query:       @props.productQuery
        state:       @props.productState
        category_id: category_id
      success: (products) =>
        @setState products: products, currentState: STATE_READY
      error: (error)=>
        @setState currentState: STATE_ERROR, errorMessage: error


window.OperatorProducts_Process = React.createClass
  render: -> `<div className = "adm-categories-content"> <Spinner className="fa-3x" /> </div>`


window.OperatorProducts_Error = React.createClass
  propTypes:
    message: React.PropTypes.string.isRequired

  render: -> `<div className = "adm-categories-content"> Ошибка загузки {this.props.message} </div>`
