###* @jsx React.DOM ###

VIEW_STATE = 'view'
EDIT_STATE = 'edit'

window.OperatorCategories_ListItemManager = React.createClass
  mixins: [CategoryDroppable]

  propTypes:
    category:         React.PropTypes.object.isRequired
    isActive:         React.PropTypes.bool.isRequired
    onCategorySelect: React.PropTypes.func.isRequired

  getInitialState: ->
    currentState: VIEW_STATE

  render: ->
    item = @getItem()
    managerClasses = React.addons.classSet {
      'adm-categories-item': true
      'selected': @props.isActive
      '__edit': @isEditState()
    }

    return `<div className={ managerClasses }
                 data-objectid={ this.props.category.id }
                 onClick={ this.handleItemClick }>
              { item }
            </div>`

  isEditState: -> @state.currentState is EDIT_STATE

  activateViewState: -> @setState(currentState: VIEW_STATE)
  activateEditState: -> @setState(currentState: EDIT_STATE)

  getItem: ->
    switch @state.currentState
      when VIEW_STATE
        item = `<OperatorCategories_ListItem
                    category={ this.props.category }
                    onEditStart={ this.handleEditStart } />`
      when EDIT_STATE
        item = `<OperatorCategories_ListItemEdit
                    category={ this.props.category }
                    onEditFinish={ this.activateViewState } />`

    item

  handleEditStart: (e) ->
    e.stopPropagation()
    e.preventDefault()
    @activateEditState()

  handleItemClick: ->
    @props.onCategorySelect {
      category: @props.category
      includeSubcategories: true
    }