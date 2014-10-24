#= require react
#= require react-mixin-manager
#= require react_ujs
#= require_tree ./mixins
#= require_tree ./components

# TODO Вынести в отдельный файл
window.AppHelpers =

  # Ставит фокус на input и выделяет содержимое
  reselectAndFocus: (el) ->
    el.focus()
    el.selectionStart = el.selectionEnd = el.value.length
