require './libs'
require './shared/app'

require './react/mixins/dragging'
require './react/mixins/images_form_mixin'

require './react/components/images_form_thumbs'
require './react/components/operator_categories_item'
require './react/components/operator_categories_list'

require './react/components/super_select'
require './react/components/images_form'
require './react/application'

require './routes'

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
