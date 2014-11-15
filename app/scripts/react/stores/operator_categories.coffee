BaseStore = require './_base'

_categories = []

window.OperatorCategoriesStore = _.extend new BaseStore(), {

  getCategories: -> _categories

  getRootCategory: ->
    for _category in _categories when _category.parent_id is null
      return _category

  getCategoryLevel: (category) ->
    if category.parent_id
      1 + @getCategoryLevel( @getCategoryById(category.parent_id) )
    else
      0

  getCategoryById: (categoryId) ->
    for _category in _categories when _category.id == categoryId
      return _category

  getSortedCategoriesByParent: (parentCategory) ->
    parentId = if parentCategory then parentCategory.id else null

    _.filter(_categories, (i) -> i.parent_id == parentId)
      .sort((a, b) -> a.position - b.position)

  pushCategories: (categories) ->
    clonedCategories = _categories[..]

    for category in categories when !@isCategoryExists category
      clonedCategories.push category

    _categories = clonedCategories

  isCategoryExists: (category) ->
    return false unless category

    for _category in _categories when _category.id == category.id
      return true

    false

}

OperatorCategoriesStore.dispatchToken = OperatorCategoriesDispatcher.register (payload) ->
  action = payload.action

  switch action.type
    when 'categoriesLoaded'
      OperatorCategoriesStore.pushCategories action.categories
      OperatorCategoriesStore.emitChange()