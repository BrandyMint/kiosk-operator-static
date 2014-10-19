###*global window, $, React, ModalComponent ###

window.ModalService =
  show: (url) ->
    modalRoot = $ '<div></div>'
    $('body').append modalRoot
    React.renderComponent ModalComponent({url: url}), modalRoot[0]
    modalRoot.on 'hidden.bs.modal', ->
      React.unmountComponentAtNode modalRoot[0]
      modalRoot.remove()
