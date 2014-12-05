window.gon =
  #fallback_product_thumb_url: "assets/product-50x50-1.jpg"
 fallback_product_thumb_url: 'assets/product-none.png'

 # localStorage.setItem('root_url', 'http://kaskad.3001.vkontraste.ru')
 root_url: localStorage.getItem('root_url') || ''

 # localStorage.setItem('api_root_url', 'http://kaskad.3001.vkontraste.ru/api')
 api_root_url: localStorage.getItem('api_root_url') || ''

 # Если null значит брать напрямую
 thumbor_url: 'http://thumball.brandydev.ru'
 thumbor_secret: null