window.Routes =
  products_image_delete_path: (id) -> '/products/images/'+id

  # Operator categories (на основе http://api.kormilica.info/#!/operator)
  operator_categories_url:                    -> '/v1/operator/categories.json'
  operator_categories_item_url:          (id) -> '/v1/operator/categories/' + id + '.json'
  
  products_by_category_url:              (id) -> 'products?category_id=' + id
