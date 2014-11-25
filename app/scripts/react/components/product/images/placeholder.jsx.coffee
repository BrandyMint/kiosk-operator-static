###* @jsx React.DOM ###

FileUploadMixin = require './mixins/file_upload'

module.exports = ProductImages_Placeholder = React.createClass
  mixins: [FileUploadMixin]

  render: ->
    `<div className="products__new-form-image-thumb-block">
      <input ref="fileInput"
             type="file"
             accept="image/*"
             multiple={ true }
             id="image"
             className="form-upload__input products__new-form-image-input" />
       <div className="products__new-form-image-thumb-empty" />
       <div className="products__new-form-image-thumb-add" />
     </div>`