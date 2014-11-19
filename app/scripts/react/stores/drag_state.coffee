BaseStore = require './_base'

_draggedProducts = []

window.DragStateStore = _.extend new BaseStore(), {

  isDragged: -> _draggedProducts.length > 0

  isDraggedProductExists: (product) ->
    for _draggedProduct in _draggedProducts when _draggedProduct.id == product.id
      return true

    false

  pushDraggedProduct: (product) ->
    console.log 'добавляем', product
    unless @isDraggedProductExists product
      _draggedProducts.push product

  deleteDraggedProduct: (product) ->
    console.log 'удаляем', product
    clonedDraggedProducts = _draggedProducts[..]

    for clonedDraggedProduct, i in clonedDraggedProducts when clonedDraggedProduct.id == product.id
      clonedDraggedProducts.splice i, 1
      break

    _draggedProducts = clonedDraggedProducts

  getDraggedProducts: -> _draggedProducts

}

DragStateDispatcher.register (payload) ->
  action = payload.action

  switch action.type
    when 'productBecameDraggable'
      DragStateStore.pushDraggedProduct action.product
      DragStateStore.emitChange()
      break
    when 'productBecameStatic'
      DragStateStore.deleteDraggedProduct action.product
      DragStateStore.emitChange()
      break