###* @jsx React.DOM ###

###*global React, OperatorCategoriesServerActions, OperatorCategoriesStore###

STATE_LOADING = 'loading'
STATE_READY   = 'ready'

window.OperatorCategories = React.createClass
  propTypes:
    categories:     React.PropTypes.array

  getInitialState: ->
    selectedCategory: null
    currentState:     if @props.categories then STATE_READY else STATE_LOADING

  getDefaultProps: ->
    categories:     null

  componentDidMount: ->
    # Если категории пришли в props, имитируем загрузку с сервера
    if (@props.categories)
      OperatorCategoriesServerActions.categoriesLoaded @props.categories
    else
      OperatorCategoriesService.getCategories()

    OperatorCategoriesStore.addChangeListener @_onChange

  componentWillUnmount: ->
    OperatorCategoriesStore.removeChangeListener @_onChange

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
                <OperatorCategories_List parentCategory={ null }
                                         selectedCategory={ this.state.selectedCategory }
                                         onSelectCategory={ this.handleCategorySelection } />
              </div>
              <div className="col-md-6 user-select-none">
                { subcategoriesPane }
                <br />
                <OperatorCategories_GoodsLink selectedCategory={ this.state.selectedCategory } />
              </div>
            </div>`

  _getSubcategoriesPane: ->
    selectedCat = @state.selectedCategory
    if selectedCat and selectedCat.parent_id
      rightParentCat = OperatorCategoriesStore.getCategoryById selectedCat.parent_id
    else
      rightParentCat = selectedCat
    if rightParentCat
      `<OperatorCategories_List parentCategory={ rightParentCat }
                                selectedCategory={ this.state.selectedCategory }
                                onSelectCategory={ this.handleCategorySelection } />`

  _onChange: ->
    if OperatorCategoriesStore.hasCategory @state.selectedCategory
      selectedCategory = @state.selectedCategory
    else if @state.selectedCategory and @state.selectedCategory.parent_id
      selectedCategory = OperatorCategoriesStore.getCategoryById @state.selectedCategory.parent_id
    else
      selectedCategory = null

    @setState
      currentState: STATE_READY
      selectedCategory: selectedCategory

  handleCategorySelection: (category) ->
    @setState(selectedCategory: category)
