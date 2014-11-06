###* @jsx React.DOM ###
#
window.Spinner = React.createClass
  propTypes:
    # null or center
    align:     React.PropTypes.string
    className: React.PropTypes.string

  render: ->
    className = "fa fa-spinner fa-spin"
    className << @props.className if @props.className
    spinner = `<i className={className} />`

    if @props.align=='center'
      `<div className="text-center">{spinner}</div>`
    else
      spinner

window.SpinnerLegacy = React.createClass

  # Известные размеры:
  # - 8x8
  # - 15x15
  # - 24x24
  # - 31x31
  # - 70x70

  propTypes:
    size: React.PropTypes.number

  getDefaultProps: ->
    size: 8

  render: ->
   `<span className={ 'spinner spinner--' + this._getSize() }>
      <span className="spinner__icon" />
    </span>`

  _getSize: -> @props.size + 'x' + @props.size
