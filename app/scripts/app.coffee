require './libs'
require './static'

require './react/components/super_select'
require './react/application'

# Должен запускаться после подгрузки реактовских компонентов
window.ReactUjs = require 'react_ujs'
