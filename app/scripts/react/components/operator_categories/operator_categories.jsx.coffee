###* @jsx React.DOM ###

LOADING_STATE = 'loading'
LOADED_STATE  = 'loaded'
ERROR_STATE   = 'error'

window.OperatorCategories = React.createClass

  propTypes:
    productState: React.PropTypes.string
    productQuery: React.PropTypes.string
    categoryId:   React.PropTypes.number

  getInitialState: ->
    currentState:         LOADING_STATE
    currentCategory:      null
    rootCategory:         null
    # Determines whether or not load products deeper. In first time we open
    # all products with subcategories, which implies truthy value
    includeSubcategories: true

  componentDidMount: ->
    OperatorCategoriesViewActions.loadCategories {
      success: @activateLoadedState
      error:   @activateErrorState
    }

    OperatorCategoriesStore.addChangeListener @_onStoreChange

  componentWillUnmount: ->
    OperatorCategoriesStore.removeChangeListener @_onStoreChange

  render: ->
    switch @state.currentState
      when LOADED_STATE
        categoriesContent = `<OperatorCategories_Loaded
                                 parentCategory={ this.state.rootCategory }
                                 currentCategory={ this.state.currentCategory }
                                 productQuery={ this.props.productQuery }
                                 productState={ this.props.productState }
                                 includeSubcategories={ this.state.includeSubcategories }
                                 onCategorySelect={ this.handleCategorySelect } />`
      when LOADING_STATE
        categoriesContent = `<OperatorCategories_Loading />`
      when ERROR_STATE
        categoriesContent = `<OperatorCategories_LoadingError />`
      else console.warn 'Unknown currentState of OperatorCategories component', @state.currentState

    categoriesContent

  activateLoadedState: -> @setState(currentState: LOADED_STATE)
  activateErrorState:  -> @setState(currentState: ERROR_STATE)

  handleCategorySelect: ({category, includeSubcategories}) ->
    @setState {
      currentCategory: category
      includeSubcategories: includeSubcategories
    }
    Aviator.navigate '', queryParams: { category_id: category.id }
    #TODO: store currentCategory in individual store
    DragStateDispatcher.handleViewAction {
      type: 'currentCategoryChanged'
    }

  _onStoreChange: ->
    rootCategory = OperatorCategoriesStore.getRootCategory()

    if OperatorCategoriesStore.getCategoryById @props.categoryId
      currentCategory = OperatorCategoriesStore.getCategoryById @props.categoryId
    else
      if OperatorCategoriesStore.isCategoryExists @state.currentCategory
        currentCategory = @state.currentCategory
      else if @state.currentCategory && @state.currentCategory.parent_id
        currentCategory = OperatorCategoriesStore.getCategoryById @state.currentCategory.parent_id
      else
        currentCategory = rootCategory

    @setState {
      currentCategory: currentCategory
      rootCategory:    rootCategory
    }