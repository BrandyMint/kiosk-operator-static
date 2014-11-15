###* @jsx React.DOM ###

VIEW_STATE   = 'view'
EDIT_STATE   = 'edit'
DELETE_STATE = 'delete'

window.OperatorCategories_ListItemManager = React.createClass
  # mixins: [CategoryProductDroptarget]

  propTypes:
    category:         React.PropTypes.object.isRequired
    isActive:         React.PropTypes.bool.isRequired
    onCategorySelect: React.PropTypes.func.isRequired

  getInitialState: ->
    currentState: VIEW_STATE

  render: ->
    item = @getItem()
    classes = React.addons.classSet {
      'adm-categories-item': true
      'selected': @props.isActive
      '__edit': @isEditState()
    }

    return `<div className={ classes }
                 data-objectid={ this.props.category.id }
                 onClick={ this.handleItemClick }>
              { item }
            </div>`

  isEditState: -> @state.currentState is EDIT_STATE

  activateViewState:   -> @setState(currentState: VIEW_STATE)
  activateEditState:   -> @setState(currentState: EDIT_STATE)
  activateDeleteState: -> @setState(currentState: DELETE_STATE)

  getItem: ->
    switch @state.currentState
      when VIEW_STATE
        item = `<OperatorCategories_ListItem
                    category={ this.props.category }
                    onDeleteStart={ this.handleDeleteStart }
                    onEditStart={ this.handleEditStart } />`
      when EDIT_STATE
        item = `<OperatorCategories_ListItemEdit
                    category={ this.props.category }
                    onFinish={ this._backToView }
                    onDeleteStart={ this.handleDeleteStart } />`
      when DELETE_STATE
        item = `<OperatorCategories_ListItemDelete
                    category={ this.props.category }
                    onFinish={ this._backToView } />`
    item

  _backToView: ->
    @activateViewState()

  handleEditStart: (e) ->
    e.stopPropagation()
    e.preventDefault()
    @activateEditState()

  handleDeleteStart: (e) ->
    e.preventDefault()
    @activateDeleteState()

  handleItemClick: (e) ->
    e.preventDefault()
    @props.onCategorySelect @props.category