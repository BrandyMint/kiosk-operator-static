###* @jsx React.DOM ###

FileUploadMixin = require './mixins/file_upload'

VIEW_STATE     = 'view'
DROPZONE_STATE = 'dropZone'

ProductImages_Placeholder = React.createClass
  mixins: [FileUploadMixin]

  getInitialState: ->
    currentState: VIEW_STATE

  render: ->
    emptyThumbClasses = React.addons.classSet {
      'products__new-form-image-thumb-empty': true
      '__dropzone': @isDropzoneState()
    }

    return `<div className="products__new-form-image-thumb-block">
              <input ref="fileInput"
                     type="file"
                     accept="image/*"
                     multiple={ true }
                     id="image"
                     className="form-upload__input products__new-form-image-input" />
               <div className={ emptyThumbClasses } />
               <div className="products__new-form-image-thumb-add" />
             </div>`

  isDropzoneState: -> @state.currentState is DROPZONE_STATE

  activateDropzoneState: -> @setState(currentState: DROPZONE_STATE)
  activateViewState:     -> @setState(currentState: VIEW_STATE)

module.exports = ProductImages_Placeholder