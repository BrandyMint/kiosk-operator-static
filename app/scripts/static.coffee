$ ->
  @orderModal = $('@order-modal')
  $('@orders-list__table-modal-btn').on 'click', () =>
    @orderModal.modal('show')
