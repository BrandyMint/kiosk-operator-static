require './libs'
require './shared/app'

require './react/mixins/dragging'
require './react/mixins/images_form_mixin'

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

require './react/services/products_service'
require './react/mocks/products_service_mock'
require './react/components/product_status_toggle'

require './react/components/modal'
require './react/services/modal_service'

require './react/components/super_select'
require './react/components/images_form'
require './react/application'

window.root = ''
window.api_root_url = ''

require './shared/routes'
require './local_routes'

# Должен запускаться после подгрузки реактовских компонентов
window.ReactUjs = require 'react_ujs'


if true # localStorage.getItem('userLogged') == "true"
  window.user = require './data/user.json'
  console.log 'Залогинен пользователь:', window.user.name

  $.ajaxSetup
    xhrFields:
      withCredentials: true
      crossDomain: true
    headers:
      "X-User-Token": window.user.api_key.access_token
else
  console.log 'Без пользователя'
