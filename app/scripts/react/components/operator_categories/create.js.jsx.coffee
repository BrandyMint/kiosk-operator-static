###* @jsx React.DOM ###

###*global React, OperatorCategoriesActions ###

window.OperatorCategories_Create = React.createClass
  propTypes:
    parentCategory: React.PropTypes.object

  getInitialState: ->
    creating: false

  render: ->
    text = if @props.parentCategory
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
         parentCategory=   { this.props.parentCategory }
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
