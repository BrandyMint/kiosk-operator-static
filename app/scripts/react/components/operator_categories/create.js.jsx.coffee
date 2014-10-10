###* @jsx React.DOM ###

###*global React, OperatorCategoriesActions ###

window.OperatorCategories_Create = React.createClass
  propTypes:
    parentCategoryId: React.PropTypes.number

  getInitialState: ->
    creating: false

  render: ->
    text = if @props.parentCategoryId
      caption: "Добавить подкатегории"
      placeholder: "Наименование подкатегории"
    else
      caption: "Добавить новые категории"
      placeholder: "Наименование категории"

    displayTemplate =
      `<OperatorCategories_CreateButton
         caption=        { text.caption }
         onCreateStart = { this.handleCreateStart }
       />`

    createTemplate =
      `<OperatorCategories_CreateForm
         parentCategoryId= { this.props.parentCategoryId }
         caption=          { text.caption }
         placeholder=      { text.placeholder }
         onCreateEnd=      { this._backToButton }
       />`

    return if @state.creating
      createTemplate
    else
      displayTemplate

  _backToButton: ->
    @setState(creating: false)

  handleCreateStart: (e) ->
    e.preventDefault()
    @setState(creating: true)
