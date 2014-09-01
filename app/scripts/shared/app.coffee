$ ->
  @orderModal = $('@order-modal')
  $('@orders-list__table-modal-btn').on 'click', () =>
    @orderModal.modal('show')

  productVariantsAdd = $('@products__new-form-variants-add')
  productVariantsTitle = $('@products__new-form-variants-title')
  productVariantsItem = $('@products__new-form-variants-item')
  productVariantsPlace = $('@products__new-form-variants-place')

  productVariantsTitle.hide()
  productVariantsPlace.hide()

  productVariantsAdd.on 'click', (e) ->
    e.preventDefault()
    productVariantsTitle.show()
    productVariantsPlace.show()
    html = productVariantsItem.html()
    productVariantsPlace.append(html)


  $('@jump').on 'click', (e) ->
    href = $(this).data('href')
    if href != ''
      if event.shiftKey || event.ctrlKey || event.metaKey
        window.open(target, '_blank')
      else
        window.location = href

  $('@jump .dropdown, @jump input').on 'click', (e) ->
    e.stopPropagation()
