###* @jsx React.DOM ###

###*global React ###

window.OperatorCategories_Item = React.createClass
  propTypes:
    category:         React.PropTypes.object

  getInitialState: ->
    status:   'view'

  render: ->
    return `<div className=    "hoverable-container operator-categories__item"
                 data-objectid={ this.props.category.id }>
              <i className=    "fa fa-bars operator-categories-drag-handle" />
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
           onEditEnd=          { this._backToView }
           onDeleteStart =     { this.handleDeleteStart }
         />`
      when 'delete'
        `<OperatorCategories_ItemDelete
           category=           { this.props.category }
           onDeleteEnd=        { this._backToView }
         />`

  _backToView: ->
    @setState(status: 'view')

  handleEditStart: (e) ->
    e.preventDefault()
    @setState(status: 'edit')

  handleDeleteStart: (e) ->
    e.preventDefault()
    @setState(status: 'delete')
