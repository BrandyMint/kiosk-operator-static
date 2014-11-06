require './local/settings'

require './shared/app'

window.mockMode = true
require './react/application'
require './react/mocks/products_service_mock'
require './react/mocks/operator_categories_example_data'

operator = require './data/operator.json'
console.log 'Залогинен оператор:', operator

# Запиши сюда ключ вендора на проверяемом api
vendor_key = localStorage.getItem('vendor_key') || 'test'

KioskOperatorApp.start vendor_key: vendor_key, operator: operator
