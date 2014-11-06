require './libs'
require './shared/app'
require './shared/legacy'
require './shared/requester'
require './shared/thumbor_service'

require './react/mixins/dragging'
require './react/mixins/images_form_mixin'
require './react/mixins/product_draggable'
require './react/mixins/category_product_droptarget'

require './react/components/images_form_thumbs'

require './react/actions/operator_categories_actions'
require './react/actions/operator_categories_server_actions'
require './react/dispatchers/operator_categories_dispatcher'
require './react/services/operator_categories_service'
require './react/mocks/operator_categories_example_data'
require './react/stores/operator_categories_store'
require './react/components/operator_categories/item_view'
require './react/components/operator_categories/item_edit'
require './react/components/operator_categories/item'
require './react/components/operator_categories/list'
require './react/components/operator_categories/create_form'
require './react/components/operator_categories/products_pane'
require './react/components/operator_categories/categories'

require './react/actions/operator_products_server_actions'
require './react/dispatchers/operator_products_dispatcher'
require './react/services/products_service'
require './react/mocks/products_service_mock'
require './react/stores/operator_products_store'
require './react/components/product_status_toggle'
require './react/components/operator_products/list_row_drag_helper'
require './react/components/operator_products/product_state'
require './react/components/operator_products/list_row'
require './react/components/operator_products/list_body'
require './react/components/operator_products/products'

require './react/components/modal'
require './react/services/modal_service'

require './react/components/super_select'
require './react/components/images_form'
require './react/application'

window.root = ''
window.api_root_url = ''

require './shared/routes'
require './local_routes'

operator = require './data/operator.json'
console.log 'Залогинен оператор:', operator

# Запиши сюда ключ вендора на проверяемом api
vendor_key = localStorage.getItem('vendor_key') || 'test'

KioskOperatorApp.start vendor_key: vendor_key, operator: operator
