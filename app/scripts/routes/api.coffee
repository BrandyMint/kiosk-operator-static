window.ApiRoutes =
  operator_product_image_delete_url:  (id) -> gon.api_root_url + '/v1/operator/products/images/' + id
  operator_product_images_rotate_url: (id) -> gon.api_root_url + '/v1/operator/product_images/' + id + '/rotate'
  operator_product_images_url:             -> gon.api_root_url + '/v1/operator/product_images'

  operator_categories_url:                 -> gon.api_root_url + '/v1/operator/categories'
  operator_category_url:              (id) -> gon.api_root_url + '/v1/operator/categories/' + id

  operator_product_url:               (id) -> gon.api_root_url + '/v1/operator/products/' + id
  operator_product_publicate_url:     (id) -> gon.api_root_url + '/v1/operator/products/' + id + '/publication'
  operator_products_by_category_url:       -> gon.api_root_url + '/v1/operator/products'