###* @jsx React.DOM ###

###*global React, Routes ###

STATE_LOADING = 'loading'
STATE_LOADED  = 'loaded'

window.OperatorCategories_ProductsPane = React.createClass
  propTypes:
    selectedCategory: React.PropTypes.object

  getInitialState: ->
    state: STATE_LOADING

  componentDidMount: ->
    @_reloadProducts @props.selectedCategory

  componentWillReceiveProps: (nextProps) ->
    if (nextProps.selectedCategory != @props.selectedCategory)
      @_reloadProducts nextProps.selectedCategory

  render: ->
    spinner = if @state.state == STATE_LOADING
     `<div className="modal-body">
        <div className="text-center">
          <i className="fa fa-spinner fa-5x fa-spin" />
        </div>
      </div>`
    else
      null

    return `<span>
              { spinner }
              <div className="adm-categories-content"
                   ref=      "products" />
            </span>`

  _reloadProducts: (category) ->
    productsNode = @refs.products.getDOMNode()
    $(productsNode).empty()
    @setState(state: STATE_LOADING)
    if category
      url = Routes.products_by_category_url category.id
      that = @
      $(productsNode).load url, ->
        that.setState(state: STATE_LOADED)
    else
      $(productsNode).empty()
      @setState(state: STATE_LOADED)
