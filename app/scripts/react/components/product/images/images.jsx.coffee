###* @jsx React.DOM ###

ProductImages_Placeholder = require './placeholder'
ProductImages_List        = require './list'

window.ProductImages = React.createClass
  mixins: [ImagesFormMixin]

  propTypes:
    images:    React.PropTypes.array.isRequired
    fieldName: React.PropTypes.string.isRequired

  getInitialState: ->
    images: @props.images

  getDefaultProps: ->
    savingUrl: '/..' #Routes.api.update_entry_url @props.entry
    images: [
      {id: null, src: 'assets/product-1-square.png?1'}
      {id: null, src: 'assets/product-2-square.png?1'}
      {id: null, src: 'assets/product-3-square.png?1'}
    ]

  render: ->
   `<div className="products__new-form-images-list __small">
      <ProductImages_Placeholder fieldName={ this.props.fieldName } />
      <ProductImages_List
          images={ this.state.images }
          onRemoveImage={ this.removeImage } />
    </div>`