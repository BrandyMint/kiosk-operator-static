###* @jsx React.DOM ###

ProductImages_Image = React.createClass

  propTypes:
    image:         React.PropTypes.object.isRequired
    onRemoveImage: React.PropTypes.func.isRequired

  render: ->
    `<div className="products__new-form-image-thumb-block">
       <img src={ this.props.image.src }
            className="products__new-form-image-thumb" />
       <div className="products__new-form-image-thumb-remove"
            onClick={ this.handleRemoveClick } />
       <div className="products__new-form-image-thumb-update"
            onClick={ this.handleRotateClick } />
     </div>`

  handleRotateClick: ->
    # TODO image rotate
    alert 'Функция временно не доступна'

  handleRemoveClick: ->
    @props.onRemoveImage @props.image

module.exports = ProductImages_Image