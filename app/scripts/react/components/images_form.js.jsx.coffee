###* @jsx React.DOM ###
#
window.ImagesForm = React.createClass
  mixins: [ImagesFormMixin]

  propTypes:
    imagesDeletePath: React.PropTypes.string.isRequired
    fieldName:        React.PropTypes.string.isRequired
    images:           React.PropTypes.array

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
    `<div className='images_form'>
       <div className='products__new-form-image-large'>
         {this.image()}
          <input id="image" name={this.props.fieldName} 
                 className="form-upload__input products__new-form-image-input" 
                 accept="image/*" type="file" multiple={true} ref="input"/>
          <div className='products__list-item-new-label text-muted'>
            <span className="form-upload__text">Выберите</span>
            <br />
            <span>фотографии</span>
          </div>
          </div>
       <ImagesForm_Thumbs images={this.state.images} onRemove={this.removeImage}/>
    </div>`

  image: ->
    if @state.images.length>0
      `<img className='products__list-item-new-image' src={this.state.images[0].src} />`
    else
      `<img className='products__list-item-new-image' src='/assets/product-add.svg' />`

  removeImage: (image) ->
    @setState images: _.reject @state.images, (i)-> i==image
    $.ajax
      url:    @props.imageDeletePath + '?id=' + image.id
      method: 'delete'
