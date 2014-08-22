$ ->
  @orderModal = $('@order-modal')
  $('@orders-list__table-row').on 'click', () =>
    @orderModal.modal('show')
