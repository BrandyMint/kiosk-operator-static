window.KioskOperatorApp =
  start: ({ vendor_key, operator }) ->
    console.log "KioskOperatorApp start for vendor: #{vendor_key}, operator: #{operator.name}"

    $.ajaxSetup
      xhrFields:
        withCredentials: true
        crossDomain:     true
      headers:
        "X-Vendor-Key": vendor_key

    window.EB.emit 'start'
    ReactUjs.initialize()

  error_alert: (message) -> alert message