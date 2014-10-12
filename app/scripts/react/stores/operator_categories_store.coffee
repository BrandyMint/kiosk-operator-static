###*global _, EventEmitter, OperatorCategoriesService, OperatorCategoriesDispatcher ###

CHANGE_EVENT = 'change'

_categories = []

service = OperatorCategoriesService

_pushCategories = (categories) ->
  _categories = categories

_deleteCategory = (category) ->
  _categories = _.reject _categories, (i) -> i.id == category.id
  service.deleteCategory category.id, (err, response) ->
    if err then console.error err # todo

_updateCategory = (category) ->
  _categories = _.map _categories, (i) -> if i.id == category.id then category else i
  service.updateCategory category, (err, response) ->
    if err then console.error err # todo

_addCategory = (category) ->
  _categories.push category

_positionCategory = (category) ->
  curList = _.filter _categories, (i) -> i.parent_id == category.parent_id
  if curList.length
    lastCat = _.max curList, (i) -> i.position
    lastPosition = lastCat.position
  else
    lastPosition = -1

  return _.extend category, {
    "position":       lastPosition + 1
  }

_getSortedCategoriesByParent = (parentCat) ->
  parent_id = if parentCat then parentCat.id else null
  _.filter _categories, (i) -> i.parent_id == parent_id
    .sort((a, b) -> a.position - b.position)

_applyPositions = (changes) ->
  reorderedCategories = _categories.slice(0) # Clone
  for category in reorderedCategories
    for change in changes
      if category.id == change.id
        category.position = change.position
  _categories = reorderedCategories

_getNewPositions = (cat, insertIdx) ->
  # Хитрые разборки с целью несколько минимизировать объём обновлений
  # Оптимальный алгоритм уж делать не стал - только минимальная оптимизация
  # в частных случаях
  oldPositions = _getSortedCategoriesByParent _getCategoryById cat.parent_id
  originalIdx = _.findIndex oldPositions, (i) -> i.id == cat.id

  # Нужно ли менять позицию вообще
  if insertIdx == originalIdx then return []

  oldPositions = _.reject oldPositions, (i) -> i.id == cat.id
  leftCat = oldPositions[insertIdx - 1] unless insertIdx < 1
  rightCat = oldPositions[insertIdx] unless insertIdx > oldPositions.length - 1

  # Если вставка в конец, это просто
  if !rightCat
    return [{
      id: cat.id
      position: leftCat.position + 1
    }]

  # Если вставка в начало, имитируем левый элемент
  # для упрощения последующих алгоритмов
  if !leftCat
    leftCat =
      position: -1
      id:       null

  # Если есть "место" в номерах позиций - просто используем его
  posDiff = rightCat.position - leftCat.position
  if posDiff > 1
    return [{
      id:       cat.id
      position: leftCat.position + 1
    }]

  # Если оптимизации не сработали, просто сдвигаем хвост вниз
  slicePosition = leftCat.position + 1
  newPositions = [{
    id:       cat.id,
    position: slicePosition
    name:     cat.name
  }]
  oldTail = oldPositions[insertIdx..]

  for catToShift in oldTail
    minPosition = slicePosition + 1
    currentPosition = catToShift.position
    # Проверяем: возможно, не надо двигать все элементы
    if currentPosition < minPosition
      currentPosition = minPosition
      newPositions.push {
        id:       catToShift.id
        position: currentPosition
        name:     catToShift.name
      }
      slicePosition = currentPosition + 1

  return newPositions

_getCategoryById = (id) ->
  _.find _categories, (i) -> i.id == id

_reorderCategories = (categoryId, insertIdx) ->
  category = _getCategoryById categoryId
  positionChanges = _getNewPositions category, insertIdx
  if positionChanges.length
    _applyPositions positionChanges
  service.updateCategories positionChanges, (err, response) ->
    if err
      console.error err # todo

window.OperatorCategoriesStore = _.extend {}, EventEmitter.prototype, {
  emitChange: ->
    @emit CHANGE_EVENT

  addChangeListener: (callback) ->
    @on CHANGE_EVENT, callback

  removeChangeListener: (callback) ->
    @off CHANGE_EVENT, callback

  getAllCategories: ->
    _categories

  getCategoryById: (id) ->
    _getCategoryById id

  getSortedCategoriesByParent: (parentCat) ->
    _getSortedCategoriesByParent parentCat

  positionCategory: (category) ->
    _positionCategory category
}

OperatorCategoriesStore.dispatchToken = OperatorCategoriesDispatcher.register (payload) ->
  action = payload.action

  switch action.type
    when 'receiveAll'
      _pushCategories action.categories
      OperatorCategoriesStore.emitChange()

    when 'deleteCategory'
      _deleteCategory action.category
      OperatorCategoriesStore.emitChange()

    when 'updateCategory'
      _updateCategory action.category
      OperatorCategoriesStore.emitChange()

    when 'addCategory'
      _addCategory action.category
      OperatorCategoriesStore.emitChange()

    when 'reorderCategories'
      _reorderCategories action.srcId, action.insertIdx
      OperatorCategoriesStore.emitChange()

    when 'categoryCreated'
      _categories = _.map _categories, (i) ->
        if i.id == action.tmpId then action.category else i
      OperatorCategoriesStore.emitChange()
