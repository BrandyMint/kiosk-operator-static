require './libs'
require './routes/api'
require './routes/routes'
require './legacy'
require './app'

# /*==========  Dispatchers  ==========*/

require './react/dispatchers/_base'
require './react/dispatchers/operator_categories'
require './react/dispatchers/operator_products'
require './react/dispatchers/drag_state'

# /*==========  Stores  ==========*/

require './react/stores/_base'
require './react/stores/operator_categories'
require './react/stores/operator_products'
require './react/stores/drag_state'

# /*==========  Resources  ==========*/

require './react/resources/categories'
require './react/resources/products'

# /*==========  Services  ==========*/

require './react/services/operator_categories'
require './react/services/operator_products'
require './react/services/thumbor'

# /*==========  Controllers  ==========*/

require './react/controllers/modal'

# /*==========  Actions  ==========*/

require './react/actions/view/operator_categories'
require './react/actions/view/operator_products'
require './react/actions/server/operator_categories'
require './react/actions/server/operator_products'

# /*==========  Mixins  ==========*/

require './react/mixins/images_form'
require './react/mixins/unmount'
require './react/mixins/product_draggable'
require './react/mixins/category_droppable'
require './react/mixins/component_manipulations'

# /*==========  Components  ==========*/

require './react/components/common/spinner'
require './react/components/common/money'
require './react/components/common/images_form_thumbs'

require './react/components/product/thumb'
require './react/components/product/state'
require './react/components/product/images'
require './react/components/product/status_toggle'

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
require './react/components/operator_products/list/item_drag'

require './react/components/modal/modal'

# /*==========  Helpers  ==========*/
require './react/helpers/app'