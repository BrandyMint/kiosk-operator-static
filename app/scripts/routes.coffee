window.Routes =
  products_image_delete_path: (id) -> '/products/images/'+id

  # Operator categories (на основе http://api.kormilica.info/#!/operator)
  operator_categories_url:                    -> '/v1/operator/categories.json'
  operator_categories_item_url:          (id) -> '/v1/operator/categories/' + id + '.json'

  operator_products_url:                      -> '/v1/operator/products.json'
  operator_products_item_url:            (id) -> '/v1/operator/products/' + id + '.json'
  operator_products_item_pub_url:        (id) -> '/v1/operator/products/' + id + '/publication.json'

  #products_by_category_url:              (id) -> '/operator/products?category_id=' + id
  products_by_category_url:              (id) -> '_products.html'
