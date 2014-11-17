###* @jsx React.DOM ###

#TODO: i18n
TITLES =
  published:   'Опубликован'
  has_errors:  'Есть ошибки'
  unpublished: 'Снят с публикации'
  archive:     'Архив'

window.ProductState = React.createClass

  propTypes:
    state: React.PropTypes.string.isRequired

  render: ->
    source = label: true
    source["__#{@props.state}"] = true

    classes = React.addons.classSet source

    title = TITLES[@props.state]

    `<span className={classes}>{title}</span>`