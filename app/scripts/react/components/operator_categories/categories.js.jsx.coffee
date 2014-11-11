###* @jsx React.DOM ###

###*global React, OperatorCategoriesServerActions, OperatorCategoriesStore###

STATE_LOADING = 'loading'
STATE_READY   = 'ready'

window.OperatorCategories = React.createClass
  propTypes:
    productState:   React.PropTypes.string
    productQuery:   React.PropTypes.string

  getInitialState: ->
    selectedCategory: null
    currentState:     STATE_LOADING

    # dapi: Почему это state? Он же не метяется, это props
    rootCategory:     null

  getDefaultProps: ->
    categories:     null
    productState:   null
    productQuery:   null

  componentDidMount: ->
    OperatorCategoriesStore.addChangeListener @_onChange
    OperatorCategoriesService.getCategories()

  componentWillUnmount: ->
    OperatorCategoriesStore.removeChangeListener @_onChange

  render: ->
    switch @state.currentState
      when STATE_READY
        @_getCategoriesForm()
      when STATE_LOADING
        `<div className="adm-categories-grid">
              <div className="adm-categories-grid-col">
                <br />
                <Spinner className="fa-3x" align="center" />
              </div>
         </div>`

  _getCategoriesForm: ->
    subcategoriesPane = @_getSubcategoriesPane()

    return `<div className="adm-categories-grid">
              <div className="adm-categories-grid-col">
                <OperatorCategories_List parentCategory=  { this.state.rootCategory }
                                         selectedCategory={ this.state.selectedCategory }
                                         onSelectCategory={ this.handleCategorySelection } />
              </div>
              { subcategoriesPane }
              <div className="adm-categories-grid-col __wide">
                <OperatorProducts category_id={ this.state.selectedCategory.id } productState={this.props.productState} productQuery={this.props.productQuery} />
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
      `<div className="adm-categories-grid-col">
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
