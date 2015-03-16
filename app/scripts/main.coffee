require './local/gon'
require './libs'
require './bundle'
require './local/routes'

mockOperator = require './data/operator.json'
console.log 'Залогинен оператор:', mockOperator

# Запиши сюда ключ вендора на проверяемом api
# test это реальный токен от вендора (3 kaskad) на 3001.vkontraste.ru
vendorKey = localStorage.getItem('vendor_key') || 'test'

KioskOperatorApp.start vendor_key: vendorKey, operator: mockOperator