###* @jsx React.DOM ###

LOADING_STATE = 'loading'
LOADED_STATE  = 'loaded'

ProductImages_Image = React.createClass
  mixins: ['ReactActivitiesUser', ComponentManipulationsMixin]

  propTypes:
    image:          React.PropTypes.object.isRequired
    fieldName:      React.PropTypes.string
    onImagePreload: React.PropTypes.func.isRequired
    onImageDelete:  React.PropTypes.func.isRequired

  componentDidMount: ->
    @preloadImage() if @isLoadingState()

  getInitialState: ->
    currentState: if @props.image.id? then LOADED_STATE else LOADING_STATE
    image: @props.image

  render: ->
    if @isLoadingState()
      spinner = `<div className="products__new-form-image-thumb-preload">
                   <Spinner className="fa-2x" />
                 </div>`

    return `<div data-id={ this.props.image.id }
                 className="products__new-form-image-thumb-block">
              <img src={ this.state.image.src }
                   className="products__new-form-image-thumb" />

              { spinner }

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

  preloadImage: ->
    file = @props.image.file

    return console.warn 'Missing file object for preloading product image' unless file

    formData = new FormData()
    formData.append 'image', file

    ProductImagesViewActions.preloadImage {
      file: file
      beforeSend: => @incrementActivities()
      success: (data) =>
        @activateLoadedState()
        @props.onImagePreload {
          id:   data.id
          uuid: @props.image.uuid
          src:  data.url
        }
      error: (data) =>
        console.warn data
      complete: => @decrementActivities()
    }

  handleRotateClick: ->
    # TODO image rotate
    alert 'Функция временно не доступна'

module.exports = ProductImages_Image