#= require react
#= require react-mixin-manager
#= require react_ujs
#= require_tree ./mixins
#= require_tree ./components

window.ReactApp =
  start: ->
    console.log 'ReactApp start'

    # ReactUjs доступен только в брендиминтовском репозитории react-rails
    #$(document).on 'page:change', ReactUjs.mountReactComponents

$ -> ReactApp.start()


# TODO Вынести в отдельный файл
window.AppHelpers =

  # Ставит фокус на input и выделяет содержимое
  reselectAndFocus: (el) ->
    el.focus()
    el.selectionStart = el.selectionEnd = el.value.length
