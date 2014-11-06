# И
# localStorage.setItem('root_url', 'http://3001.vkontraste.ru')
root_url = localStorage.getItem('root_url') || ''

# localStorage.setItem('api_root_url', 'http://api.3001.vkontraste.ru')
api_root_url = localStorage.getItem('api_root_url') || ''

window.Routes =
  products_image_delete_path:            (id) -> root_url + '/products/images/'+id

  # Operator categories (на основе http://api.kormilica.info/#!/operator)
  operator_categories_url:                    -> api_root_url + '/v1/operator/categories.json'
  operator_categories_item_url:          (id) -> api_root_url + '/v1/operator/categories/' + id + '.json'

  operator_products_url:                      -> api_root_url + '/v1/operator/products.json'
  operator_products_by_category_url:     (id) -> api_root_url + '/v1/operator/products.json?per_page=1000&category_id=' + id
  operator_products_item_url:            (id) -> api_root_url + '/v1/operator/products/' + id + '.json'
  operator_products_item_pub_url:        (id) -> api_root_url + '/v1/operator/products/' + id + '/publication.json'
  operator_product_path:                 (id) -> root_url + '/operator/prodocuts/' + id

  products_by_category_url:              (id) -> '/operator/products?category_id=' + id

unless root_url
  Routes.operator_product_path=                 (id) -> 'modal-edit-product.html'
  Routes.products_by_category_url=              (id) -> '_products.html'
