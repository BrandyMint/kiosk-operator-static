###* @jsx React.DOM ###

LOADING_STATE = 'loading'
LOADED_STATE  = 'loaded'
ERROR_STATE   = 'error'

window.OperatorCategories = React.createClass

  propTypes:
    productState: React.PropTypes.string
    productQuery: React.PropTypes.string

  getInitialState: ->
    currentState:     LOADING_STATE
    selectedCategory: null

    # dapi: Почему это state? Он же не метяется, это props
    rootCategory:     null

  componentDidMount: ->
    OperatorCategoriesStore.addChangeListener @_onStoreChange
    OperatorCategoriesService.getCategories {
      error: => @activateErrorState()
    }

  componentWillUnmount: ->
    OperatorCategoriesStore.removeChangeListener @_onStoreChange

  render: ->
    switch @state.currentState
      when LOADED_STATE  then categoriesContent = `<OperatorCategories_CategoriesLoaded
                                                       parentCategory={ this.state.rootCategory }
                                                       selectedCategory={ this.state.selectedCategory }
                                                       productQuery={ this.props.productQuery }
                                                       productState={ this.props.productState }
                                                       onSelectCategory={ this.handleCategorySelection } />`
      when LOADING_STATE then categoriesContent = `<OperatorCategories_Loading />`
      when ERROR_STATE   then categoriesContent = `<OperatorCategories_LoadingError />`
      else console.warn 'Unknown currentState of OperatorCategories component', @state.currentState

    categoriesContent

  activateErrorState: -> @setState(currentState: ERROR_STATE)

  handleCategorySelection: (category) ->
    @setState(selectedCategory: category)

  _onStoreChange: ->
    rootCategory = @state.rootCategory || OperatorCategoriesStore.getRootCategory()

    if OperatorCategoriesStore.hasCategory @state.selectedCategory
      selectedCategory = @state.selectedCategory
    else if @state.selectedCategory and @state.selectedCategory.parent_id
      selectedCategory = OperatorCategoriesStore.getCategoryById @state.selectedCategory.parent_id
    else
      selectedCategory = rootCategory

    @setState {
      currentState: LOADED_STATE
      selectedCategory: selectedCategory
      rootCategory: rootCategory
    }