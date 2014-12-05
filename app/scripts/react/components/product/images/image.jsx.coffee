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
    onImagePreload: React.PropTypes.func.isRequired
    onImageDelete:  React.PropTypes.func.isRequired

  getDefaultProps: ->
    size: '120x120'

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
       `<div className="products__new-form-image-thumb-error">
          Ошибка загрузки
        </div>`

    return `<div data-id={ this.props.image.id }
                 className="products__new-form-image-thumb-block">
              <img src={ this._getImageUrl() }
                   className="products__new-form-image-thumb" />

              { message }

              <div className="products__new-form-image-thumb-remove"
                   onClick={ this.props.onImageDelete } />
              <div className="products__new-form-image-thumb-update"
                   onClick={ this.handleRotateClick } />

              <input name={ this.props.fieldName }
                     value={ this.props.image.id }
                     type="hidden" />
            </div>`

  isLoadingState: -> @state.currentState is LOADING_STATE

  activateLoadedState: -> @setState(currentState: LOADED_STATE)
  activateErrorState:  -> @setState(currentState: ERROR_STATE)

  preloadImage: ->
    file = @props.image.file

    return console.warn 'Missing file object for preloading product image' unless file

    formData = new FormData()
    formData.append 'image', file

    ProductImagesViewActions.preloadImage {
      file: file
      success: (data) =>
        @activateLoadedState()
        @props.onImagePreload {
          id:   data.id
          uuid: @props.image.uuid
          src:  data.url
        }
      error:      => @activateErrorState()
      beforeSend: => @incrementActivities()
      complete:   => @decrementActivities()
    }

  _getImageUrl: ->
    ThumborService.image_url @state.image?.src, @props.size

  handleRotateClick: ->
    # TODO image rotate
    alert 'Функция временно не доступна'

module.exports = ProductImages_Image