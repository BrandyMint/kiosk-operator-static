window.AppHelpers =

  # Ставит фокус на input и выделяет содержимое
  reselectAndFocus: (el) ->
    el.focus()
    el.selectionStart = el.selectionEnd = el.value.length
