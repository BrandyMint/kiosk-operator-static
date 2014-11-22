###* @jsx React.DOM ###

window.OperatorProducts_List = React.createClass

  propTypes:
    categoryId: React.PropTypes.number.isRequired

  getInitialState: ->
    @getStateFromStore()

  componentDidMount: ->
    OperatorProductsStore.addChangeListener @_onStoreChange

  shouldComponentUpdate: (nextProps, nextState) ->
    @state.products.length != nextState.products.length

  componentWillUnmount: ->
    OperatorProductsStore.removeChangeListener @_onStoreChange

  render: ->
    products = @state.products.map (product) ->
      `<OperatorProducts_ListItem
            product={ product }
            key={ product.id } />`

    return `<div className = "adm-categories-content">
              <table className="adm-categories-goods">
                <tbody>{ products }</tbody>
              </table>
            </div>`

  getStateFromStore: ->
    products: OperatorProductsStore.getProducts @props.categoryId

  _onStoreChange: ->
    @setState @getStateFromStore()