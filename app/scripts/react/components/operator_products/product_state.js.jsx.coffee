###* @jsx React.DOM ###

###*global window, React ###

window.ProductState = React.createClass
  propTypes:
    state: React.PropTypes.string.isRequired

  render: ->
    switch @props.state
      when 'published'
        `<span className="label label-success">
          Опубликован
        </span>`
      when 'has_errors'
        `<span className="label label-danger">
          Есть ошибки
        </span>`
      when 'unpublished'
        `<span className="label label-warning">
          Снят с публикации
        </span>`
      when 'archive'
        `<span className="label label-info">
          В архиве
        </span>`
