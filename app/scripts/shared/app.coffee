$ ->
  @orderModal = $('@order-modal')
  $('@orders-list__table-modal-btn').on 'click', () =>
    @orderModal.modal('show')

  productVariantsAdd = $('@products__new-form-variants-add')
  productVariantsTitle = $('@products__new-form-variants-title')
  productVariantsItem = $('@products__new-form-variants-item')
  productVariantsPlace = $('@products__new-form-variants-place')
  productFormQuantity = $('@products__new-form-quantity')
  productFormArticul = $('@products__new-form-articul')
  productFormImageAdd = $('@products__new-form-image-add')

  productVariantsTitle.hide()
  productVariantsPlace.hide()

  productVariantsAdd.on 'click', (e) ->
    e.preventDefault()
    productFormArticul.hide()
    productFormQuantity.hide()
    productVariantsTitle.show()
    productVariantsPlace.show()
    html = productVariantsItem.html()
    productVariantsPlace.append(html)

  productFormImageAdd.on 'click', (e) ->
    e.preventDefault()
    $(@).toggleClass 'active'

  $('@jump').on 'click', (e) ->
    href = $(this).data('href')
    if href != ''
      if event.shiftKey || event.ctrlKey || event.metaKey
        window.open(target, '_blank')
      else
        window.location = href

  $('@jump .dropdown, @jump input').on 'click', (e) ->
    e.stopPropagation()

  productToggle = $('@product-toggle')
  productToggleSwitch = productToggle.find('input[type="checkbox"]')
  productToggleSwitch.on 'change', () ->
    toggleBlock = $(@).parents().filter('[role="product-toggle"]')
    toggleBlock.removeClass 'checked'
    if $(@).is(':checked')
      toggleBlock.addClass 'checked'
