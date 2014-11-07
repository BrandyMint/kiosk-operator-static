window.OperatorProductsViewActions =

  changeProductCategory: ({product_id, new_category_id, old_category_id}) ->

    ProductsResource.update
      id: product_id
      data:
        category_id: @props.category.id
      success: ->
        OperatorCategoriesActions.reloadCategory new_category_id
        OperatorCategoriesActions.reloadCategory old_category_id

        OperatorProductsServerActions.removeProductFromCategory
          product_id:  product_id
          category_id: old_category_id
