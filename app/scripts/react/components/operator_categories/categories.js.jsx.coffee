###* @jsx React.DOM ###

###*global React, OperatorCategoriesSelectedStore,
  OperatorCategoriesServerActions, OperatorCategoriesStore###

STATE_LOADING = 'loading'
STATE_READY   = 'ready'

window.OperatorCategories = React.createClass
  propTypes:
    categories:     React.PropTypes.array

  getInitialState: ->
    rightParentCat: null
    currentState:   if @props.categories then STATE_READY else STATE_LOADING

  getDefaultProps: ->
    categories:     null

  componentDidMount: ->
    # Если категории пришли в props, имитируем загрузку с сервера
    if (@props.categories)
      OperatorCategoriesServerActions.categoriesLoaded @props.categories
    else
      OperatorCategoriesService.getCategories()

    OperatorCategoriesStore.addChangeListener @_onChange
    OperatorCategoriesSelectedStore.addChangeListener @_onChange

  componentWillUnmount: ->
    OperatorCategoriesStore.removeChangeListener @_onChange
    OperatorCategoriesSelectedStore.removeChangeListener @_onChange

  render: ->
    switch @state.currentState
      when STATE_READY
        @_getCategoriesForm()
      when STATE_LOADING
        `<div>Загрузка категорий...</div>`

  _getCategoriesForm: ->
    subcategoriesPane = @_getSubcategoriesPane()

    return `<div>
              <div className= "col-md-6 user-select-none">
                <OperatorCategories_List parentCategory={ null } />
              </div>
              <div className="col-md-6 user-select-none">
                { subcategoriesPane }
                <br />
                <OperatorCategories_GoodsLink />
              </div>
            </div>`

  _getSubcategoriesPane: ->
    if @state.rightParentCat
      `<OperatorCategories_List parentCategory={ this.state.rightParentCat } />`

  _onChange: ->
    selectedCat = OperatorCategoriesSelectedStore.getSelectedCategory()
    if selectedCat and selectedCat.parent_id
      rightParentCat = OperatorCategoriesStore.getCategoryById selectedCat.parent_id
    else
      rightParentCat = selectedCat

    @setState
      currentState:   STATE_READY
      rightParentCat: rightParentCat
