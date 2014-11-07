require './libs'
require './routes'
require './app'
require './legacy'
require './requester'
require './thumbor_service'
require './app_helpers'

window.KioskOperatorApp =
  start: ({vendor_key, operator}) ->
    console.log "KioskOperatorApp start for vendor: #{vendor_key}, operator: #{operator.name}"
    $.ajaxSetup
      xhrFields:
        withCredentials: true
        crossDomain: true
      headers:
        "X-Vendor-Key": vendor_key

    window.EB.emit 'start'
    ReactUjs.initialize()

  error_alert: (message) -> alert message
