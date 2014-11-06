require './local/gon'

require './shared/app'
require './react/application'

require './local/routes'

if localStorage.getItem('mockMode')
  require './react/mocks/products_service_mock'
  require './react/mocks/operator_categories_example_data'

operator = require './data/operator.json'
console.log 'Залогинен оператор:', operator

# Запиши сюда ключ вендора на проверяемом api
# test это реальный токен от вендора (3 kaskad) на 3001.vkontraste.ru
vendor_key = localStorage.getItem('vendor_key') || 'test'

KioskOperatorApp.start vendor_key: vendor_key, operator: operator
