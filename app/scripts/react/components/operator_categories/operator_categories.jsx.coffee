###* @jsx React.DOM ###

LOADING_STATE = 'loading'
LOADED_STATE  = 'loaded'
ERROR_STATE   = 'error'

window.OperatorCategories = React.createClass

  # propTypes:
  #   productState: React.PropTypes.string
  #   productQuery: React.PropTypes.string

  getInitialState: ->
    currentState:    LOADING_STATE
    currentCategory: null
    rootCategory:    null
    # Determines whether or not load products deeper. In first time we open
    # 'Все товары' listitem, which implies truthy value
    # includeSubcategories: true

  componentDidMount: ->
    OperatorCategoriesViewActions.loadCategories {
      error: => @activateErrorState()
    }

    OperatorCategoriesStore.addChangeListener @_onStoreChange

  componentWillUnmount: ->
    OperatorCategoriesStore.removeChangeListener @_onStoreChange

  render: ->
    switch @state.currentState
      when LOADED_STATE  then categoriesContent = `<OperatorCategories_Loaded
                                                       parentCategory={ this.state.rootCategory }
                                                       currentCategory={ this.state.currentCategory }
                                                       onCategorySelect={ this.handleCategorySelect } />`
      when LOADING_STATE then categoriesContent = `<OperatorCategories_Loading />`
      when ERROR_STATE   then categoriesContent = `<OperatorCategories_LoadingError />`
      else console.warn 'Unknown currentState of OperatorCategories component', @state.currentState

    categoriesContent

  activateErrorState: -> @setState(currentState: ERROR_STATE)

  handleCategorySelect: (category) ->
    @setState(currentCategory: category)

  _onStoreChange: ->
    rootCategory = OperatorCategoriesStore.getRootCategory()

    if OperatorCategoriesStore.isCategoryExists @state.currentCategory
      currentCategory = @state.currentCategory
    else if @state.currentCategory && @state.currentCategory.parent_id
      currentCategory = OperatorCategoriesStore.getCategoryById @state.currentCategory.parent_id
    else
      currentCategory = rootCategory

    @setState {
      currentState:    LOADED_STATE
      currentCategory: currentCategory
      rootCategory:    rootCategory
    }