window.Routes =
  products_image_delete_path:            (id) -> gon.root_url + '/products/images/'+id

  # Operator categories (на основе http://api.kormilica.info/#!/operator)
  operator_product_url:                  (id) -> gon.root_url + '/operator/products/' + id
  edit_operator_product_url:             (id) -> gon.root_url + '/operator/products/' + id + '/edit'

  products_by_category_url:              (id) -> gon.root_url + '/operator/products?category_id=' + id