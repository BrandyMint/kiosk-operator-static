###* @jsx React.DOM ###

LOADING_STATE = 'loading'
LOADED_STATE  = 'loaded'
ERROR_STATE   = 'error'

ProductImages_Image = React.createClass
  mixins: ['ReactActivitiesUser', ComponentManipulationsMixin]

  propTypes:
    image:          React.PropTypes.object.isRequired
    size:           React.PropTypes.string
    fieldName:      React.PropTypes.string
    productId:      React.PropTypes.number
    productCardId:  React.PropTypes.number
    onImagePreload: React.PropTypes.func.isRequired
    onImageDelete:  React.PropTypes.func.isRequired
    onImageRotate:  React.PropTypes.func.isRequired

  getDefaultProps: ->
    size: '150x150'

  componentDidMount: ->
    @preloadImage() if @isLoadingState()

  getInitialState: ->
    currentState: if @props.image.id? then LOADED_STATE else LOADING_STATE
    image: @props.image

  render: ->
    message = switch @state.currentState
      when LOADING_STATE
       `<div className="products__new-form-image-thumb-preload">
          <Spinner className="fa-2x" />
        </div>`
      when ERROR_STATE
       `<div className="form-alert form-alert-danger">
          Ошибка загрузки. Перезагрузите данное изображение.
        </div>`

    return `<div data-id={ this.props.image.id }
                 className="products__new-form-image-thumb-block">
              <img src={ this._getImageUrl() }
                   className="products__new-form-image-thumb" />

              { message }

              <div className="products__new-form-image-thumb-remove"
                   onClick={ this.props.onImageDelete } />
              <div className="products__new-form-image-thumb-update"
                   onClick={ this.rotateImage } />

              { this.renderHiddenInput() }
            </div>`

  renderHiddenInput: ->
    if @props.image.id
      `<input type="hidden"
              name={ this.props.fieldName }
              value={ this.props.image.id } />`

  isLoadingState: -> @state.currentState is LOADING_STATE

  activateLoadingState: -> @setState(currentState: LOADING_STATE)
  activateLoadedState:  -> @setState(currentState: LOADED_STATE)
  activateErrorState:   -> @setState(currentState: ERROR_STATE)

  preloadImage: ->
    file = @props.image.file

    return console.warn 'Missing file object for preloading product image' unless file

    formData = new FormData()
    formData.append 'image', file

    ProductImagesViewActions.preloadImage
      file: file
      productId:     @props.productId
      productCardId: @props.productCardId
      success: (data) =>
        @activateLoadedState()
        @props.onImagePreload
          id:   data.id
          uuid: @props.image.uuid
          src:  data.url
      error:      @activateErrorState
      beforeSend: @incrementActivities
      complete:   @decrementActivities

  _getImageUrl: ->
    ThumborService.image_url @state.image?.url, @props.size

  rotateImage: ->
    @activateLoadingState()

    ProductImagesViewActions.rotateImage @props.image.id
      .then (data) =>
        @activateLoadedState()
        @props.onImageRotate data
      .fail =>
        @activateErrorState()
        setTimeout @activateLoadedState, 3000

module.exports = ProductImages_Image
