###*global window, $, React, ModalComponent ###

window.ModalService =
  show: (url) ->
    modalRoot = $ '<div></div>'
    $('body').append modalRoot
    React.renderComponent ModalComponent({url: url}), modalRoot[0]
