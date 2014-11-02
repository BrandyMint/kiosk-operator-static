###* @jsx React.DOM ###

###*global React, OperatorProductsServerActions, ProductsService, OperatorProductsStore ###

STATE_LOADING = 'loading'
STATE_READY   = 'ready'

window.OperatorProducts = React.createClass
  propTypes:
    category:     React.PropTypes.object.isRequired

  getInitialState: ->
    currentState: STATE_LOADING
    category:     @props.category

  componentDidMount: ->
    ProductsService.getProducts()
    OperatorProductsStore.addChangeListener @_onChange

  componentWillReceiveProps: (nextProps) ->
    if nextProps.category.id != @props.category.id
      @setState(category: nextProps.category)

  componentWillUnmount: ->
    OperatorProductsStore.removeChangeListener @_onChange

  render: ->
    switch @state.currentState
      when STATE_READY
        `<div className = "adm-categories-content"
              ref       = "products">
          <table className="adm-categories-goods">
            <thead>
              <tr>
                <td colSpan="2">
                  Товар
                </td>
                <td className="adm-categories-goods-price">
                  Цена
                </td>
                <td className="adm-categories-goods-status">
                  Статус
                </td>
              </tr>
            </thead>
            <OperatorProducts_ListBody category={ this.state.category } />
          </table>
        </div>`
      when STATE_LOADING
        `<div className = "adm-categories-content"
              ref       = "products">
          <i className="fa fa-spinner fa-3x fa-spin" />
        </div>`

  _onChange: ->
    @setState
      currentState: STATE_READY
