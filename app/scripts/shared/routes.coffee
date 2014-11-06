window.Routes =
  products_image_delete_path:            (id) -> gon.root_url + '/products/images/'+id

  # Operator categories (на основе http://api.kormilica.info/#!/operator)
  operator_categories_url:                    -> gon.api_root_url + '/v1/operator/categories.json'
  operator_category_url:                 (id) -> gon.api_root_url + '/v1/operator/categories/' + id + '.json'

  operator_products_url:                      -> gon.api_root_url + '/v1/operator/products.json'
  operator_products_by_category_url:          -> gon.api_root_url + '/v1/operator/products.json'
  operator_products_item_url:            (id) -> gon.api_root_url + '/v1/operator/products/' + id + '.json'
  operator_products_item_pub_url:        (id) -> gon.api_root_url + '/v1/operator/products/' + id + '/publication.json'
  operator_product_url:                  (id) -> gon.root_url + '/operator/products/' + id
  edit_operator_product_url:             (id) -> gon.root_url + '/operator/products/' + id + '/edit'

  products_by_category_url:              (id) -> gon.root_url + '/operator/products?category_id=' + id
