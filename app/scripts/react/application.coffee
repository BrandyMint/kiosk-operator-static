# /*==========  Dispatchers  ==========*/

require './dispatchers/operator_categories_dispatcher'
require './dispatchers/operator_products_dispatcher'

# /*==========  Stores  ==========*/

require './stores/operator_categories_store'
require './stores/operator_products_store'

# /*==========  Resources  ==========*/

require './resources/categories'
require './resources/products'

# /*==========  Services  ==========*/

require './services/operator_categories'
require './services/operator_products'
require './services/modal_service'

# /*==========  Actions  ==========*/

require './actions/operator_categories_actions'
require './actions/operator_categories_server_actions'
require './actions/operator_products_server_actions'

# /*==========  Mixins  ==========*/

require './mixins/dragging'
require './mixins/images_form_mixin'
require './mixins/product_draggable'
require './mixins/category_product_droptarget'
require './mixins/component_manipulations'

# /*==========  Components  ==========*/

require './components/product_thumb'
require './components/images_form_thumbs'
require './components/spinner'

require './components/operator_categories/operator_categories'
require './components/operator_categories/categories_loaded'
require './components/operator_categories/one_category'
require './components/operator_categories/two_categories'
require './components/operator_categories/loading'
require './components/operator_categories/loading_error'
require './components/operator_categories/list/list'
require './components/operator_categories/list/items/item'
require './components/operator_categories/list/items/view'
require './components/operator_categories/list/items/edit'
require './components/operator_categories/list/items/without_category'
require './components/operator_categories/list/items/with_subcategories'
require './components/operator_categories/list/create_form'

require './components/operator_products/operator_products'
require './components/operator_products/loading'
require './components/operator_products/loading_error'
require './components/operator_products/list/list'
require './components/operator_products/list/item'
require './components/operator_products/list/item_drag_helper'
require './components/operator_products/list/product_state'
require './components/product_status_toggle'

require './components/modal'

require './components/money'
require './components/super_select'
require './components/product_images'
# Не используется
#require './components/images_form'