###* @jsx React.DOM ###

#TODO: ListItemManager

window.OperatorCategories_ListItem = React.createClass
  mixins: [CategoryProductDroptarget]

  propTypes:
    category:         React.PropTypes.object.isRequired
    isActive:         React.PropTypes.bool.isRequired
    onSelectCategory: React.PropTypes.func.isRequired

  getInitialState: ->
    status: 'view'

  render: ->
    classes = React.addons.classSet {
      'adm-categories-item': true
      'selected': @props.isActive
      '__edit': @state.status is 'edit'
    }

    return `<div className={ classes }
                 data-objectid={ this.props.category.id }
                 onClick={ this.handleItemClick }>
              { this._getItemNode() }
            </div>`

  _getItemNode: ->
    switch @state.status
      when 'view'
        `<OperatorCategories_ListItemView
             category={ this.props.category }
             onDeleteStart={ this.handleDeleteStart }
             onEditStart={ this.handleEditStart } />`
      when 'edit'
        `<OperatorCategories_ListItemEdit
             category={ this.props.category }
             onFinish={ this._backToView }
             onDeleteStart={ this.handleDeleteStart } />`
      when 'delete'
        `<OperatorCategories_ListItemDelete
             category={ this.props.category }
             onFinish={ this._backToView } />`

  _backToView: ->
    @setState(status: 'view')

  handleEditStart: (e) ->
    e.stopPropagation()
    e.preventDefault()
    @setState(status: 'edit')

  handleDeleteStart: (e) ->
    e.preventDefault()
    @setState(status: 'delete')

  handleItemClick: (e) ->
    e.preventDefault()
    @props.onSelectCategory @props.category