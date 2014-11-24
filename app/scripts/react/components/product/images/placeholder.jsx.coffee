###* @jsx React.DOM ###

ProductImages_Placeholder = React.createClass

  propTypes:
    fieldName: React.PropTypes.string.isRequired

  render: ->
    `<div className="products__new-form-image-thumb-block">
      <input name={ this.props.fieldName }
             type="file"
             accept="image/*"
             multiple={ true }
             id="image"
             className="form-upload__input products__new-form-image-input" />
       <div className="products__new-form-image-thumb-empty" />
       <div className="products__new-form-image-thumb-add" />
     </div>`

module.exports = ProductImages_Placeholder