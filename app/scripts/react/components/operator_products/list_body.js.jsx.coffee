###* @jsx React.DOM ###

###*global window, React, OperatorProductsStore, OperatorProducts_Row ###

window.OperatorProducts_ListBody = React.createClass
  propTypes:
    category:         React.PropTypes.object.isRequired

  getInitialState: ->
    productsToShow:   OperatorProductsStore.getSortedProductsByCategory @props.category

  componentWillReceiveProps: (nextProps) ->
    @setState
      productsToShow: OperatorProductsStore.getSortedProductsByCategory nextProps.category

  render: ->
    productRows = @state.productsToShow.map (product) ->
      `<OperatorProducts_Row
        key=     { product.id }
        product= { product }
      />`

    return `<tbody>
              { productRows }
            </tbody>`
