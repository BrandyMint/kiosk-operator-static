###* @jsx React.DOM ###
#
window.ImagesForm = React.createClass
  #mixins: [Dragging, ImagesFormMixin]

  propTypes:
    fieldName:      React.PropTypes.string.isRequired
    images:         React.PropTypes.array

  getInitialState: ->
    images:    @props.images

  getDefaultProps: ->
    savingUrl: '/..' #Routes.api.update_entry_url @props.entry
    images:
      [
        {id: 1, src: 'http://www.porjati.ru/uploads/posts/2011-06/thumbs/1308810576_7b31296a39f5.jpg'},
        {id: 2, src: 'images/product-square.png?1'},
        {id: 3, src: 'http://doseng.org/uploads/posts/2011-10/1319603877_demotivatory_27.jpg'},
        {id: 4, src: 'https://encrypted-tbn2.gstatic.com/images?q=tbn:ANd9GcQR0K-_szbWUnBVD6P1wrBXthB7rdCrrAZRl-L00iRtZG_Z3ajs'}
      ]

  componentDidMount: ->
    #@prepareForm()

  componentWillUnmount: ->
    # Похоже fileupload криво дестроится
    # и потом не привязывается и input не ловит файлы/
      
  render: ->

    if @state.images.length>0
      content = `
       <div className='products__new-form-image-large'>
          <img className='products__list-item-new-image' src={this.state.images[0].src} />
          <span className='products__list-item-new-label text-muted'>
             <span className="form-upload__text">Выберите</span>
             <input id="image" className="form-upload__input" accept="image/*" type="file" multiple={true} ref="input"/>
            <br />
            <span>фотографии</span>
          </span></div>`
    else
      content = `
       <div className='products__new-form-image-large'>
          <img className='products__list-item-new-image' src='images/product-add.svg' />
          <span className='products__list-item-new-label text-muted'>
             <span className="form-upload__text">Выберите</span>
             <input id="image" className="form-upload__input" accept="image/*" type="file" multiple={true} ref="input"/>
            <br />
            <span>фотографии</span>
          </span>
          </div>`

    `<div className='images_form'>
      {content}
       <ImagesForm_Thumbs images={this.state.images} onRemove={this.removeImage}/>
    </div>`

  removeImage: (image) ->
    @setState images: _.reject @state.images, (i)-> i==image
    $.ajax
      url:    Routes.products_image_delete_path image.id
      method: 'delete'
    


