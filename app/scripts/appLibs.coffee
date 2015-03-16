global._ = require 'lodash'
global.Dispatcher = require('flux').Dispatcher
global.EventEmitter = require 'eventEmitter'
Requester = require './libs/requester'
global.EB = new EventEmitter()
global.Requester = new Requester(eb: window.EB)

# jQuery UI components
require 'jquery.ui.core'
require 'jquery.ui.widget'
require 'jquery.ui.mouse'
require 'jquery.ui.draggable'
require 'jquery.ui.droppable'
require 'jquery.ui.sortable'

# jQuery plugins
require 'jquery.autosize'
require 'jquery.fileupload'
require 'jquery.role'

# Others
require 'bootstrapSass'
require 'typeahead'
require 'aviator'