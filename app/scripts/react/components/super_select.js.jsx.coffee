###* @jsx React.DOM ###

window.SuperSelect = React.createClass
  propTypes:
    name:        React.PropTypes.string.isRequired
    options:     React.PropTypes.array.isRequired
    value:       React.PropTypes.string
    placeholder: React.PropTypes.string

  getInitialState: ->
    value:           @props.value
    inFocus:          false

  getDefaultProps: ->
    placeholder: 'Новая категория'
    typeaheadOptions:
      minLength: 0
      hint:      true
      highlight: true

  componentDidMount: ->
    node = $ @refs.input.getDOMNode()

    node.typeahead @props.typeaheadOptions,
      name:       'categories',
      displayKey: 'name'
      source:     @substringMatcher
      
  render: ->
    closeButton = @closeButton() if @showCloseButton()
    placeholder = @props.placeholder unless @state.inFocus

    `<div className='form-group login__form-group--icon-right' >
        <input ref='input' 
               onFocus = { this.onFocus }
               onBlur  = { this.onBlur }
               name={this.props.name}
               value={this.state.value} 
               className='form-control' 
               onChange={this.change} 
               placeholder={placeholder}
               type='text' />
        { closeButton }
    </div>`


  onFocus: ->
    @setState inFocus: true

  onBlur: ->
    @setState inFocus: false


  substringMatcher: (q, cb) ->
    matches = []

    substrRegex = new RegExp q, 'i'

    $.each @props.options, (i, str) ->
      matches.push name: str if substrRegex.test str

    cb matches

  change: (e)->
    @setState value: $( @refs.input.getDOMNode() ).val()
    return e

  showCloseButton: ->
    @state.value?.length>0 ? true : false

  closeButton: -> `<a className='login__form-input-btn--right' onClick={this.clear}>&times;</a>`

  clear: -> @setState value: ''
