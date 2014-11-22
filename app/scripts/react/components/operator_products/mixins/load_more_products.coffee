THRESHOLD = 1000

window.LoadMoreProductsMixin =

  componentDidMount: ->
    $(window).on 'scroll', @handleScroll

  componentWillUnmount: ->
    $(window).off 'scroll', @handleScroll

  handleScroll: ->
    if !@isLoadingMoreState() && !@state.isAllProductsLoaded
      isNearBottom = $(window).scrollTop() + $(window).height() > $(document).height() - THRESHOLD

      @loadMoreProducts() if isNearBottom