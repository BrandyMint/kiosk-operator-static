###* @jsx React.DOM ###

###*global React ###

cx = React.addons.classSet

window.OperatorCategories_Item = React.createClass
  propTypes:
    category:         React.PropTypes.object.isRequired
    isActive:         React.PropTypes.bool.isRequired
    onSelectCategory: React.PropTypes.func.isRequired

  getInitialState: ->
    status:   'view'

  render: ->
    classes = cx {
      'adm-categories-item': true
      'selected':            @props.isActive
      '__edit':              @state.status == 'edit'
    }

    return `<div className=    { classes }
                 onClick=      { this.handleItemClick }
                 data-objectid={ this.props.category.id }>
              { this._getItemNode() }
            </div>`

  _getItemNode: ->
    return switch @state.status
      when 'view'
        `<OperatorCategories_ItemView
           category=           { this.props.category }
           onDeleteStart=      { this.handleDeleteStart }
           onEditStart=        { this.handleEditStart }
         />`
      when 'edit'
        `<OperatorCategories_ItemEdit
           category=           { this.props.category }
           onFinish=           { this._backToView }
           onDeleteStart =     { this.handleDeleteStart }
         />`
      when 'delete'
        `<OperatorCategories_ItemDelete
           category=           { this.props.category }
           onFinish=           { this._backToView }
         />`

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
