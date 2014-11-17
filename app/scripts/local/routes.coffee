unless gon.root_url
  console.debug? 'Используем локальные пути'
  Routes.edit_operator_product_url=             (id) -> 'modal-edit-product.html'
  Routes.products_by_category_url=              (id) -> '_products.html'