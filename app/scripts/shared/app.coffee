window.KioskOperatorApp =
  start: ({vendor_key, operator}) ->
    $.ajaxSetup
      xhrFields:
        withCredentials: true
        crossDomain: true
      headers:
        "X-Vendor-Key": vendor_key


