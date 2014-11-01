###* @jsx React.DOM ###

###*global React, OperatorCategoriesServerActions, OperatorCategoriesStore###

STATE_LOADING = 'loading'
STATE_READY   = 'ready'

window.OperatorCategories = React.createClass
  propTypes:
    categories:     React.PropTypes.array

  getInitialState: ->
    selectedCategory: null
    currentState:     STATE_LOADING
    rootCategory:     null

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
        `<div className="adm-categories-grid">
              <div className="adm-categories-grid-col"
                   role=     "categories-list">
                <div className="text-center">
                  <i className="fa fa-spinner fa-3x fa-spin" />
                </div>
              </div>
         </div>`

  _getCategoriesForm: ->
    subcategoriesPane = @_getSubcategoriesPane()

    return `<div className="adm-categories-grid">
              <div className="adm-categories-grid-col"
                   role=     "categories-list">
                <OperatorCategories_List parentCategory=  { this.state.rootCategory }
                                         selectedCategory={ this.state.selectedCategory }
                                         onSelectCategory={ this.handleCategorySelection } />
              </div>
              { subcategoriesPane }
              <div className="adm-categories-grid-col __wide">
                <OperatorCategories_ProductsPane selectedCategory={ this.state.selectedCategory } />
              </div>
            </div>`

  _getSubcategoriesPane: ->
    selectedCat = @state.selectedCategory
    if selectedCat
      selectedLevel = OperatorCategoriesStore.getCategoryLevel selectedCat
      switch selectedLevel
        when 1
          rightParentCat = selectedCat
        when 2
          rightParentCat = OperatorCategoriesStore.getCategoryById selectedCat.parent_id
    if rightParentCat
      `<div className="adm-categories-grid-col"
            role=     "categories-list">
         <OperatorCategories_List parentCategory=  { rightParentCat }
                                  selectedCategory={ this.state.selectedCategory }
                                  onSelectCategory={ this.handleCategorySelection } />
       </div>`

  _onChange: ->
    rootCategory = @state.rootCategory || OperatorCategoriesStore.getRootCategory()
    if OperatorCategoriesStore.hasCategory @state.selectedCategory
      selectedCategory = @state.selectedCategory
    else if @state.selectedCategory and @state.selectedCategory.parent_id
      selectedCategory = OperatorCategoriesStore.getCategoryById @state.selectedCategory.parent_id
    else
      selectedCategory = rootCategory

    @setState
      currentState: STATE_READY
      selectedCategory: selectedCategory
      rootCategory: rootCategory

  handleCategorySelection: (category) ->
    @setState(selectedCategory: category)
