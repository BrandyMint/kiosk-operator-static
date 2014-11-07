###* @jsx React.DOM ###
#
window.ProductImages = React.createClass
  mixins: [ImagesFormMixin]

  propTypes:
    productId:  React.PropTypes.number.isRequired
    fieldName:  React.PropTypes.string.isRequired
    images:     React.PropTypes.array.isRequired

  getInitialState: ->
    images:    @props.images

  getDefaultProps: ->
    savingUrl: '/..' #Routes.api.update_entry_url @props.entry
    images:
      [
        {id: 1, src: 'assets/product-1-square.png?1'},
        {id: 2, src: 'assets/product-2-square.png?1'},
        {id: 3, src: 'assets/product-3-square.png?1'}
      ]

  render: ->
    `<div className="__small products__new-form-images-list">
        <ProductImages_Placeholder fieldName={this.props.fieldName}/>
        <ProductImages_List images={this.state.images} callbackRemove={this.removeImage} productId={this.props.productId} />
       </div>`

window.ProductImages_Placeholder = React.createClass
  propTypes:
    fieldName:        React.PropTypes.string.isRequired
  render: ->
    `<div className="products__new-form-image-thumb-block">
      <input id="image" name={this.props.fieldName} 
             className="form-upload__input products__new-form-image-input" 
             accept="image/*" type="file" multiple={true} />
       <div className="products__new-form-image-thumb-empty"></div>
       <div className="products__new-form-image-thumb-add"></div>
     </div>`

window.ProductImages_List = React.createClass
  propTypes:
    productId:      React.PropTypes.number.isRequired
    images:         React.PropTypes.array.isRequired
    callbackRemove: React.PropTypes.func.isRequired

  render: ->
    callbackRemove = @props.callbackRemove
    images = @props.images.map (image) -> `<ProductImages_Image image={image} callbackRemove={callbackRemove} key={image.id || image.src} />`

    `<div className="products__new-form-images-list-list">{images}</div>`

window.ProductImages_Image = React.createClass
  propTypes:
    image:          React.PropTypes.object.isRequired
    callbackRemove: React.PropTypes.func.isRequired

  render: ->
    `<div className="products__new-form-image-thumb-block">
       <img className="products__new-form-image-thumb" src={this.props.image.src} />
       <div className="products__new-form-image-thumb-remove" onClick={this.handleRemove}></div>
       <div className="products__new-form-image-thumb-update" onClick={this.handleRotate}></div>
     </div>`

  handleRotate: ->
    # TODO image rotate
    alert "Функция временно не доступна"

  handleRemove: ->
    @props.callbackRemove @props.image
