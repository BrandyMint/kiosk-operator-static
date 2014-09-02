###* @jsx React.DOM ###

window.SuperSelect = React.createClass
  propTypes:
    name:        React.PropTypes.string.isRequired
    options:     React.PropTypes.array.isRequired
    value:       React.PropTypes.string
    placeholder: React.PropTypes.string

  getInitialState: ->
    value:           @props.value

  getDefaultProps: ->
    placeholder: 'Новая категория'

  componentDidMount: ->
    node = $ @refs.input.getDOMNode()

    node.typeahead {
      minLength: 1
      hint:      true
      highlight: true
    },
      {
        name:       'categories',
        displayKey: 'name'
        source:     @substringMatcher
      }
      
  render: ->
    closeButton = @closeButton() if @showCloseButton()

    `<div className='form-group login__form-group--icon-right' >
        <input ref='input' 
               name={this.props.name}
               value={this.state.value} 
               className='form-control' 
               onChange={this.change} 
               placeholder={this.props.placeholder} 
               type='text' />
        { closeButton }
    </div>`

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
