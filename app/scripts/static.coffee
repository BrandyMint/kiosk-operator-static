$ ->
  @orderModal = $('@order-modal')
  $('@orders-list__table-modal-btn').on 'click', () =>
    @orderModal.modal('show')

  $('@jump').on 'click', (e) ->
    href = $(this).data('href')
    if href != ''
      if event.shiftKey || event.ctrlKey || event.metaKey
        window.open(target, '_blank')
      else
        window.location = href

  $('@jump .dropdown, @jump input').on 'click', (e) ->
    e.stopPropagation()
