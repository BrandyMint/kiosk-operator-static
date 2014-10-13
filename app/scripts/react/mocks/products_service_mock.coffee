###*global ProductsService, _ ###

# Monkey-patch the service to setup mock data
window.ProductsService = _.extend window.ProductsService, {
  mockMode: true
  mockData:
    publishResponse:
      state: 		'published'
      manual_state: 1
    unpublishResponse:
      state: 		'unpublished'
      manual_state: 1
}
