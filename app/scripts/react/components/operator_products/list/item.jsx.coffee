###* @jsx React.DOM ###

SELECTED_STATE   = 'selected'
UNSELECTED_STATE = 'unselected'

window.OperatorProducts_ListItem = React.createClass
  mixins: [ProductDraggable]

  propTypes:
    product: React.PropTypes.object.isRequired

  getInitialState: ->
    currentState: UNSELECTED_STATE

  render: ->
    productClasses = React.addons.classSet {
      'adm-categories-goods-item': true
      '__selected': @isSelectedState()
    }

    return `<tr className={ productClasses }
                data-category-id={ this.props.product.category_id }
                data-product-id={ this.props.product.id }
                onClick={ this.handleClick }>
              <td className="adm-categories-goods-cover"
                  data-title="Товар">
                <ProductThumb product={ this.props.product } />
              </td>
              <td className="adm-categories-goods-content">
                { this.props.product.title }
              </td>
              <td className="adm-categories-goods-price"
                  data-title="Сумма">
                <Money money={ this.props.product.price } />
              </td>
              <td className="adm-categories-goods-status"
                  data-title="Статус">
                <ProductState state={ this.props.product.state } />
              </td>
            </tr>`

  isSelectedState: -> @state.currentState is SELECTED_STATE

  activateSelectedState:   -> @setState(currentState: SELECTED_STATE)
  activateUnselectedState: -> @setState(currentState: UNSELECTED_STATE)

  toggleSelectedState: ->
    if @isSelectedState()
      @activateUnselectedState()
      DragStateDispatcher.handleViewAction {
        type: 'productBecameUnselected'
        product: @props.product
      }
    else
      @activateSelectedState()
      DragStateDispatcher.handleViewAction {
        type: 'productBecameSelected'
        product: @props.product
      }

  handleClick: (e) ->
    if EventHelpers.isAnyServiceKey(e)
      @toggleSelectedState()
    else
      window.location = Routes.edit_operator_product_url @props.product.id
    # window.location = Routes.edit_operator_product_url @props.product.id
    # unless @state.isDragged
    #   ModalController.show Routes.edit_operator_product_url @props.product.id