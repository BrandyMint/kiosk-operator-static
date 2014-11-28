window.Routes =
  products_image_delete_path: (id) -> gon.root_url + '/products/images/'+id

  # Operator categories (на основе http://api.kormilica.info/#!/operator)
  operator_product_url:      (id) -> gon.root_url + '/operator/products/' + id
  operator_product_edit_url: (id) -> gon.root_url + '/operator/products/' + id + '/edit'
  operator_product_new_url:       -> gon.root_url + '/operator/products/new'

  products_by_category_url:   (id) -> gon.root_url + '/operator/products?category_id=' + id