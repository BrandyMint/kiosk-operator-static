###*global _, EventEmitter, OperatorCategoriesDispatcher, OperatorCategoriesStore ###

CHANGE_EVENT = 'change'

_selectedCategory = null

_getAllCategoryLevels = ->
  levels = []

  pushLevel = (cat) ->
    if typeof cat is 'undefined' then cat = null
    levels.push cat
    pushLevel(OperatorCategoriesStore.getCategoryById cat.parent_id) if cat

  pushLevel _selectedCategory
  levels.reverse()

window.OperatorCategoriesSelectedStore = _.extend {}, EventEmitter.prototype, {
  emitChange: ->
    @emit CHANGE_EVENT

  addChangeListener: (callback) ->
    @on CHANGE_EVENT, callback

  removeChangeListener: (callback) ->
    @off CHANGE_EVENT, callback

  getSelectedCategory: ->
    _selectedCategory

  getSelectedCategoryForLevel: (level) ->
    _getAllCategoryLevels()[level]
}

OperatorCategoriesSelectedStore.dispatchToken = OperatorCategoriesDispatcher.register (payload) ->
  action = payload.action

  switch action.type
    when 'categorySelected'
      _selectedCategory = action.category
      OperatorCategoriesSelectedStore.emitChange()

    when 'deleteCategory'
      delId = action.category.id
      if (_selectedCategory and (_selectedCategory.id == delId or _selectedCategory.parent_id == delId))
        if action.category.parent_id
          _selectedCategory = OperatorCategoriesStore.getCategoryById action.category.parent_id
        else
          _selectedCategory = null
      OperatorCategoriesSelectedStore.emitChange()
