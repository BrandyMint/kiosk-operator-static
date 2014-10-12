###* @jsx React.DOM ###

###*global React, OperatorCategoriesActions ###

STATE_BUTTON = 'button'
STATE_INPUT  = 'input'

window.OperatorCategories_Create = React.createClass
  propTypes:
    parentCategory: React.PropTypes.object

  getInitialState: ->
    currentState: STATE_BUTTON

  render: ->
    switch @state.currentState
      when STATE_BUTTON
        `<OperatorCategories_CreateButton onClick = { this.handleStart } />`
      when STATE_INPUT
        `<OperatorCategories_CreateForm  onFinish = { this.handleFinish } 
          parentCategoryId={ this.props.parentCategoryId } />`
      else
        console.error? "Unknown state: #{@state.currentState}"

  handleStart:  -> @setState(currentState: STATE_INPUT)
  handleFinish: -> @setState(currentState: STATE_BUTTON)
