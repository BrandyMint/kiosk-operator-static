require './local/settings'

require './shared/app'
require './react/application'

operator = require './data/operator.json'
console.log 'Залогинен оператор:', operator

# Запиши сюда ключ вендора на проверяемом api
vendor_key = localStorage.getItem('vendor_key') || 'test'

KioskOperatorApp.start vendor_key: vendor_key, operator: operator
