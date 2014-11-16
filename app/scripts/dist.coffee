require './libs'
require './routes/api'
require './routes/routes'
require './app'

# /*==========  Dispatchers  ==========*/

require './react/dispatchers/_base'
require './react/dispatchers/operator_categories'
require './react/dispatchers/operator_products'

# /*==========  Stores  ==========*/

require './react/stores/_base'
require './react/stores/operator_categories'
require './react/stores/operator_products'

# /*==========  Resources  ==========*/

# require './resources/categories'
# require './resources/products'

# /*==========  Services  ==========*/

require './react/services/operator_categories'
require './react/services/operator_products'
# require './services/modal_service'

# /*==========  Actions  ==========*/

require './react/actions/view/operator_categories'
require './react/actions/view/operator_products'
require './react/actions/server/operator_categories'
require './react/actions/server/operator_products'

# /*==========  Mixins  ==========*/

# require './mixins/dragging'
# require './mixins/images_form_mixin'
# require './mixins/product_draggable'
# require './mixins/category_product_droptarget'
# require './mixins/component_manipulations'

# /*==========  Components  ==========*/

require './react/components/common/spinner'
require './react/components/common/money'

require './react/components/product/thumb'
require './react/components/product/state'

# require './components/images_form_thumbs'

require './react/components/operator_categories/operator_categories'
require './react/components/operator_categories/loaded'
require './react/components/operator_categories/loading'
require './react/components/operator_categories/loading_error'
require './react/components/operator_categories/one_category'
require './react/components/operator_categories/two_categories'
require './react/components/operator_categories/list/list'
require './react/components/operator_categories/list/items/item_manager'
require './react/components/operator_categories/list/items/item'
require './react/components/operator_categories/list/items/item_edit'
require './react/components/operator_categories/list/items/without_category'
require './react/components/operator_categories/list/items/with_subcategories'
require './react/components/operator_categories/list/create_form'

require './react/components/operator_products/operator_products'
require './react/components/operator_products/loading'
require './react/components/operator_products/loading_error'
require './react/components/operator_products/list/list'
require './react/components/operator_products/list/item'
# require './components/operator_products/list/item_drag_helper'
# require './components/operator_products/list/product_state'
# require './components/product_status_toggle'

# require './components/modal'

# require './components/super_select'
# require './components/product_images'

# Не используется
#require './components/images_form'

# /*==========  Helpers  ==========*/
require './react/helpers/app'