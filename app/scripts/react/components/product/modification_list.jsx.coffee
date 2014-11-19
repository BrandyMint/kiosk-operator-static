###* @jsx React.DOM ###

window.ProductModificationList = React.createClass

  propTypes:
    modifications: React.PropTypes.array.isRequired

  render: ->
    modificationList = @props.modifications.map (modification) ->
     `<ProductModificationListItem modification={ modification }
                                   key={ modification.id } />`

    return `<ul className="adm-categories-goods-modifications">
              { modificationList }
            </ul>`