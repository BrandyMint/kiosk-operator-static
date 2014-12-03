(function e(t,n,r){function s(o,u){if(!n[o]){if(!t[o]){var a=typeof require=="function"&&require;if(!u&&a)return a(o,!0);if(i)return i(o,!0);var f=new Error("Cannot find module '"+o+"'");throw f.code="MODULE_NOT_FOUND",f}var l=n[o]={exports:{}};t[o][0].call(l.exports,function(e){var n=t[o][1][e];return s(n?n:e)},l,l.exports,e,t,n,r)}return n[o].exports}var i=typeof require=="function"&&require;for(var o=0;o<r.length;o++)s(r[o]);return s})({1:[function(require,module,exports){
var mockOperator, vendorKey;

require('./dist');

require('./local/gon');

require('./local/routes');

mockOperator = require('./data/operator.json');

console.log('Залогинен оператор:', mockOperator);

vendorKey = localStorage.getItem('vendor_key') || 'test';

KioskOperatorApp.start({
  vendor_key: vendorKey,
  operator: mockOperator
});



},{"./data/operator.json":3,"./dist":4,"./local/gon":8,"./local/routes":9}],2:[function(require,module,exports){
window.KioskOperatorApp = {
  start: function(_arg) {
    var OperatorRouteTarget, operator, vendor_key;
    vendor_key = _arg.vendor_key, operator = _arg.operator;
    console.log("KioskOperatorApp start for vendor: " + vendor_key + ", operator: " + operator.name);
    $.ajaxSetup({
      xhrFields: {
        withCredentials: true,
        crossDomain: true
      },
      headers: {
        'X-Vendor-Key': vendor_key
      }
    });
    OperatorRouteTarget = {
      categories: function(req) {}
    };
    Aviator.setRoutes({
      '/operator': {
        target: OperatorRouteTarget,
        '/categories': 'categories'
      }
    });
    Aviator.dispatch();
    window.EB.emit('start');
    return ReactUjs.initialize();
  },
  error_alert: function(message) {
    return alert(message);
  }
};



},{}],3:[function(require,module,exports){
module.exports={
  "id": 17,
  "name": "yagr",
  "authentications": [],
  "api_key": {
    "access_token": "3cd8350b5229f08ecc12416c89c2be39",
    "user_id": 17,
    "expires_at": "2015-01-10T11:22:34.000+04:00"
  },
}

},{}],4:[function(require,module,exports){
require('./libs');

require('./routes/api');

require('./routes/routes');

require('./legacy');

require('./app');

require('./react/dispatchers/_base');

require('./react/dispatchers/operator_categories');

require('./react/dispatchers/operator_products');

require('./react/dispatchers/drag_state');

require('./react/stores/_base');

require('./react/stores/operator_categories');

require('./react/stores/operator_products');

require('./react/stores/drag_state');

require('./react/resources/categories');

require('./react/resources/products');

require('./react/services/operator_categories');

require('./react/services/operator_products');

require('./react/services/thumbor');

require('./react/services/uuid');

require('./react/controllers/modal');

require('./react/actions/view/operator_categories');

require('./react/actions/view/operator_products');

require('./react/actions/view/product_images');

require('./react/actions/server/operator_categories');

require('./react/actions/server/operator_products');

require('./react/mixins/unmount');

require('./react/mixins/activities');

require('./react/mixins/product_draggable');

require('./react/mixins/category_droppable');

require('./react/mixins/component_manipulations');

require('./react/components/operator_products/mixins/load_more_products');

require('./react/components/common/money');

require('./react/components/common/spinner');

require('./react/components/common/super_select');

require('./react/components/common/images_form_thumbs');

require('./react/components/product/thumb');

require('./react/components/product/state');

require('./react/components/product/images/images');

require('./react/components/product/status_toggle');

require('./react/components/product/modification_list');

require('./react/components/product/modification_list_item');

require('./react/components/product/total_items_quantity');

require('./react/components/operator_categories/operator_categories');

require('./react/components/operator_categories/loaded');

require('./react/components/operator_categories/loading');

require('./react/components/operator_categories/loading_error');

require('./react/components/operator_categories/one_category');

require('./react/components/operator_categories/two_categories');

require('./react/components/operator_categories/list/list');

require('./react/components/operator_categories/list/items/item_manager');

require('./react/components/operator_categories/list/items/item');

require('./react/components/operator_categories/list/items/item_edit');

require('./react/components/operator_categories/list/items/without_category');

require('./react/components/operator_categories/list/items/with_subcategories');

require('./react/components/operator_categories/list/create_form');

require('./react/components/operator_products/operator_products');

require('./react/components/operator_products/empty');

require('./react/components/operator_products/loading');

require('./react/components/operator_products/loading_error');

require('./react/components/operator_products/list/list');

require('./react/components/operator_products/list/item');

require('./react/components/operator_products/list/item_drag');

require('./react/components/operator_products/list/items_drag');

require('./react/components/modal/modal');

require('./react/helpers/app');

require('./react/helpers/event');



},{"./app":2,"./legacy":5,"./libs":6,"./react/actions/server/operator_categories":10,"./react/actions/server/operator_products":11,"./react/actions/view/operator_categories":12,"./react/actions/view/operator_products":13,"./react/actions/view/product_images":14,"./react/components/common/images_form_thumbs":15,"./react/components/common/money":16,"./react/components/common/spinner":17,"./react/components/common/super_select":18,"./react/components/modal/modal":19,"./react/components/operator_categories/list/create_form":20,"./react/components/operator_categories/list/items/item":21,"./react/components/operator_categories/list/items/item_edit":22,"./react/components/operator_categories/list/items/item_manager":23,"./react/components/operator_categories/list/items/with_subcategories":24,"./react/components/operator_categories/list/items/without_category":25,"./react/components/operator_categories/list/list":26,"./react/components/operator_categories/loaded":27,"./react/components/operator_categories/loading":28,"./react/components/operator_categories/loading_error":29,"./react/components/operator_categories/one_category":30,"./react/components/operator_categories/operator_categories":31,"./react/components/operator_categories/two_categories":32,"./react/components/operator_products/empty":34,"./react/components/operator_products/list/item":35,"./react/components/operator_products/list/item_drag":36,"./react/components/operator_products/list/items_drag":37,"./react/components/operator_products/list/list":38,"./react/components/operator_products/loading":39,"./react/components/operator_products/loading_error":40,"./react/components/operator_products/mixins/load_more_products":41,"./react/components/operator_products/operator_products":42,"./react/components/product/images/images":44,"./react/components/product/modification_list":50,"./react/components/product/modification_list_item":51,"./react/components/product/state":52,"./react/components/product/status_toggle":53,"./react/components/product/thumb":54,"./react/components/product/total_items_quantity":55,"./react/controllers/modal":56,"./react/dispatchers/_base":57,"./react/dispatchers/drag_state":58,"./react/dispatchers/operator_categories":59,"./react/dispatchers/operator_products":60,"./react/helpers/app":61,"./react/helpers/event":62,"./react/mixins/activities":63,"./react/mixins/category_droppable":64,"./react/mixins/component_manipulations":65,"./react/mixins/product_draggable":66,"./react/mixins/unmount":67,"./react/resources/categories":68,"./react/resources/products":69,"./react/services/operator_categories":70,"./react/services/operator_products":71,"./react/services/thumbor":72,"./react/services/uuid":73,"./react/stores/_base":74,"./react/stores/drag_state":75,"./react/stores/operator_categories":76,"./react/stores/operator_products":77,"./routes/api":78,"./routes/routes":79}],5:[function(require,module,exports){
$(function() {
  var authBack, authBox, authSectionToggle, bindActivities, categoriesList, clearClasses, modalClick, path, prevSection, productFormArticul, productFormImageAdd, productFormQuantity, productParamsAdd, productParamsItem, productParamsPlace, productParamsTitle, productVariantTypeBtn, productVariantTypeInput, productVariantTypeLabel, productVariantsAdd, productVariantsAddBlock, productVariantsAddBlockBtn, productVariantsBlock, productVariantsItem, productVariantsPlace, productVariantsTitle, switcherDisplayCategories, switcherTitles;
  modalClick = function(event) {
    event.stopPropagation();
    event.preventDefault();
    return ModalService.show($(this).data('modalUrl'));
  };
  bindActivities = function() {
    $("[tooltip]").tooltip();
    return $('[autosize]').autosize();
  };
  $(document).on('click', '[ks-modal]', modalClick);
  bindActivities();
  $(document).on('page:change', bindActivities);
  productVariantsAdd = $('@products__new-form-variants-add');
  productVariantsTitle = $('@products__new-form-variants-title');
  productVariantsItem = $('@products__new-form-variants-item');
  productVariantsPlace = $('@products__new-form-variants-place');
  productVariantsAddBlock = $('@products__new-form-variants-add-block');
  productVariantsAddBlockBtn = $('@products__new-form-variants-add-block-btn');
  productVariantsBlock = $('@products__new-form-variants-block');
  productVariantTypeBtn = $('@products__new-form-variant-type-btn');
  productVariantTypeInput = $('@products__new-form-variant-type-input');
  productVariantTypeLabel = $('@products__new-form-variant-type-label');
  productVariantsBlock.hide();
  productVariantsAddBlockBtn.on('click', function(e) {
    e.preventDefault();
    productVariantsAddBlock.hide();
    return productVariantsBlock.show();
  });
  productVariantTypeBtn.on('click', function(e) {
    var type;
    e.preventDefault();
    productVariantTypeBtn.removeClass('active');
    $(this).addClass('active');
    type = $(this).text();
    return productVariantTypeLabel.text(type);
  });
  productVariantTypeInput.on('focus', function() {
    var prevBtn;
    prevBtn = productVariantTypeBtn.filter('.active');
    productVariantTypeBtn.removeClass('active');
    return $(this).on('blur', function() {
      if (!($(this).val().length > 0)) {
        prevBtn.addClass('active');
        return productVariantTypeLabel.text(prevBtn.text());
      }
    });
  });
  productVariantTypeInput.on('keypress', function() {
    var type;
    if ($(this).val().length > 0) {
      type = $(this).val();
      return productVariantTypeLabel.text(type);
    }
  });
  productParamsAdd = $('@products__new-form-params-add');
  productParamsTitle = $('@products__new-form-params-title');
  productParamsItem = $('@products__new-form-params-item');
  productParamsPlace = $('@products__new-form-params-place');
  productFormQuantity = $('@products__new-form-quantity');
  productFormArticul = $('@products__new-form-articul');
  productFormImageAdd = $('@products__new-form-image-add');
  productVariantsTitle.hide();
  productVariantsPlace.hide();
  productVariantsAdd.on('click', function(e) {
    var html;
    e.preventDefault();
    productFormArticul.hide();
    productFormQuantity.hide();
    productVariantsTitle.show();
    productVariantsPlace.show();
    html = productVariantsItem.html();
    return productVariantsPlace.append(html);
  });
  productParamsTitle.hide();
  productParamsPlace.hide();
  productParamsAdd.on('click', function(e) {
    var html;
    e.preventDefault();
    productParamsTitle.show();
    productParamsPlace.show();
    html = productParamsItem.html();
    return productParamsPlace.append(html);
  });
  productFormImageAdd.on('click', function(e) {
    e.preventDefault();
    return $(this).toggleClass('active');
  });
  $('@jump').on('click', function(e) {
    var href;
    href = $(this).data('href');
    if (href !== '') {
      if (event.shiftKey || event.ctrlKey || event.metaKey) {
        return window.open(target, '_blank');
      } else {
        return window.location = href;
      }
    }
  });
  $('@jump .dropdown, @jump input').on('click', function(e) {
    return e.stopPropagation();
  });
  categoriesList = $('@categories-list');
  switcherDisplayCategories = $('@switch-display-categories');
  switcherTitles = {
    hide: switcherDisplayCategories.data('title-hide'),
    show: switcherDisplayCategories.data('title-show')
  };
  switcherDisplayCategories.on('click', function(e) {
    e.preventDefault();
    if (categoriesList.is(':visible')) {
      categoriesList.hide();
      return $(this).text(switcherTitles.show);
    } else {
      categoriesList.show();
      return $(this).text(switcherTitles.hide);
    }
  });
  authBox = $('@auth-box');
  authSectionToggle = $('@auth-section-toggle');
  authBack = $('@auth-back-btn');
  path = [];
  prevSection = 'welcome';
  clearClasses = function() {
    var className, classNames, i;
    i = 0;
    classNames = authBox.attr("class").split(/\s+/);
    while (i < classNames.length) {
      className = classNames[i];
      if (className.match(/^__\w+/)) {
        authBox.removeClass(className);
      }
      i++;
    }
  };
  authSectionToggle.on('click', function(e) {
    var step;
    e.preventDefault();
    path.push(prevSection);
    step = $(this).data('step');
    clearClasses();
    authBox.addClass('__' + step);
    return prevSection = step;
  });
  return authBack.on('click', function(e) {
    var step;
    console.log(path.length);
    if (path.length === 0) {
      return false;
    }
    step = path.pop();
    prevSection = step;
    clearClasses();
    return authBox.addClass('__' + step);
  });
});



},{}],6:[function(require,module,exports){
var Requester;

window._ = require('lodash');

window.$ = window.jQuery = require('jquery');

window.React = require('react');

window.Dispatcher = require('flux').Dispatcher;

window.EventEmitter = require('eventEmitter');

window.ReactUjs = require('reactUjs');

Requester = require('./libs/requester');

window.EB = new EventEmitter();

window.Requester = new Requester({
  eb: window.EB
});

require('jquery.ui.core');

require('jquery.ui.widget');

require('jquery.ui.mouse');

require('jquery.ui.draggable');

require('jquery.ui.droppable');

require('jquery.ui.sortable');

require('jquery.autosize');

require('jquery.fileupload');

require('jquery.role');

require('react-mixin-manager')(window.React);

require('bootstrapSass');

require('typeahead');

require('aviator');



},{"./libs/requester":7,"aviator":"aviator","bootstrapSass":"bootstrapSass","eventEmitter":"eventEmitter","flux":80,"jquery":"jquery","jquery.autosize":"jquery.autosize","jquery.fileupload":"jquery.fileupload","jquery.role":"jquery.role","jquery.ui.core":"jquery.ui.core","jquery.ui.draggable":"jquery.ui.draggable","jquery.ui.droppable":"jquery.ui.droppable","jquery.ui.mouse":"jquery.ui.mouse","jquery.ui.sortable":"jquery.ui.sortable","jquery.ui.widget":"jquery.ui.widget","lodash":"lodash","react":"react","react-mixin-manager":"react-mixin-manager","reactUjs":"reactUjs","typeahead":"typeahead"}],7:[function(require,module,exports){
var Requester,
  __bind = function(fn, me){ return function(){ return fn.apply(me, arguments); }; };

Requester = (function() {
  function Requester(_arg) {
    var eb;
    eb = _arg.eb;
    this.request = __bind(this.request, this);
    this.start = false;
    this.eb = eb;
    eb.on('start', (function(_this) {
      return function() {
        _this.start = true;
        return console.log('Requester started');
      };
    })(this));
  }

  Requester.prototype.request = function(options) {
    if (this.start) {
      return $.ajax(options);
    } else {
      return this.eb.on('start', function() {
        return $.ajax(options);
      });
    }
  };

  return Requester;

})();

module.exports = Requester;



},{}],8:[function(require,module,exports){
window.gon = {
  fallback_product_thumb_url: 'assets/product-none.png',
  root_url: localStorage.getItem('root_url') || '',
  api_root_url: localStorage.getItem('api_root_url') || '',
  thumbor_url: null
};



},{}],9:[function(require,module,exports){
if (!gon.root_url) {
  if (typeof console.debug === "function") {
    console.debug('Используем локальные пути');
  }
  Routes.operator_product_edit_url = function(id) {
    return 'modal-edit-product.html';
  };
  Routes.products_by_category_url = function(id) {
    return '_products.html';
  };
}



},{}],10:[function(require,module,exports){
window.OperatorCategoriesServerActions = {
  receiveCategories: function(categories) {
    return OperatorCategoriesDispatcher.handleServerAction({
      type: 'categoriesLoaded',
      categories: categories
    });
  },
  reorderCategories: function(newPositions) {
    return OperatorCategoriesDispatcher.handleServerAction({
      type: 'categoriesReordered',
      newPositions: newPositions
    });
  },
  receiveCategory: function(category) {
    return OperatorCategoriesDispatcher.handleServerAction({
      type: 'categoryLoaded',
      category: category
    });
  },
  createCategory: function(category) {
    return OperatorCategoriesDispatcher.handleServerAction({
      type: 'categoryCreated',
      category: category
    });
  },
  updateCategory: function(category) {
    return OperatorCategoriesDispatcher.handleServerAction({
      type: 'categoryUpdated',
      category: category
    });
  },
  deleteCategory: function(category) {
    return OperatorCategoriesDispatcher.handleServerAction({
      type: 'categoryDeleted',
      category: category
    });
  }
};



},{}],11:[function(require,module,exports){
window.OperatorProductsServerActions = {
  receiveProducts: function(categoryId, products) {
    return OperatorProductsDispatcher.handleServerAction({
      type: 'productsLoaded',
      categoryId: categoryId,
      products: products
    });
  },
  receiveMoreProducts: function(categoryId, products) {
    return OperatorProductsDispatcher.handleServerAction({
      type: 'moreProductsLoaded',
      categoryId: categoryId,
      products: products
    });
  },
  updateProduct: function(_arg) {
    var categoryId, product;
    categoryId = _arg.categoryId, product = _arg.product;
    return OperatorProductsDispatcher.handleServerAction({
      type: 'productUpdated',
      product: product,
      categoryId: categoryId
    });
  },
  moveProduct: function(_arg) {
    var categoryId, productId;
    categoryId = _arg.categoryId, productId = _arg.productId;
    return OperatorProductsDispatcher.handleServerAction({
      type: 'productMoved',
      categoryId: categoryId,
      productId: productId
    });
  }
};



},{}],12:[function(require,module,exports){
window.OperatorCategoriesViewActions = {
  loadCategories: function(_arg) {
    var data, error, success;
    data = _arg.data, success = _arg.success, error = _arg.error;
    return CategoriesResource.index({
      data: data,
      success: function(categories) {
        OperatorCategoriesServerActions.receiveCategories(categories);
        return typeof success === "function" ? success(categories) : void 0;
      },
      error: function(xhr, status, err) {
        return typeof error === "function" ? error(err || status) : void 0;
      }
    });
  },
  reorderCategories: function(options) {
    return OperatorCategoriesService.reorderCategories(options);
  },
  reloadCategory: function(_arg) {
    var categoryId;
    categoryId = _arg.categoryId;
    return CategoriesResource.get({
      categoryId: categoryId,
      success: function(category) {
        return OperatorCategoriesServerActions.receiveCategory(category);
      }
    });
  },
  createCategory: function(_arg) {
    var error, name, parentId, success;
    name = _arg.name, parentId = _arg.parentId, success = _arg.success, error = _arg.error;
    return CategoriesResource.create({
      data: {
        name: name,
        parent_id: parentId,
        position: OperatorCategoriesStore.getCategoryPosition({
          parent_id: parentId
        })
      },
      success: function(category) {
        OperatorCategoriesServerActions.createCategory(category);
        return typeof success === "function" ? success(category) : void 0;
      },
      error: function(xhr, status, err) {
        return typeof error === "function" ? error(err || status) : void 0;
      }
    });
  },
  updateCategory: function(_arg) {
    var category, error, success;
    category = _arg.category, success = _arg.success, error = _arg.error;
    return CategoriesResource.update({
      categoryId: category.id,
      data: {
        name: category.name,
        position: category.position,
        parent_id: category.parent_id
      },
      success: function(category) {
        OperatorCategoriesServerActions.updateCategory(category);
        return typeof success === "function" ? success(category) : void 0;
      },
      error: function(xhr, status, err) {
        return typeof error === "function" ? error(err || status) : void 0;
      }
    });
  },
  deleteCategory: function(_arg) {
    var category, error;
    category = _arg.category, error = _arg.error;
    return CategoriesResource["delete"]({
      categoryId: category.id,
      success: function(response) {
        OperatorCategoriesServerActions.deleteCategory(category);
        return typeof success === "function" ? success(response) : void 0;
      },
      error: function(xhr, status, err) {
        return typeof error === "function" ? error(err || status) : void 0;
      }
    });
  }
};



},{}],13:[function(require,module,exports){
window.OperatorProductsViewActions = {
  loadProducts: function(options) {
    return OperatorProductsService.loadProducts(options);
  },
  loadMoreProducts: function(options) {
    return OperatorProductsService.loadMoreProducts(options);
  },
  changeProductCategory: function(options) {
    return OperatorProductsService.changeProductCategory(options);
  }
};



},{}],14:[function(require,module,exports){
window.ProductImagesViewActions = {
  preloadImage: function(_arg) {
    var beforeSend, complete, error, file, formData, success;
    file = _arg.file, success = _arg.success, error = _arg.error, beforeSend = _arg.beforeSend, complete = _arg.complete;
    formData = new FormData();
    formData.append('image', file);
    return Requester.request({
      url: ApiRoutes.operator_products_images_url(),
      method: 'POST',
      data: formData,
      contentType: false,
      processData: false,
      beforeSend: beforeSend,
      success: (function(_this) {
        return function(data) {
          return typeof success === "function" ? success(data) : void 0;
        };
      })(this),
      error: (function(_this) {
        return function(data) {
          return typeof error === "function" ? error(data) : void 0;
        };
      })(this),
      complete: complete
    });
  },
  addProductImages: function(_arg) {
    var error, file, files, formData, productId, success, xhr, xhrs, _i, _len;
    files = _arg.files, productId = _arg.productId, success = _arg.success, error = _arg.error;
    if (files.length) {
      xhrs = [];
      for (_i = 0, _len = files.length; _i < _len; _i++) {
        file = files[_i];
        formData = new FormData();
        formData.append('image', file);
        formData.append('product_id', productId);
        xhr = Requester.request({
          url: ApiRoutes.operator_products_images_url(),
          method: 'POST',
          data: formData,
          contentType: false,
          processData: false,
          success: (function(_this) {
            return function(data) {
              return typeof success === "function" ? success(data) : void 0;
            };
          })(this),
          error: (function(_this) {
            return function(data) {
              return typeof error === "function" ? error(data) : void 0;
            };
          })(this)
        });
        xhrs.push(xhr);
      }
    }
    return $.when.apply($, xhrs).done(function() {
      return ProductsResource.get({
        productId: productId,
        success: function(product) {
          return OperatorProductsServerActions.updateProduct({
            product: product,
            categoryId: product.category_id
          });
        }
      });
    });
  }
};



},{}],15:[function(require,module,exports){

/** @jsx React.DOM */
window.ImagesForm_Thumbs = React.createClass({displayName: 'ImagesForm_Thumbs',
  propTypes: {
    images: React.PropTypes.array.isRequired,
    onRemove: React.PropTypes.func.isRequired
  },
  render: function() {
    var images, that;
    if (this.props.images.length === 0) {
      return null;
    }
    images = [];
    console.log('images', this.props.images);
    that = this;
    $.each(this.props.images, function(idx, image) {
      var onClick;
      onClick = function() {
        return that.props.onRemove(image);
      };
      return images.push(React.DOM.div({key: image.src, className: "products__new-form-image-thumb-block"}, 
         React.DOM.img({className: "products__new-form-image-thumb", src: image.src}), 
         React.DOM.div({className: "products__new-form-image-thumb-remove", onClick: onClick, ref: "remove"}), 
         React.DOM.div({className: "products__new-form-image-thumb-update", onClick: onClick, ref: "update"})
       ));
    });
    return React.DOM.div({className: "products__new-form-images-list"}, images);
  }
});



},{}],16:[function(require,module,exports){

/** @jsx React.DOM */
window.Money = React.createClass({displayName: 'Money',
  propTypes: {
    money: React.PropTypes.object
  },
  render: function() {
    if (this.props.money) {
      return React.DOM.span({className: "nobr"}, 
         (this.props.money.cents / 100).toLocaleString('ru-RU'), " руб."
       );
    } else {
      return React.DOM.span({className: "nobr"}, "---");
    }
  }
});



},{}],17:[function(require,module,exports){

/** @jsx React.DOM */
window.Spinner = React.createClass({displayName: 'Spinner',
  propTypes: {
    align: React.PropTypes.oneOf([null, 'center']),
    className: React.PropTypes.string
  },
  render: function() {
    var spinner, spinnerClasses;
    spinnerClasses = ['fa', 'fa-spinner', 'fa-spin'];
    if (this.props.className) {
      spinnerClasses.push(this.props.className);
    }
    if (this.props.align === 'center') {
      spinner = React.DOM.div({className: "text-center"}, 
                   React.DOM.i({className:  spinnerClasses.join(' ') })
                 );
    } else {
      spinner = React.DOM.i({className:  spinnerClasses.join(' ') });
    }
    return spinner;
  }
});



},{}],18:[function(require,module,exports){

/** @jsx React.DOM */
window.SuperSelect = React.createClass({displayName: 'SuperSelect',
  propTypes: {
    name: React.PropTypes.string.isRequired,
    options: React.PropTypes.array.isRequired,
    value: React.PropTypes.string,
    placeholder: React.PropTypes.string
  },
  getInitialState: function() {
    return {
      value: this.props.value,
      inFocus: false
    };
  },
  getDefaultProps: function() {
    return {
      placeholder: 'Новая категория',
      typeaheadOptions: {
        minLength: 0,
        hint: true,
        highlight: true
      }
    };
  },
  componentDidMount: function() {
    var node;
    node = $(this.refs.input.getDOMNode());
    return node.typeahead(this.props.typeaheadOptions, {
      name: 'categories',
      displayKey: 'name',
      source: this.substringMatcher
    });
  },
  componentWillUnmount: function() {
    return this.$input().typeahead('destroy');
  },
  render: function() {
    var closeButton, placeholder;
    if (this.showCloseButton()) {
      closeButton = this.closeButton();
    }
    if (!this.state.inFocus) {
      placeholder = this.props.placeholder;
    }
    console.log('render value', this.state.value);
    return React.DOM.div({className: "form-group login__form-group--icon-right"}, 
        React.DOM.input({ref: "input", 
               onFocus:  this.onFocus, 
               onBlur:  this.onBlur, 
               name: this.props.name, 
               value: this.state.value, 
               className: "form-control", 
               onChange: this.change, 
               placeholder: placeholder, 
               type: "text"}), 
        closeButton 
    );
  },
  onFocus: function() {
    this.setState({
      inFocus: true
    });
    return this.$input().typeahead('open');
  },
  onBlur: function() {
    return this.setState({
      inFocus: false
    });
  },
  substringMatcher: function(q, cb) {
    var matches, substrRegex;
    matches = [];
    substrRegex = new RegExp(q, 'i');
    $.each(this.props.options, function(i, str) {
      return matches.push({
        name: str
      });
    });
    return cb(matches);
  },
  $input: function() {
    return $(this.refs.input.getDOMNode());
  },
  change: function(e) {
    this.setState({
      value: this.$input().val()
    });
    return e;
  },
  showCloseButton: function() {
    var _ref, _ref1;
    return (_ref = ((_ref1 = this.state.value) != null ? _ref1.length : void 0) > 0) != null ? _ref : {
      "true": false
    };
  },
  closeButton: function() {
    return React.DOM.a({className: "login__form-input-btn--right", onClick: this.clear}, "×");
  },
  clear: function() {
    this.setState({
      value: ''
    });
    return this.$input().typeahead('val', '');
  }
});



},{}],19:[function(require,module,exports){

/** @jsx React.DOM */
var LOADED_STATE, LOADING_STATE;

LOADING_STATE = 'loading';

LOADED_STATE = 'loaded';

window.ModalComponent = React.createClass({displayName: 'ModalComponent',
  mixins: [UnmountMixin],
  propTypes: {
    url: React.PropTypes.string.isRequired
  },
  getInitialState: function() {
    return {
      currentState: LOADING_STATE,
      content: ''
    };
  },
  componentDidMount: function() {
    var $modal;
    $modal = $(this.getDOMNode());
    this.loadUrl();
    $modal.modal('show');
    return $modal.on('hidden.bs.modal', this.unmount);
  },
  componentWillUnmount: function() {
    var $modal;
    $modal = $(this.getDOMNode());
    return $modal.off('hidden.bs.modal', this.unmount);
  },
  render: function() {
    var spinner;
    if (this.isLoadingState()) {
      spinner = React.DOM.div({className: "modal-body"}, 
                   React.DOM.div({className: "text-center"}, 
                     Spinner({className: "fa-5x"})
                   )
                 );
    }
    return React.DOM.div({className: "modal fade", 
                 'aria-hidden': "true", 
                 tabIndex: "-1"}, 
              React.DOM.div({className: "modal-dialog modal-lg"}, 
                React.DOM.div({className: "modal-content"}, 
                  spinner, 
                  React.DOM.div({dangerouslySetInnerHTML: { __html: this.state.content}})
                )
              )
            );
  },
  isLoadingState: function() {
    return this.state.currentState === LOADING_STATE;
  },
  activateLoadedState: function() {
    return this.setState({
      currentState: LOADED_STATE
    });
  },
  loadUrl: function() {
    return Requester.request({
      url: this.props.url,
      success: (function(_this) {
        return function(content) {
          $(document).trigger('page:change');
          return _this.setState({
            content: content,
            currentState: LOADED_STATE
          });
        };
      })(this)
    });
  }
});



},{}],20:[function(require,module,exports){

/** @jsx React.DOM */
var CREATE_STATE, ERROR_MESSAGE, ERROR_STATE, INPUT_STATE, PLACEHOLDER;

PLACEHOLDER = 'Новая категория';

ERROR_MESSAGE = 'Ошибка создания категории.';

INPUT_STATE = 'input';

CREATE_STATE = 'create';

ERROR_STATE = 'error';

window.OperatorCategories_CreateForm = React.createClass({displayName: 'OperatorCategories_CreateForm',
  propTypes: {
    parentCategory: React.PropTypes.object
  },
  getInitialState: function() {
    return {
      currentState: INPUT_STATE,
      categoryName: ''
    };
  },
  render: function() {
    var form;
    switch (this.state.currentState) {
      case INPUT_STATE:
        form = React.DOM.div({className: "adm-categories-item __edit"}, 
                  React.DOM.input({
                      ref: "input", 
                      type: "text", 
                      className: "adm-categories-item-field", 
                      placeholder: PLACEHOLDER, 
                      onKeyDown:  this.handleKeyDown, 
                      onBlur:  this.restoreDefaultsAndBlur})
                );
        break;
      case CREATE_STATE:
        form = React.DOM.div({className: "adm-categories-item"}, 
                  React.DOM.span({className: "adm-categories-item-name text-muted"}, 
                     this.state.categoryName
                  ), 
                  React.DOM.span({className: "adm-categories-item-name"}, 
                    Spinner(null)
                  )
                );
        break;
      case ERROR_STATE:
        form = React.DOM.div(null, ERROR_MESSAGE );
        break;
      default:
        console.warn('Unknown currentState of OperatorCategories_CreateForm component', this.state.currentState);
    }
    return form;
  },
  activateErrorState: function() {
    return this.setState({
      currentState: ERROR_STATE
    });
  },
  createCategory: function() {
    var categoryName, inputNode, parentId;
    inputNode = this.refs.input.getDOMNode();
    categoryName = inputNode.value;
    parentId = this.props.parentCategory ? this.props.parentCategory.id : null;
    this.setState({
      currentState: CREATE_STATE,
      categoryName: categoryName
    });
    return OperatorCategoriesViewActions.createCategory({
      name: categoryName,
      parentId: parentId,
      success: this.restoreDefaults,
      error: this.activateErrorState
    });
  },
  restoreDefaults: function() {
    return this.setState(this.getInitialState());
  },
  restoreDefaultsAndBlur: function() {
    var inputNode;
    inputNode = this.refs.input.getDOMNode();
    inputNode.value = '';
    inputNode.blur();
    return this.restoreDefaults();
  },
  handleKeyDown: function(e) {
    switch (e.key) {
      case 'Enter':
        e.preventDefault();
        return this.createCategory();
      case 'Escape':
        e.preventDefault();
        return this.restoreDefaultsAndBlur();
    }
  }
});



},{}],21:[function(require,module,exports){

/** @jsx React.DOM */
window.OperatorCategories_ListItem = React.createClass({displayName: 'OperatorCategories_ListItem',
  propTypes: {
    category: React.PropTypes.object.isRequired,
    onEditStart: React.PropTypes.func.isRequired
  },
  render: function() {
    return React.DOM.span(null, 
      React.DOM.span(null, 
        React.DOM.span({className: "adm-categories-item-name"}, 
           this.props.category.name
        ), 
        React.DOM.span({className: "adm-categories-item-counter"}, 
           this.props.category.deep_products_count
        )
      ), 
      React.DOM.button({
          className: "adm-btn-edit-category", 
          title: "Редактировать", 
          onClick:  this.props.onEditStart}, 
        React.DOM.span(null, "Редактировать")
      )
    );
  }
});



},{}],22:[function(require,module,exports){

/** @jsx React.DOM */
var ERROR_MESSAGE, ERROR_STATE, INPUT_STATE, UPDATE_STATE;

ERROR_MESSAGE = 'Ошибка обновления категории.';

INPUT_STATE = 'input';

UPDATE_STATE = 'update';

ERROR_STATE = 'error';

window.OperatorCategories_ListItemEdit = React.createClass({displayName: 'OperatorCategories_ListItemEdit',
  propTypes: {
    category: React.PropTypes.object.isRequired,
    onEditFinish: React.PropTypes.func.isRequired
  },
  getInitialState: function() {
    return {
      currentState: INPUT_STATE,
      categoryName: this.props.category.name
    };
  },
  componentDidMount: function() {
    var inputNode;
    inputNode = this.refs.input.getDOMNode();
    return AppHelpers.reselectAndFocus(inputNode);
  },
  render: function() {
    var form;
    switch (this.state.currentState) {
      case INPUT_STATE:
        form = React.DOM.span(null, 
                  React.DOM.input({
                      ref: "input", 
                      type: "text", 
                      className: "adm-categories-item-field", 
                      defaultValue:  this.state.categoryName, 
                      onKeyDown:  this.handleKeydown, 
                      onClick:  this.handleClick, 
                      onBlur:  this.props.onEditFinish}), 
                  React.DOM.span({
                      className: "adm-categories-item-remove", 
                      onClick:  this.handleDeleteClick})
                );
        break;
      case UPDATE_STATE:
        form = React.DOM.span(null, 
                  React.DOM.span({className: "adm-categories-item-name text-muted"}, 
                     this.state.categoryName
                  ), 
                  React.DOM.span({className: "adm-categories-item-name"}, 
                    Spinner(null)
                  )
                );
        break;
      case ERROR_STATE:
        form = React.DOM.span(null, 
                  "   ", 
                  React.DOM.i(null, ERROR_MESSAGE )
                );
        break;
      default:
        console.warn('Unknown currentState of OperatorCategories_ListItemEdit component', this.state.currentState);
    }
    return form;
  },
  activateErrorState: function() {
    return this.setState({
      currentState: ERROR_STATE
    });
  },
  editCategory: function() {
    var categoryName, inputNode, updatedCategory;
    inputNode = this.refs.input.getDOMNode();
    categoryName = inputNode.value;
    this.setState({
      currentState: UPDATE_STATE,
      categoryName: categoryName
    });
    updatedCategory = _.clone(this.props.category);
    updatedCategory.name = categoryName;
    return OperatorCategoriesViewActions.updateCategory({
      category: updatedCategory,
      success: this.props.onEditFinish,
      error: this.activateErrorState
    });
  },
  handleDeleteClick: function() {
    if (window.confirm("Удалить категорию \"" + this.props.category.name + "\"?")) {
      return OperatorCategoriesViewActions.deleteCategory({
        category: this.props.category,
        error: this.activateErrorState
      });
    }
  },
  handleClick: function(e) {
    return e.stopPropagation();
  },
  handleKeydown: function(e) {
    switch (e.key) {
      case 'Enter':
        e.preventDefault();
        return this.editCategory();
      case 'Escape':
        e.preventDefault();
        return this.props.onEditFinish();
    }
  }
});



},{}],23:[function(require,module,exports){

/** @jsx React.DOM */
var EDIT_STATE, SWITCH_CATEGORY_TIMEOUT, VIEW_STATE;

SWITCH_CATEGORY_TIMEOUT = 200;

VIEW_STATE = 'view';

EDIT_STATE = 'edit';

window.OperatorCategories_ListItemManager = React.createClass({displayName: 'OperatorCategories_ListItemManager',
  mixins: [CategoryDroppable],
  propTypes: {
    category: React.PropTypes.object.isRequired,
    isActive: React.PropTypes.bool.isRequired,
    onCategorySelect: React.PropTypes.func.isRequired
  },
  getInitialState: function() {
    return _.extend({}, this.getStateFromStore(), {
      currentState: VIEW_STATE
    });
  },
  componentDidMount: function() {
    return DragStateStore.addChangeListener(this._onStoreChange);
  },
  componentWillUnmount: function() {
    return DragStateStore.removeChangeListener(this._onStoreChange);
  },
  render: function() {
    var item, managerClasses;
    item = this.getItem();
    managerClasses = React.addons.classSet({
      'adm-categories-item': true,
      'selected': this.props.isActive,
      '__edit': this.isEditState(),
      '__droptarget-active': this.isDropTarget()
    });
    return React.DOM.div({className: managerClasses, 
                 'data-objectid':  this.props.category.id, 
                 onClick:  this.handleItemClick, 
                 onMouseEnter:  this.handleMouseEnter, 
                 onMouseLeave:  this.handleMouseLeave}, 
              item 
            );
  },
  isEditState: function() {
    return this.state.currentState === EDIT_STATE;
  },
  isDropTarget: function() {
    return this.state.isDroppable && !this.props.isActive;
  },
  activateViewState: function() {
    return this.setState({
      currentState: VIEW_STATE
    });
  },
  activateEditState: function() {
    return this.setState({
      currentState: EDIT_STATE
    });
  },
  getItem: function() {
    var item;
    switch (this.state.currentState) {
      case VIEW_STATE:
        item = OperatorCategories_ListItem({
                    category:  this.props.category, 
                    onEditStart:  this.handleEditStart});
        break;
      case EDIT_STATE:
        item = OperatorCategories_ListItemEdit({
                    category:  this.props.category, 
                    onEditFinish:  this.activateViewState});
    }
    return item;
  },
  handleEditStart: function(e) {
    e.stopPropagation();
    e.preventDefault();
    return this.activateEditState();
  },
  handleItemClick: function() {
    return this.props.onCategorySelect({
      category: this.props.category,
      includeSubcategories: true
    });
  },
  handleMouseEnter: function() {
    if (this.isDropTarget()) {
      return this.timeout = setTimeout(((function(_this) {
        return function() {
          return _this.props.onCategorySelect({
            category: _this.props.category,
            includeSubcategories: true
          });
        };
      })(this)), SWITCH_CATEGORY_TIMEOUT);
    }
  },
  handleMouseLeave: function() {
    if (this.timeout) {
      return clearTimeout(this.timeout);
    }
  },
  getStateFromStore: function() {
    return {
      isDroppable: DragStateStore.isDragged()
    };
  },
  _onStoreChange: function() {
    return this.setState(this.getStateFromStore());
  }
});



},{}],24:[function(require,module,exports){

/** @jsx React.DOM */
var TITLE;

TITLE = 'Все товары';

window.OperatorCategories_ListItemWithSubcategories = React.createClass({displayName: 'OperatorCategories_ListItemWithSubcategories',
  propTypes: {
    category: React.PropTypes.object.isRequired,
    isActive: React.PropTypes.bool.isRequired,
    onCategorySelect: React.PropTypes.func.isRequired
  },
  render: function() {
    var itemClasses, totalCount;
    totalCount = this.props.category.deep_products_count;
    itemClasses = React.addons.classSet({
      'adm-categories-item': true,
      'selected': this.props.isActive
    });
    return React.DOM.div({className: itemClasses, 
                 onClick:  this.handleClick}, 
              React.DOM.span({className: "adm-categories-item-name"}, 
                TITLE 
              ), 
              React.DOM.span({className: "adm-categories-item-counter"}, 
                totalCount 
              )
            );
  },
  handleClick: function() {
    return this.props.onCategorySelect({
      category: this.props.category,
      includeSubcategories: true
    });
  }
});



},{}],25:[function(require,module,exports){

/** @jsx React.DOM */
var TITLE;

TITLE = 'Без категории';

window.OperatorCategories_ListItemWithoutCategory = React.createClass({displayName: 'OperatorCategories_ListItemWithoutCategory',
  propTypes: {
    category: React.PropTypes.object.isRequired,
    isActive: React.PropTypes.bool.isRequired,
    onCategorySelect: React.PropTypes.func.isRequired
  },
  render: function() {
    var itemClasses, totalCount;
    totalCount = this.props.category.products_count;
    itemClasses = React.addons.classSet({
      'adm-categories-item': true,
      '__muted': true,
      'selected': this.props.isActive
    });
    return React.DOM.div({className: itemClasses, 
                 onClick:  this.handleClick}, 
              React.DOM.span({className: "adm-categories-item-name"}, 
                TITLE 
              ), 
              React.DOM.span({className: "adm-categories-item-counter"}, 
                totalCount 
              )
            );
  },
  handleClick: function() {
    return this.props.onCategorySelect({
      category: this.props.category,
      includeSubcategories: false
    });
  }
});



},{}],26:[function(require,module,exports){

/** @jsx React.DOM */
var DRAG_DELAY, DRAG_REVERT;

DRAG_DELAY = 100;

DRAG_REVERT = 100;

window.OperatorCategories_List = React.createClass({displayName: 'OperatorCategories_List',
  propTypes: {
    parentCategory: React.PropTypes.object,
    currentCategory: React.PropTypes.object,
    includeSubcategories: React.PropTypes.bool,
    onCategorySelect: React.PropTypes.func.isRequired
  },
  getInitialState: function() {
    return {
      parentCategory: this.props.parentCategory,
      categoriesToShow: OperatorCategoriesStore.getSortedCategoriesByParent(this.props.parentCategory)
    };
  },
  componentDidMount: function() {
    OperatorCategoriesStore.addChangeListener(this._onStoreChange);
    return $(this.refs.list.getDOMNode()).sortable({
      scope: 'categoriesReorder',
      placeholder: 'adm-categories-item __dropzone',
      forcePlaceholderSize: true,
      revert: DRAG_REVERT,
      delay: DRAG_DELAY,
      stop: this.handleDrop
    });
  },
  componentWillReceiveProps: function(nextProps) {
    return this.setState({
      parentCategory: nextProps.parentCategory,
      categoriesToShow: OperatorCategoriesStore.getSortedCategoriesByParent(nextProps.parentCategory)
    });
  },
  componentWillUnmount: function() {
    return OperatorCategoriesStore.removeChangeListener(this._onStoreChange);
  },
  render: function() {
    var categories, that;
    that = this;
    categories = this.state.categoriesToShow.map(function(category) {
      return OperatorCategories_ListItemManager({
           category: category, 
           isActive:  that._isCategoryActive(category), 
           onCategorySelect:  that.props.onCategorySelect, 
           key:  category.id});
    });
    return React.DOM.div({className: "adm-categories-list"}, 

              OperatorCategories_ListItemWithSubcategories({
                  category:  this.props.parentCategory, 
                  isActive:  this.props.currentCategory.id == this.props.parentCategory.id &&
                             this.props.includeSubcategories == true, 
                  onCategorySelect:  this.props.onCategorySelect}), 

              React.DOM.span({ref: "list"}, categories ), 

              OperatorCategories_ListItemWithoutCategory({
                  category:  this.props.parentCategory, 
                  isActive:  this.props.currentCategory.id == this.props.parentCategory.id &&
                             this.props.includeSubcategories == false, 
                  onCategorySelect:  this.props.onCategorySelect}), 

              OperatorCategories_CreateForm({parentCategory:  this.props.parentCategory})
            );
  },
  _isCategoryActive: function(category) {
    var currentCategory;
    currentCategory = this.props.currentCategory;
    if (currentCategory && !(this.state.parentCategory && this.state.parentCategory.id === currentCategory.id)) {
      return (category.id === currentCategory.id) || (category.id === currentCategory.parent_id);
    } else {
      return false;
    }
  },
  handleDrop: function(evt, ui) {
    var insertIdx, srcId;
    srcId = parseInt(ui.item.attr('data-objectid'));
    insertIdx = ui.item.index();
    $(this.refs.list.getDOMNode()).sortable('cancel');
    return OperatorCategoriesViewActions.reorderCategories({
      categoryId: srcId,
      insertIdx: insertIdx
    });
  },
  handleTotalCountClick: function(e) {
    e.preventDefault();
    return this.props.onCategorySelect(this.props.parentCategory);
  },
  _onStoreChange: function() {
    return this.setState({
      categoriesToShow: OperatorCategoriesStore.getSortedCategoriesByParent(this.state.parentCategory)
    });
  }
});



},{}],27:[function(require,module,exports){

/** @jsx React.DOM */
window.OperatorCategories_Loaded = React.createClass({displayName: 'OperatorCategories_Loaded',
  propTypes: {
    parentCategory: React.PropTypes.object.isRequired,
    currentCategory: React.PropTypes.object.isRequired,
    productsFilter: React.PropTypes.object,
    includeSubcategories: React.PropTypes.bool.isRequired,
    onCategorySelect: React.PropTypes.func.isRequired
  },
  render: function() {
    var categoriesContent, currentCategory, currentCategoryLevel;
    currentCategory = this.props.currentCategory;
    currentCategoryLevel = OperatorCategoriesStore.getCategoryLevel(currentCategory);
    if (currentCategoryLevel === 0) {
      categoriesContent = OperatorCategories_OneCategory({
                               parentCategory:  this.props.parentCategory, 
                               currentCategory: currentCategory, 
                               productsFilter:  this.props.productsFilter, 
                               includeSubcategories:  this.props.includeSubcategories, 
                               onCategorySelect:  this.props.onCategorySelect});
    } else {
      categoriesContent = OperatorCategories_TwoCategories({
                               parentCategory:  this.props.parentCategory, 
                               currentCategory: currentCategory, 
                               productsFilter:  this.props.productsFilter, 
                               includeSubcategories:  this.props.includeSubcategories, 
                               onCategorySelect:  this.props.onCategorySelect});
    }
    categoriesContent;
    return React.DOM.div({className: "adm-categories-grid"}, 
              categoriesContent, 
              React.DOM.div({className: "adm-categories-grid-col __wide"}, 
                OperatorProducts({
                    categoryId:  this.props.currentCategory.id, 
                    productsFilter:  this.props.productsFilter, 
                    includeSubcategories:  this.props.includeSubcategories})
              )
            );
  }
});



},{}],28:[function(require,module,exports){

/** @jsx React.DOM */
window.OperatorCategories_Loading = React.createClass({displayName: 'OperatorCategories_Loading',
  render: function() {
    return React.DOM.div({className: "adm-categories-grid"}, 
      React.DOM.div({className: "adm-categories-grid-col"}, 
        React.DOM.br(null), 
        Spinner({
            className: "fa-3x", 
            align: "center"})
      )
    );
  }
});



},{}],29:[function(require,module,exports){

/** @jsx React.DOM */
window.OperatorCategories_LoadingError = React.createClass({displayName: 'OperatorCategories_LoadingError',
  render: function() {
    return React.DOM.div({className: "adm-categories-grid"}, 
      React.DOM.div({className: "adm-categories-grid-col"}, 
        "При загрузке категорий возникла ошибка."
      )
    );
  }
});



},{}],30:[function(require,module,exports){

/** @jsx React.DOM */
window.OperatorCategories_OneCategory = React.createClass({displayName: 'OperatorCategories_OneCategory',
  propTypes: {
    parentCategory: React.PropTypes.object.isRequired,
    currentCategory: React.PropTypes.object.isRequired,
    includeSubcategories: React.PropTypes.bool.isRequired,
    onCategorySelect: React.PropTypes.func.isRequired
  },
  render: function() {
    return React.DOM.div({className: "adm-categories-grid-col"}, 
      OperatorCategories_List({
          parentCategory:  this.props.parentCategory, 
          currentCategory:  this.props.currentCategory, 
          productsFilter:  this.props.productsFilter, 
          includeSubcategories:  this.props.includeSubcategories, 
          onCategorySelect:  this.props.onCategorySelect})
    );
  }
});



},{}],31:[function(require,module,exports){

/** @jsx React.DOM */
var ERROR_STATE, LOADED_STATE, LOADING_STATE;

LOADING_STATE = 'loading';

LOADED_STATE = 'loaded';

ERROR_STATE = 'error';

window.OperatorCategories = React.createClass({displayName: 'OperatorCategories',
  propTypes: {
    productsFilter: React.PropTypes.object,
    categoryId: React.PropTypes.number
  },
  getInitialState: function() {
    return {
      currentState: LOADING_STATE,
      currentCategory: null,
      rootCategory: null,
      includeSubcategories: true
    };
  },
  componentDidMount: function() {
    OperatorCategoriesViewActions.loadCategories({
      data: {
        filter: this.props.productsFilter
      },
      success: this.activateLoadedState,
      error: this.activateErrorState
    });
    return OperatorCategoriesStore.addChangeListener(this._onStoreChange);
  },
  componentWillUnmount: function() {
    return OperatorCategoriesStore.removeChangeListener(this._onStoreChange);
  },
  render: function() {
    var categoriesContent;
    switch (this.state.currentState) {
      case LOADED_STATE:
        categoriesContent = OperatorCategories_Loaded({
                                 parentCategory:  this.state.rootCategory, 
                                 currentCategory:  this.state.currentCategory, 
                                 productsFilter:  this.props.productsFilter, 
                                 includeSubcategories:  this.state.includeSubcategories, 
                                 onCategorySelect:  this.handleCategorySelect});
        break;
      case LOADING_STATE:
        categoriesContent = OperatorCategories_Loading(null);
        break;
      case ERROR_STATE:
        categoriesContent = OperatorCategories_LoadingError(null);
        break;
      default:
        console.warn('Unknown currentState of OperatorCategories component', this.state.currentState);
    }
    return categoriesContent;
  },
  activateLoadedState: function() {
    return this.setState({
      currentState: LOADED_STATE
    });
  },
  activateErrorState: function() {
    return this.setState({
      currentState: ERROR_STATE
    });
  },
  handleCategorySelect: function(_arg) {
    var category, includeSubcategories;
    category = _arg.category, includeSubcategories = _arg.includeSubcategories;
    this.setState({
      currentCategory: category,
      includeSubcategories: includeSubcategories
    });
    Aviator.navigate('', {
      queryParams: {
        category_id: category.id
      }
    });
    return DragStateDispatcher.handleViewAction({
      type: 'currentCategoryChanged'
    });
  },
  _onStoreChange: function() {
    var currentCategory, rootCategory;
    rootCategory = OperatorCategoriesStore.getRootCategory();
    if (OperatorCategoriesStore.getCategoryById(this.props.categoryId)) {
      currentCategory = OperatorCategoriesStore.getCategoryById(this.props.categoryId);
    } else {
      if (OperatorCategoriesStore.isCategoryExists(this.state.currentCategory)) {
        currentCategory = this.state.currentCategory;
      } else if (this.state.currentCategory && this.state.currentCategory.parent_id) {
        currentCategory = OperatorCategoriesStore.getCategoryById(this.state.currentCategory.parent_id);
      } else {
        currentCategory = rootCategory;
      }
    }
    return this.setState({
      currentCategory: currentCategory,
      rootCategory: rootCategory
    });
  }
});



},{}],32:[function(require,module,exports){

/** @jsx React.DOM */
window.OperatorCategories_TwoCategories = React.createClass({displayName: 'OperatorCategories_TwoCategories',
  propTypes: {
    parentCategory: React.PropTypes.object.isRequired,
    currentCategory: React.PropTypes.object.isRequired,
    includeSubcategories: React.PropTypes.bool.isRequired,
    onCategorySelect: React.PropTypes.func.isRequired
  },
  render: function() {
    var currentCategory, currentCategoryLevel, secondCategory;
    currentCategory = this.props.currentCategory;
    currentCategoryLevel = OperatorCategoriesStore.getCategoryLevel(currentCategory);
    secondCategory = (function() {
      switch (false) {
        case currentCategoryLevel !== 1:
          return currentCategory;
        default:
          return OperatorCategoriesStore.getCategoryById(currentCategory.parent_id);
      }
    })();
    return React.DOM.span(null, 
              React.DOM.div({className: "adm-categories-grid-col"}, 
                OperatorCategories_List({
                    parentCategory:  this.props.parentCategory, 
                    currentCategory:  this.props.currentCategory, 
                    includeSubcategories:  this.props.includeSubcategories, 
                    onCategorySelect:  this.props.onCategorySelect})
              ), 
              React.DOM.div({className: "adm-categories-grid-col"}, 
                 OperatorCategories_List({
                     parentCategory: secondCategory, 
                     currentCategory:  this.props.currentCategory, 
                     includeSubcategories:  this.props.includeSubcategories, 
                     onCategorySelect:  this.props.onCategorySelect})
              )
            );
  }
});



},{}],33:[function(require,module,exports){

/** @jsx React.DOM */
var OperatorProducts_AddProductButton, TITLE;

TITLE = 'Добавить новый товар';

OperatorProducts_AddProductButton = React.createClass({displayName: 'OperatorProducts_AddProductButton',
  render: function() {
    return React.DOM.button({
        className: "adm-btn-add-goods", 
        onClick:  this.handleClick}, 
      React.DOM.i({className: "adm-btn-add-goods-icon"}), 
      TITLE 
    );
  },
  handleClick: function() {
    return window.location = Routes.operator_product_new_url();
  }
});

module.exports = OperatorProducts_AddProductButton;



},{}],34:[function(require,module,exports){

/** @jsx React.DOM */
window.OperatorProducts_Empty = React.createClass({displayName: 'OperatorProducts_Empty',
  render: function() {
    return React.DOM.div({className: "adm-categories-content"}, 
      "В данной категории товаров нет."
    );
  }
});



},{}],35:[function(require,module,exports){

/** @jsx React.DOM */
var SELECTED_STATE, UNSELECTED_STATE;

SELECTED_STATE = 'selected';

UNSELECTED_STATE = 'unselected';

window.OperatorProducts_ListItem = React.createClass({displayName: 'OperatorProducts_ListItem',
  mixins: [ProductDraggable],
  propTypes: {
    product: React.PropTypes.object.isRequired
  },
  getInitialState: function() {
    return {
      currentState: UNSELECTED_STATE
    };
  },
  render: function() {
    var productClasses;
    productClasses = React.addons.classSet({
      'adm-categories-goods-item': true,
      '__selected': this.isSelectedState()
    });
    return React.DOM.tr({className: productClasses, 
                'data-category-id':  this.props.product.category_id, 
                'data-product-id':  this.props.product.id, 
                onClick:  this.handleClick, 
                onDrop:  this.handleDrop}, 
              React.DOM.td({className: "adm-categories-goods-cover", 
                  'data-title': "Товар"}, 
                ProductThumb({product:  this.props.product})
              ), 
              React.DOM.td({className: "adm-categories-goods-content"}, 
                React.DOM.span(null,  this.props.product.title), 
                ProductModificationList({modifications:  this.props.product.items})
              ), 
              React.DOM.td({className: "adm-categories-goods-price", 
                  'data-title': "Сумма"}, 
                Money({money:  this.props.product.price}), 
                ProductTotalItemsQuantity({product:  this.props.product})
              ), 
              React.DOM.td({className: "adm-categories-goods-status", 
                  'data-title': "Статус"}, 
                ProductState({state:  this.props.product.state})
              )
            );
  },
  isSelectedState: function() {
    return this.state.currentState === SELECTED_STATE;
  },
  activateSelectedState: function() {
    return this.setState({
      currentState: SELECTED_STATE
    });
  },
  activateUnselectedState: function() {
    return this.setState({
      currentState: UNSELECTED_STATE
    });
  },
  toggleSelectedState: function() {
    if (this.isSelectedState()) {
      this.activateUnselectedState();
      return DragStateDispatcher.handleViewAction({
        type: 'productBecameUnselected',
        product: this.props.product
      });
    } else {
      this.activateSelectedState();
      return DragStateDispatcher.handleViewAction({
        type: 'productBecameSelected',
        product: this.props.product
      });
    }
  },
  handleDrop: function(e) {
    var files;
    e.preventDefault();
    e.stopPropagation();
    files = e.dataTransfer.files;
    return ProductImagesViewActions.addProductImages({
      files: files,
      productId: this.props.product.id
    });
  },
  handleClick: function(e) {
    if (EventHelpers.isAnyServiceKey(e)) {
      return this.toggleSelectedState();
    } else {
      return window.location = Routes.operator_product_edit_url(this.props.product.id);
    }
  }
});



},{}],36:[function(require,module,exports){

/** @jsx React.DOM */
window.OperatorProducts_ListItemDrag = React.createClass({displayName: 'OperatorProducts_ListItemDrag',
  propTypes: {
    product: React.PropTypes.object.isRequired
  },
  render: function() {
    return React.DOM.span({className: "adm-categories-goods-draghelper"}, 
      React.DOM.table(null, 
        React.DOM.tbody(null, 
          React.DOM.tr(null, 
            React.DOM.td({className: "adm-categories-goods-cover", 
                'data-title': "Товар"}, 
              ProductThumb({product:  this.props.product})
            ), 
            React.DOM.td({className: "adm-categories-goods-content"}, 
               this.props.product.title
            )
          )
        )
      ), 
      React.DOM.hr(null), 
      React.DOM.i(null, "Перетащите товар в категорию")
    );
  },
  imageUrl: function() {
    return AppHelpers.productImageUrl(this.props.product);
  }
});



},{}],37:[function(require,module,exports){

/** @jsx React.DOM */
window.OperatorProducts_ListItemsDrag = React.createClass({displayName: 'OperatorProducts_ListItemsDrag',
  propTypes: {
    products: React.PropTypes.array.isRequired
  },
  render: function() {
    var products;
    products = this.props.products.map(function(product) {
      return React.DOM.tr(null, 
        React.DOM.td({className: "adm-categories-goods-cover", 
            'data-title': "Товар"}, 
          ProductThumb({product: product })
        ), 
        React.DOM.td({className: "adm-categories-goods-content"}, 
           product.title
        )
      );
    });
    return React.DOM.span({className: "adm-categories-goods-draghelper"}, 
              React.DOM.table(null, 
                React.DOM.tbody(null, 
                  products 
                )
              ), 
              React.DOM.hr(null), 
              React.DOM.i(null, "Перетащите товары в категорию")
            );
  },
  imageUrl: function() {
    return AppHelpers.productImageUrl(this.props.product);
  }
});



},{}],38:[function(require,module,exports){

/** @jsx React.DOM */
var OperatorProducts_AddProductButton;

OperatorProducts_AddProductButton = require('../buttons/add_product');

window.OperatorProducts_List = React.createClass({displayName: 'OperatorProducts_List',
  propTypes: {
    categoryId: React.PropTypes.number.isRequired
  },
  getInitialState: function() {
    return this.getStateFromStore();
  },
  componentDidMount: function() {
    OperatorProductsStore.addChangeListener(this._onStoreChange);
    return $(window).on('drop dragover', this.handleWindowEvents);
  },
  componentWillUnmount: function() {
    OperatorProductsStore.removeChangeListener(this._onStoreChange);
    return $(window).off('drop dragover', this.handleWindowEvents);
  },
  render: function() {
    var products;
    products = this.state.products.map(function(product) {
      return OperatorProducts_ListItem({
            product: product, 
            key:  product.id});
    });
    return React.DOM.div({className: "adm-categories-content"}, 
              OperatorProducts_AddProductButton(null), 
              React.DOM.table({className: "adm-categories-goods"}, 
                React.DOM.tbody(null, products )
              )
            );
  },
  getStateFromStore: function() {
    return {
      products: OperatorProductsStore.getProducts(this.props.categoryId)
    };
  },
  handleWindowEvents: function(e) {
    return e.preventDefault();
  },
  _onStoreChange: function() {
    return this.setState(this.getStateFromStore());
  }
});



},{"../buttons/add_product":33}],39:[function(require,module,exports){

/** @jsx React.DOM */
window.OperatorProducts_Loading = React.createClass({displayName: 'OperatorProducts_Loading',
  render: function() {
    return React.DOM.div({className: "adm-categories-content"}, 
      Spinner({className: "fa-3x"})
    );
  }
});



},{}],40:[function(require,module,exports){

/** @jsx React.DOM */
window.OperatorProducts_LoadingError = React.createClass({displayName: 'OperatorProducts_LoadingError',
  propTypes: {
    message: React.PropTypes.string.isRequired
  },
  render: function() {
    return React.DOM.div({className: "adm-categories-content"}, 
      "Ошибка загрузки ",  this.props.message, "."
    );
  }
});



},{}],41:[function(require,module,exports){
var THRESHOLD, windowHeight;

windowHeight = $(window).height();

THRESHOLD = windowHeight * 2;

window.LoadMoreProductsMixin = {
  componentDidMount: function() {
    return $(window).on('scroll', this.handleScroll);
  },
  componentWillUnmount: function() {
    return $(window).off('scroll', this.handleScroll);
  },
  handleScroll: function() {
    var isNearBottom;
    if (!this.isLoadingMoreState() && !this.state.isAllProductsLoaded) {
      isNearBottom = $(window).scrollTop() + windowHeight > $(document).height() - THRESHOLD;
      if (isNearBottom) {
        return this.loadMoreProducts();
      }
    }
  }
};



},{}],42:[function(require,module,exports){

/** @jsx React.DOM */
var EMPTY_STATE, ERROR_STATE, LOADED_STATE, LOADING_MORE_STATE, LOADING_STATE;

LOADING_MORE_STATE = 'loadingMoreState';

LOADING_STATE = 'loading';

LOADED_STATE = 'loaded';

EMPTY_STATE = 'empty';

ERROR_STATE = 'error';

window.OperatorProducts = React.createClass({displayName: 'OperatorProducts',
  mixins: [React.addons.PureRenderMixin, LoadMoreProductsMixin],
  propTypes: {
    categoryId: React.PropTypes.number.isRequired,
    productsFilter: React.PropTypes.object,
    includeSubcategories: React.PropTypes.bool.isRequired
  },
  getInitialState: function() {
    return {
      currentState: LOADING_STATE,
      products: null,
      page: 1,
      isAllProductsLoaded: false
    };
  },
  componentDidMount: function() {
    return this.loadProducts(this.props.categoryId, this.props.includeSubcategories);
  },
  componentWillReceiveProps: function(nextProps) {
    if (this.xhr != null) {
      this.xhr.abort();
    }
    if (nextProps.categoryId !== this.props.categoryId) {
      this.setState({
        page: 1,
        isAllProductsLoaded: false
      });
      return this.loadProducts(nextProps.categoryId, nextProps.includeSubcategories);
    }
  },
  componentWillUnmount: function() {
    if (this.xhr != null) {
      this.xhr.abort();
    }
    return this.xhr = null;
  },
  render: function() {
    switch (this.state.currentState) {
      case LOADED_STATE:
        return OperatorProducts_List({
                                        categoryId:  this.props.categoryId});
      case LOADING_STATE:
        return OperatorProducts_Loading(null);
      case LOADING_MORE_STATE:
        return OperatorProducts_List({
                                        categoryId:  this.props.categoryId});
      case EMPTY_STATE:
        return OperatorProducts_Empty(null);
      case ERROR_STATE:
        return OperatorProducts_LoadingError({
                                        message:  this.state.errorMessage});
      default:
        return console.warn('Unknown currentState of OperatorProducts component', this.state.currentState);
    }
  },
  isLoadingMoreState: function() {
    return this.state.currentState === LOADING_MORE_STATE;
  },
  activateErrorState: function() {
    return this.setState({
      currentState: ERROR_STATE
    });
  },
  activateLoadingState: function() {
    return this.setState({
      currentState: LOADING_STATE
    });
  },
  activateLoadingMoreState: function() {
    return this.setState({
      currentState: LOADING_MORE_STATE
    });
  },
  activateLoadedState: function() {
    return this.setState({
      currentState: LOADED_STATE
    });
  },
  loadProducts: function(categoryId, includeSubcategories) {
    this.activateLoadingState();
    return this.xhr = OperatorProductsViewActions.loadProducts({
      data: {
        categoryId: categoryId,
        filter: this.props.productsFilter,
        includeSubcategories: includeSubcategories
      },
      success: (function(_this) {
        return function(response) {
          var currentState;
          currentState = response.total_count === 0 ? EMPTY_STATE : LOADED_STATE;
          return _this.setState({
            currentState: currentState,
            page: response.page,
            isAllProductsLoaded: response.products.length === 0
          });
        };
      })(this),
      error: (function(_this) {
        return function(errMsg) {
          if (errMsg !== 'abort') {
            return _this.setState({
              currentState: ERROR_STATE,
              errorMessage: errMsg
            });
          }
        };
      })(this)
    });
  },
  loadMoreProducts: function() {
    this.activateLoadingMoreState();
    return this.xhr = OperatorProductsViewActions.loadMoreProducts({
      data: {
        categoryId: this.props.categoryId,
        filter: this.props.productsFilter,
        includeSubcategories: this.props.includeSubcategories,
        page: this.state.page + 1
      },
      success: (function(_this) {
        return function(response) {
          return _this.setState({
            currentState: LOADED_STATE,
            page: response.page,
            isAllProductsLoaded: response.products.length === 0
          });
        };
      })(this),
      error: (function(_this) {
        return function(errMsg) {
          if (errMsg !== 'abort') {
            return _this.setState({
              currentState: ERROR_STATE,
              errorMessage: errMsg
            });
          }
        };
      })(this)
    });
  }
});



},{}],43:[function(require,module,exports){

/** @jsx React.DOM */
var LOADED_STATE, LOADING_STATE, ProductImages_Image;

LOADING_STATE = 'loading';

LOADED_STATE = 'loaded';

ProductImages_Image = React.createClass({displayName: 'ProductImages_Image',
  mixins: ['ReactActivitiesUser', ComponentManipulationsMixin],
  propTypes: {
    image: React.PropTypes.object.isRequired,
    fieldName: React.PropTypes.string,
    onImagePreload: React.PropTypes.func.isRequired,
    onImageDelete: React.PropTypes.func.isRequired
  },
  componentDidMount: function() {
    if (this.isLoadingState()) {
      return this.preloadImage();
    }
  },
  getInitialState: function() {
    return {
      currentState: this.props.image.id != null ? LOADED_STATE : LOADING_STATE,
      image: this.props.image
    };
  },
  render: function() {
    var spinner;
    if (this.isLoadingState()) {
      spinner = React.DOM.div({className: "products__new-form-image-thumb-preload"}, 
                   Spinner({className: "fa-2x"})
                 );
    }
    return React.DOM.div({'data-id':  this.props.image.id, 
                 className: "products__new-form-image-thumb-block"}, 
              React.DOM.img({src:  this.state.image.src, 
                   className: "products__new-form-image-thumb"}), 

              spinner, 

              React.DOM.div({className: "products__new-form-image-thumb-remove", 
                   onClick:  this.props.onImageDelete}), 
              React.DOM.div({className: "products__new-form-image-thumb-update", 
                   onClick:  this.handleRotateClick}), 

              React.DOM.input({name:  this.props.fieldName, 
                     value:  this.props.image.id, 
                     type: "hidden"})
            );
  },
  isLoadingState: function() {
    return this.state.currentState === LOADING_STATE;
  },
  activateLoadedState: function() {
    return this.setState({
      currentState: LOADED_STATE
    });
  },
  preloadImage: function() {
    var file, formData;
    file = this.props.image.file;
    if (!file) {
      return console.warn('Missing file object for preloading product image');
    }
    formData = new FormData();
    formData.append('image', file);
    return ProductImagesViewActions.preloadImage({
      file: file,
      beforeSend: (function(_this) {
        return function() {
          return _this.incrementActivities();
        };
      })(this),
      success: (function(_this) {
        return function(data) {
          _this.activateLoadedState();
          return _this.props.onImagePreload({
            id: data.id,
            uuid: _this.props.image.uuid,
            src: data.url
          });
        };
      })(this),
      error: (function(_this) {
        return function(data) {
          return console.warn(data);
        };
      })(this),
      complete: (function(_this) {
        return function() {
          return _this.decrementActivities();
        };
      })(this)
    });
  },
  handleRotateClick: function() {
    return alert('Функция временно не доступна');
  }
});

module.exports = ProductImages_Image;



},{}],44:[function(require,module,exports){

/** @jsx React.DOM */
var ImagesMixin, ProductImages_List, ProductImages_Placeholder;

ProductImages_Placeholder = require('./placeholder');

ProductImages_List = require('./list');

ImagesMixin = require('./mixins/images');

window.ProductImages = React.createClass({displayName: 'ProductImages',
  mixins: ['ReactActivitiesMixin', ImagesMixin],
  propTypes: {
    images: React.PropTypes.array.isRequired,
    fieldName: React.PropTypes.string.isRequired
  },
  getDefaultProps: function() {
    return {
      fieldName: 'product[image_ids][]',
      images: [
        {
          id: 4682,
          src: 'assets/product-1-square.png?1'
        }, {
          id: 4681,
          src: 'assets/product-2-square.png?1'
        }, {
          id: 4680,
          src: 'assets/product-3-square.png?1'
        }
      ]
    };
  },
  getInitialState: function() {
    return {
      images: this.convertRawImages()
    };
  },
  render: function() {
    return React.DOM.div({className: "products__new-form-images-list __small"}, 
      ProductImages_Placeholder({onImagesAdd:  this.pushImages}), 
      ProductImages_List({
          images:  this.state.images, 
          fieldName:  this.props.fieldName, 
          activitiesHandler:  this.activitiesHandler, 
          onImagesReorder:  this.updateImages, 
          onImagePreload:  this.updateImage, 
          onImageDelete:  this.deleteImage})
    );
  }
});



},{"./list":45,"./mixins/images":47,"./placeholder":49}],45:[function(require,module,exports){

/** @jsx React.DOM */
var ProductImageSortableMixin, ProductImages_Image, ProductImages_List;

ProductImages_Image = require('./image');

ProductImageSortableMixin = require('./mixins/sortable');

ProductImages_List = React.createClass({displayName: 'ProductImages_List',
  mixins: [ProductImageSortableMixin],
  propTypes: {
    images: React.PropTypes.array.isRequired,
    fieldName: React.PropTypes.string,
    activitiesHandler: React.PropTypes.object.isRequired,
    onImagePreload: React.PropTypes.func.isRequired,
    onImageDelete: React.PropTypes.func.isRequired
  },
  render: function() {
    var images, that;
    that = this;
    images = this.props.images.sort(function(a, b) {
      return a.position - b.position;
    }).map(function(image) {
      return ProductImages_Image({
             image: image, 
             fieldName:  that.props.fieldName, 
             activitiesHandler:  that.props.activitiesHandler, 
             onImagePreload:  that.props.onImagePreload.bind(null, image), 
             onImageDelete:  that.props.onImageDelete.bind(null, image), 
             key:  image.uuid || image.id});
    });
    return React.DOM.div({ref: "list", 
                 className: "products__new-form-images-list-list"}, 
              images 
            );
  }
});

module.exports = ProductImages_List;



},{"./image":43,"./mixins/sortable":48}],46:[function(require,module,exports){
var ACCEPT_FILE_TYPES, FileUploadMixin, MAX_FILE_SIZE, MAX_NUMBER_OF_FILES;

ACCEPT_FILE_TYPES = /(\.|\/)(gif|jpe?g|png)$/i;

MAX_FILE_SIZE = 10 * 1000 * 1000;

MAX_NUMBER_OF_FILES = 6;

FileUploadMixin = {
  propTypes: {
    onImagesAdd: React.PropTypes.func.isRequired
  },
  componentDidMount: function() {
    var $fileInput;
    $fileInput = $(this.refs.fileInput.getDOMNode());
    $fileInput.on('fileuploadadd', this.addFilesToForm);
    $fileInput.on('fileuploaddrop', this.activateViewState);
    $(window).on('dragover', this.activateDropzoneState);
    $(window).on('dragleave', this.activateViewState);
    return $fileInput.fileupload({
      acceptFileTypes: ACCEPT_FILE_TYPES,
      maxFileSize: MAX_FILE_SIZE,
      maxNumberOfFiles: MAX_NUMBER_OF_FILES,
      singleFileUploads: false,
      autoUpload: false,
      replaceFileInput: false,
      pasteZone: null
    });
  },
  componentWillUnmount: function() {
    var $fileInput;
    $fileInput = $(this.refs.fileInput.getDOMNode());
    $fileInput.off('fileuploadadd', this.addFilesToForm);
    $fileInput.off('fileuploaddrop', this.activateViewState);
    $(window).off('dragover', this.activateDropzoneState);
    return $(window).off('dragleave', this.activateViewState);
  },
  addFilesToForm: function(e, data) {
    var images;
    images = data.files.map(function(file) {
      return {
        id: null,
        uuid: UuidService.generate(),
        src: window.URL.createObjectURL(file),
        file: file
      };
    });
    return this.props.onImagesAdd(images);
  }
};

module.exports = FileUploadMixin;



},{}],47:[function(require,module,exports){
var ImagesMixin;

ImagesMixin = {
  propTypes: {
    images: React.PropTypes.array.isRequired
  },
  componentDidMount: function() {
    return $(window).on('beforeunload', this.handlePageClose);
  },
  componentWillUnmount: function() {
    return $(window).off('beforeunload', this.handlePageClose);
  },
  updateImages: function(imagesData) {
    var imageData, newImage, newImages, _i, _j, _len, _len1;
    newImages = this.state.images.slice(0);
    for (_i = 0, _len = newImages.length; _i < _len; _i++) {
      newImage = newImages[_i];
      for (_j = 0, _len1 = imagesData.length; _j < _len1; _j++) {
        imageData = imagesData[_j];
        if (!(imageData.id === newImage.id)) {
          continue;
        }
        _.extend(newImage, imageData);
        break;
      }
    }
    return this.setState({
      images: newImages
    });
  },
  updateImage: function(oldImage, data) {
    var newImage, newImages, _i, _len;
    newImages = this.state.images.slice(0);
    for (_i = 0, _len = newImages.length; _i < _len; _i++) {
      newImage = newImages[_i];
      if (!(newImage === oldImage)) {
        continue;
      }
      _.extend(newImage, data);
      break;
    }
    return this.setState({
      images: newImages
    });
  },
  pushImages: function(images) {
    var image, lastImagePosition, newImages, _i, _len;
    newImages = this.state.images.slice(0);
    lastImagePosition = 0;
    if (newImages.length) {
      lastImagePosition = newImages[newImages.length - 1].position + 1;
    }
    for (_i = 0, _len = images.length; _i < _len; _i++) {
      image = images[_i];
      _.extend(image, {
        position: ++lastImagePosition
      });
      newImages.push(image);
    }
    return this.setState({
      images: newImages
    });
  },
  deleteImage: function(image) {
    var i, newImage, newImages, _i, _len;
    newImages = this.state.images.slice(0);
    for (i = _i = 0, _len = newImages.length; _i < _len; i = ++_i) {
      newImage = newImages[i];
      if (!(newImage === image)) {
        continue;
      }
      newImages.splice(i, 1);
      break;
    }
    return this.setState({
      images: newImages
    });
  },
  convertRawImages: function() {
    return this.props.images.map(function(image, i) {
      image.position = i;
      return image;
    });
  },
  handlePageClose: function() {
    if (this.hasActivities()) {
      return this.state.activities + ' изображений ещё не загрузилось. Вы уверены, что хотите выйти?';
    }
  }
};

module.exports = ImagesMixin;



},{}],48:[function(require,module,exports){
var DRAG_DELAY, DRAG_REVERT, ProductImageSortableMixin, _getNewPositions;

DRAG_DELAY = 100;

DRAG_REVERT = 100;

_getNewPositions = function(image, insertIndex) {
  var currentPosition, imageToShift, minPosition, newPositions, nextSibling, oldImagesPositions, oldTail, originalIndex, positionDiff, previousSibling, slicePosition, _i, _len;
  originalIndex = image.position;
  if (insertIndex === originalIndex) {
    return [];
  }
  oldImagesPositions = _.reject(this.props.images, function(i) {
    return i === image;
  });
  if (!(insertIndex < 1)) {
    previousSibling = oldImagesPositions[insertIndex - 1];
  }
  if (!(insertIndex > oldImagesPositions.length - 1)) {
    nextSibling = oldImagesPositions[insertIndex];
  }
  if (!previousSibling && !nextSibling) {
    return [
      {
        id: image.id,
        position: 0
      }
    ];
  }
  if (!nextSibling) {
    return [
      {
        id: image.id,
        position: previousSibling.position + 1
      }
    ];
  }
  if (!previousSibling) {
    previousSibling = {
      id: null,
      position: -1
    };
  }
  positionDiff = nextSibling.position - previousSibling.position;
  if (positionDiff > 1) {
    return [
      {
        id: image.id,
        position: previousSibling.position + 1
      }
    ];
  }
  slicePosition = previousSibling.position + 1;
  newPositions = [
    {
      id: image.id,
      position: slicePosition
    }
  ];
  oldTail = oldImagesPositions.slice(insertIndex);
  for (_i = 0, _len = oldTail.length; _i < _len; _i++) {
    imageToShift = oldTail[_i];
    minPosition = slicePosition + 1;
    currentPosition = imageToShift.position;
    if (currentPosition < minPosition) {
      currentPosition = minPosition;
      newPositions.push({
        id: imageToShift.id,
        position: currentPosition
      });
      slicePosition = currentPosition + 1;
    }
  }
  return newPositions;
};

ProductImageSortableMixin = {
  propTypes: {
    images: React.PropTypes.array.isRequired,
    onImagesReorder: React.PropTypes.func.isRequired
  },
  componentDidMount: function() {
    return $(this.getDOMNode()).sortable({
      scope: 'productImagesReorder',
      forcePlaceholderSize: true,
      revert: DRAG_REVERT,
      delay: DRAG_DELAY,
      stop: this.handleDrop
    });
  },
  handleDrop: function(evt, ui) {
    var imageId, insertIndex;
    imageId = parseInt(ui.item.data('id'), 10);
    insertIndex = ui.item.index();
    $(this.getDOMNode()).sortable('cancel');
    return this.reorderImages({
      imageId: imageId,
      insertIndex: insertIndex
    });
  },
  reorderImages: function(_arg) {
    var imageId, insertIndex, newPositions;
    imageId = _arg.imageId, insertIndex = _arg.insertIndex;
    newPositions = this.getReorderedPositions(imageId, insertIndex);
    if (newPositions.length) {
      return this.props.onImagesReorder(newPositions);
    }
  },
  getImageById: function(imageId) {
    var image, _i, _len, _ref;
    _ref = this.props.images;
    for (_i = 0, _len = _ref.length; _i < _len; _i++) {
      image = _ref[_i];
      if (image.id === imageId) {
        return image;
      }
    }
  },
  getReorderedPositions: function(imageId, insertIndex) {
    var image;
    image = this.getImageById(imageId);
    return _getNewPositions.apply(this, [image, insertIndex]);
  }
};

module.exports = ProductImageSortableMixin;



},{}],49:[function(require,module,exports){

/** @jsx React.DOM */
var DROPZONE_STATE, FileUploadMixin, ProductImages_Placeholder, VIEW_STATE;

FileUploadMixin = require('./mixins/file_upload');

VIEW_STATE = 'view';

DROPZONE_STATE = 'dropZone';

ProductImages_Placeholder = React.createClass({displayName: 'ProductImages_Placeholder',
  mixins: [FileUploadMixin],
  getInitialState: function() {
    return {
      currentState: VIEW_STATE
    };
  },
  render: function() {
    var emptyThumbClasses;
    emptyThumbClasses = React.addons.classSet({
      'products__new-form-image-thumb-empty': true,
      '__dropzone': this.isDropzoneState()
    });
    return React.DOM.div({className: "products__new-form-image-thumb-block"}, 
              React.DOM.input({ref: "fileInput", 
                     type: "file", 
                     accept: "image/*", 
                     multiple: true, 
                     id: "image", 
                     className: "form-upload__input products__new-form-image-input"}), 
               React.DOM.div({className: emptyThumbClasses }), 
               React.DOM.div({className: "products__new-form-image-thumb-add"})
             );
  },
  isDropzoneState: function() {
    return this.state.currentState === DROPZONE_STATE;
  },
  activateDropzoneState: function() {
    return this.setState({
      currentState: DROPZONE_STATE
    });
  },
  activateViewState: function() {
    return this.setState({
      currentState: VIEW_STATE
    });
  }
});

module.exports = ProductImages_Placeholder;



},{"./mixins/file_upload":46}],50:[function(require,module,exports){

/** @jsx React.DOM */
window.ProductModificationList = React.createClass({displayName: 'ProductModificationList',
  propTypes: {
    modifications: React.PropTypes.array.isRequired
  },
  render: function() {
    var modificationList;
    modificationList = this.props.modifications.filter(function(modification) {
      return modification.is_archived === false;
    }).map(function(modification) {
      return ProductModificationListItem({
             modification: modification, 
             key:  modification.id});
    });
    return React.DOM.ul({className: "adm-categories-goods-modifications"}, 
              modificationList 
            );
  }
});



},{}],51:[function(require,module,exports){

/** @jsx React.DOM */
window.ProductModificationListItem = React.createClass({displayName: 'ProductModificationListItem',
  propTypes: {
    modification: React.PropTypes.object.isRequired
  },
  render: function() {
    var count, itemClasses, quantityUnit, title;
    title = this.props.modification.title;
    count = this.props.modification.count;
    quantityUnit = this.props.modification.quantity_unit.short;
    itemClasses = React.addons.classSet({
      'adm-categories-goods-modifications-item': true,
      '__not-synced': !this.isSynced()
    });
    return React.DOM.li({className: itemClasses }, 
              title, " - ", count, quantityUnit 
            );
  },
  isSynced: function() {
    return this.props.modification.is_stock_synced === true;
  }
});



},{}],52:[function(require,module,exports){

/** @jsx React.DOM */
var TITLES;

TITLES = {
  published: 'OK',
  has_errors: 'Ошибки',
  unpublished: 'Снят',
  archive: 'Архив'
};

window.ProductState = React.createClass({displayName: 'ProductState',
  propTypes: {
    state: React.PropTypes.string.isRequired
  },
  render: function() {
    var classes, source, title;
    source = {
      label: true
    };
    source["__" + this.props.state] = true;
    classes = React.addons.classSet(source);
    title = TITLES[this.props.state];
    return React.DOM.span({className: classes}, title);
  }
});



},{}],53:[function(require,module,exports){

/** @jsx React.DOM */

/**global React, ProductsService */
var MANUAL_STATE_ARCHIVE, MANUAL_STATE_DEFAULT, MANUAL_STATE_DRAFT, MANUAL_STATE_PUBLISHED, STATE_ARCHIVE, STATE_HAS_ERRORS, STATE_PUBLISHED, STATE_UNPUBLISHED, cx;

cx = React.addons.classSet;

STATE_PUBLISHED = 'published';

STATE_HAS_ERRORS = 'has_errors';

STATE_UNPUBLISHED = 'unpublished';

STATE_ARCHIVE = 'archive';

MANUAL_STATE_DEFAULT = 0;

MANUAL_STATE_PUBLISHED = 1;

MANUAL_STATE_DRAFT = -1;

MANUAL_STATE_ARCHIVE = -2;

window.ProductStatusToggle = React.createClass({displayName: 'ProductStatusToggle',
  propTypes: {
    product_id: React.PropTypes.number.isRequired,
    state: React.PropTypes.string,
    manual_state: React.PropTypes.number
  },
  getDefaultProps: function() {
    return {
      state: STATE_PUBLISHED,
      manual_state: MANUAL_STATE_DEFAULT
    };
  },
  getInitialState: function() {
    return {
      state: this.props.state,
      manual_state: this.props.manual_state,
      localChecked: null,
      isLocalChecked: false
    };
  },
  componentWillReceiveProps: function(nextProps) {
    return this.setState(nextProps);
  },
  render: function() {
    var classes;
    classes = cx({
      "toggle__block": true,
      "checked": this.isChecked(),
      "has_errors": this.hasErrors(),
      '__disabled': this.state.isLocalChecked
    });
    return React.DOM.label({className: classes }, 
              React.DOM.div({className: "toggle__block-label-checked pull-left"}, 
                "Товар на сайте"
              ), 
              React.DOM.div({className: "toggle__block-box pull-left"}, 
                React.DOM.input({className: "toggle__block-checkbox", 
                       type: "checkbox", 
                       checked:  this.isChecked(), 
                       onChange:  this.handleInputChange, 
                       ref: "checkbox"}), 
                React.DOM.div({className: "toggle__block-switch"}), 
                React.DOM.div({className: "toggle__block-track"})
              ), 
              React.DOM.div({className: "toggle__block-label-unchecked pull-left"}, 
                "Скрыть товар"
              ), 
              React.DOM.div({className: "clearfix"})
            );
  },
  isChecked: function() {
    if (this.state.isLocalChecked) {
      return this.state.localChecked;
    } else {
      return this.state.state === STATE_PUBLISHED;
    }
  },
  hasErrors: function() {
    return this.state.state === STATE_HAS_ERRORS;
  },
  handleInputChange: function(e) {
    var options, savedManualState;
    if (this.state.isLocalChecked) {
      return;
    }
    savedManualState = this.state.manual_state;
    options = {
      id: this.props.product_id,
      success: (function(_this) {
        return function(response) {
          var state;
          state = _.pick(response, ['state', 'manual_state']);
          state.isLocalChecked = false;
          return _this.setState(state);
        };
      })(this),
      error: (function(_this) {
        return function() {
          return _this.setState({
            manual_state: savedManualState,
            isLocalChecked: false
          });
        };
      })(this)
    };
    if (this.refs.checkbox.getDOMNode().checked) {
      this.setState({
        manual_state: MANUAL_STATE_PUBLISHED,
        localChecked: true,
        isLocalChecked: true
      });
      return ProductsResource.publish(options);
    } else {
      this.setState({
        manual_state: MANUAL_STATE_ARCHIVE,
        localChecked: false,
        isLocalChecked: true
      });
      return ProductsResource.unpublish(options);
    }
  }
});



},{}],54:[function(require,module,exports){

/** @jsx React.DOM */
window.ProductThumb = React.createClass({displayName: 'ProductThumb',
  propTypes: {
    product: React.PropTypes.object.isRequired,
    style: React.PropTypes.string
  },
  getDefaultProps: function() {
    return {
      style: '50x50'
    };
  },
  render: function() {
    return React.DOM.img({src:  this.imageUrl(), 
          className: "adm-categories-goods-thumb", 
          alt:  this.props.product.title});
  },
  imageUrl: function() {
    var _ref;
    if ((_ref = this.props.product.image) != null ? _ref.url : void 0) {
      return ThumborService.image_url(this.props.product.image.url, this.props.style);
    } else {
      return gon.fallback_product_thumb_url;
    }
  }
});



},{}],55:[function(require,module,exports){

/** @jsx React.DOM */
window.ProductTotalItemsQuantity = React.createClass({displayName: 'ProductTotalItemsQuantity',
  propTypes: {
    product: React.PropTypes.object.isRequired
  },
  render: function() {
    var content, quantity, quantityUnit;
    quantity = parseInt(this.props.product.total_items_quantity);
    quantityUnit = this.props.product.quantity_unit.short;
    if (quantity > 0) {
      content = "" + quantity + " " + quantityUnit;
    } else {
      content = 'Нет в наличии';
    }
    return React.DOM.span({className: "adm-categories-goods-total-quantity", 
                  dangerouslySetInnerHTML: { __html: content}});
  }
});



},{}],56:[function(require,module,exports){
window.ModalController = {
  show: function(url) {
    var container;
    container = document.querySelectorAll('[modal-container]')[0];
    if (!container) {
      container = $('<\div>', {
        'modal-container': ''
      }).appendTo('body')[0];
    }
    return React.renderComponent(ModalComponent({
      url: url
    }), container);
  }
};



},{}],57:[function(require,module,exports){
var BaseDispatcher,
  __hasProp = {}.hasOwnProperty,
  __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

BaseDispatcher = (function(_super) {
  __extends(BaseDispatcher, _super);

  function BaseDispatcher() {
    return BaseDispatcher.__super__.constructor.apply(this, arguments);
  }

  BaseDispatcher.prototype.handleViewAction = function(action) {
    return this.dispatch({
      source: 'VIEW_ACTION',
      action: action
    });
  };

  BaseDispatcher.prototype.handleServerAction = function(action) {
    return this.dispatch({
      source: 'SERVER_ACTION',
      action: action
    });
  };

  return BaseDispatcher;

})(Dispatcher);

module.exports = BaseDispatcher;



},{}],58:[function(require,module,exports){
var BaseDispatcher;

BaseDispatcher = require('./_base');

window.DragStateDispatcher = new BaseDispatcher();



},{"./_base":57}],59:[function(require,module,exports){
var BaseDispatcher;

BaseDispatcher = require('./_base');

window.OperatorCategoriesDispatcher = new BaseDispatcher();



},{"./_base":57}],60:[function(require,module,exports){
var BaseDispatcher;

BaseDispatcher = require('./_base');

window.OperatorProductsDispatcher = new BaseDispatcher();



},{"./_base":57}],61:[function(require,module,exports){
window.AppHelpers = {
  reselectAndFocus: function(node) {
    var value, valueLength;
    value = node.value;
    valueLength = value.length;
    node.focus();
    if (node.setSelectionRange != null) {
      return node.setSelectionRange(0, valueLength);
    } else {
      return node.value = value;
    }
  }
};



},{}],62:[function(require,module,exports){
window.EventHelpers = {
  isAnyServiceKey: function(e) {
    return e.shiftKey || e.ctrlKey || e.altKey || e.metaKey;
  }
};



},{}],63:[function(require,module,exports){
var BaseMixin, ERROR_TIMEOUT, ram, rau;

ERROR_TIMEOUT = 1000;

BaseMixin = {
  setActivitiesHandler: function(handler) {
    this.activitiesHandler = handler;
    this.hasActivities = handler.hasActivities;
    this.incrementActivities = handler.increment;
    return this.decrementActivities = handler.decrement;
  }
};

ram = {
  componentWillMount: function() {
    return this.setActivitiesHandler(this.createActivitiesHandler());
  },
  getInitialState: function() {
    return {
      activities: 0
    };
  },
  incrementActivities: function() {
    return this.activitiesHandler.incrementActivities;
  },
  decrementActivities: function() {
    return this.activitiesHandler.decrementActivities;
  },
  createActivitiesHandler: function() {
    var activities, decrement, hasActivities, increment;
    increment = (function() {
      return _.defer((function(_this) {
        return function() {
          return _this.setState({
            activities: ++_this.state.activities
          });
        };
      })(this));
    }).bind(this);
    decrement = (function() {
      return _.defer((function(_this) {
        return function() {
          return _this.setState({
            activities: --_this.state.activities
          });
        };
      })(this));
    }).bind(this);
    hasActivities = (function() {
      return this.state.activities > 0;
    }).bind(this);
    activities = (function() {
      return this.state.activities;
    }).bind(this);
    return {
      increment: increment,
      decrement: decrement,
      hasActivities: hasActivities,
      activities: activities
    };
  }
};

rau = {
  propTypes: {
    activitiesHandler: React.PropTypes.object.isRequired
  },
  componentWillMount: function() {
    return this.setActivitiesHandler(this.props.activitiesHandler);
  },
  componentWillReceiveProps: function(nextProps) {
    return this.setActivitiesHandler(nextProps.activitiesHandler);
  }
};

React.mixins.add('ReactActivitiesMixin', [ram, BaseMixin]);

React.mixins.add('ReactActivitiesUser', [rau, BaseMixin]);



},{}],64:[function(require,module,exports){
window.CategoryDroppable = {
  componentDidMount: function() {
    var that;
    that = this;
    return $(this.getDOMNode()).droppable({
      scope: 'productsToCategories',
      addClasses: false,
      tolerance: 'pointer',
      drop: this.handleProductDrop,
      accept: _.throttle(function(productNode) {
        var category_id;
        category_id = parseInt(productNode.attr('data-category-id'));
        return category_id !== that.props.category.id;
      })
    });
  },
  handleProductDrop: function(e, ui) {
    if (DragStateStore.isMultipleSelected()) {
      OperatorProductsService.changeProductsCategory({
        products: DragStateStore.getSelectedProducts(),
        newCategoryId: this.props.category.id,
        oldCategoryId: parseInt(ui.draggable.attr('data-category-id'))
      });
    } else {
      OperatorProductsService.changeProductsCategory({
        products: DragStateStore.getDraggedProducts(),
        newCategoryId: this.props.category.id,
        oldCategoryId: parseInt(ui.draggable.attr('data-category-id'))
      });
    }
    return DragStateDispatcher.handleViewAction({
      type: 'productsMoved'
    });
  },
  componentWillUnmount: function() {
    return $(this.getDOMNode()).droppable('destroy');
  }
};



},{}],65:[function(require,module,exports){
window.ComponentManipulationsMixin = {
  safeUpdate: function(func) {
    if (!this._isUnmounted()) {
      func();
    }
  },
  safeUpdateState: function(newStates) {
    if (!this._isUnmounted()) {
      this.setState(newStates);
    }
  },
  _isUnmounted: function() {
    return this._compositeLifeCycleState === 'UNMOUNTING' || this._compositeLifeCycleState === 'UNMOUNTED' || this._lifeCycleState === 'UNMOUNTING' || this._lifeCycleState === 'UNMOUNTED';
  }
};



},{}],66:[function(require,module,exports){
window.ProductDraggable = {
  getInitialState: function() {
    return {
      isDragged: false
    };
  },
  componentDidMount: function() {
    var that;
    that = this;
    return $(this.getDOMNode()).draggable({
      scope: 'productsToCategories',
      addClasses: false,
      appendTo: 'body',
      zIndex: 100,
      cursor: 'default',
      cursorAt: {
        top: -5,
        left: -15
      },
      helper: function() {
        var stringComponent;
        if (DragStateStore.isMultipleSelected()) {
          stringComponent = React.renderComponentToString(OperatorProducts_ListItemsDrag({
            products: DragStateStore.getSelectedProducts()
          }));
        } else {
          stringComponent = React.renderComponentToString(OperatorProducts_ListItemDrag({
            product: that.props.product
          }));
        }
        return $(stringComponent);
      },
      start: (function(_this) {
        return function(e) {
          DragStateDispatcher.handleViewAction({
            type: 'productBecameDraggable',
            product: _this.props.product
          });
          return _this.setState({
            isDragged: true
          });
        };
      })(this),
      stop: function(e) {
        return setTimeout(function() {
          DragStateDispatcher.handleViewAction({
            type: 'productBecameStatic',
            product: that.props.product
          });
          return that.setState({
            isDragged: false
          });
        }, 0);
      }
    });
  }
};



},{}],67:[function(require,module,exports){
window.UnmountMixin = {
  unmount: function() {
    return _.defer((function(_this) {
      return function() {
        return React.unmountComponentAtNode(_this.getDOMNode().parentNode);
      };
    })(this));
  }
};



},{}],68:[function(require,module,exports){
window.CategoriesResource = {
  index: function(_arg) {
    var data, error, success;
    data = _arg.data, success = _arg.success, error = _arg.error;
    return Requester.request({
      url: ApiRoutes.operator_categories_url(),
      data: data,
      success: function(categories) {
        return typeof success === "function" ? success(categories) : void 0;
      },
      error: function(xhr, status, err) {
        return typeof error === "function" ? error(err || status) : void 0;
      }
    });
  },
  get: function(_arg) {
    var categoryId, error, success;
    categoryId = _arg.categoryId, success = _arg.success, error = _arg.error;
    return Requester.request({
      url: ApiRoutes.operator_category_url(categoryId),
      success: function(category) {
        return typeof success === "function" ? success(category) : void 0;
      },
      error: function(xhr, status, err) {
        return typeof error === "function" ? error(err || status) : void 0;
      }
    });
  },
  create: function(_arg) {
    var data, error, success;
    data = _arg.data, success = _arg.success, error = _arg.error;
    return Requester.request({
      url: ApiRoutes.operator_categories_url(),
      method: 'POST',
      data: data,
      success: function(category) {
        return typeof success === "function" ? success(category) : void 0;
      },
      error: function(xhr, status, err) {
        return typeof error === "function" ? error(err || status) : void 0;
      }
    });
  },
  update: function(_arg) {
    var categoryId, data, error, success;
    data = _arg.data, categoryId = _arg.categoryId, success = _arg.success, error = _arg.error;
    return Requester.request({
      url: ApiRoutes.operator_category_url(categoryId),
      method: 'PUT',
      data: data,
      success: function(category) {
        return typeof success === "function" ? success(category) : void 0;
      },
      error: function(xhr, status, err) {
        return typeof error === "function" ? error(err || status) : void 0;
      }
    });
  },
  "delete": function(_arg) {
    var categoryId, error, success;
    categoryId = _arg.categoryId, success = _arg.success, error = _arg.error;
    return Requester.request({
      url: ApiRoutes.operator_category_url(categoryId),
      method: 'DELETE',
      error: function(xhr, status, err) {
        return typeof error === "function" ? error(err || status) : void 0;
      },
      success: function(response) {
        return typeof success === "function" ? success(response) : void 0;
      }
    });
  }
};



},{}],69:[function(require,module,exports){
window.ProductsResource = {
  index: function(_arg) {
    var data, error, success;
    data = _arg.data, success = _arg.success, error = _arg.error;
    error || (error = KioskOperatorApp.error_alert);
    data.per_page || (data.per_page = 1000);
    return Requester.request({
      dataType: 'json',
      url: ApiRoutes.operator_products_by_category_url(),
      method: 'get',
      data: data,
      error: function(xhr, status, err) {
        return error(err || status);
      },
      success: function(data) {
        return success(data.products);
      }
    });
  },
  get: function(_arg) {
    var error, productId, success;
    productId = _arg.productId, success = _arg.success, error = _arg.error;
    return Requester.request({
      url: ApiRoutes.operator_product_url(productId),
      success: function(product) {
        return typeof success === "function" ? success(product) : void 0;
      },
      error: function(xhr, status, err) {
        return typeof error === "function" ? error(err || status) : void 0;
      }
    });
  },
  publish: function(_arg) {
    var error, id, success;
    id = _arg.id, success = _arg.success, error = _arg.error;
    return $.ajax({
      dataType: 'json',
      method: 'post',
      url: ApiRoutes.operator_product_publicate_url(id),
      error: function(xhr, status, err) {
        if (error) {
          return error(err || status);
        }
      },
      success: function(data) {
        if (success) {
          return success(data);
        }
      }
    });
  },
  unpublish: function(_arg) {
    var error, id, success;
    id = _arg.id, success = _arg.success, error = _arg.error;
    return $.ajax({
      dataType: 'json',
      method: 'delete',
      url: ApiRoutes.operator_product_publicate_url(id),
      error: function(xhr, status, err) {
        if (error) {
          return error(err || status);
        }
      },
      success: function(data) {
        if (success) {
          return success(data);
        }
      }
    });
  },
  update: function(_arg) {
    var data, error, id, success;
    id = _arg.id, data = _arg.data, success = _arg.success, error = _arg.error;
    return Requester.request({
      dataType: 'json',
      method: 'put',
      url: ApiRoutes.operator_product_url(id),
      data: data,
      error: function(xhr, status, err) {
        return error(err || status);
      },
      success: success
    });
  }
};



},{}],70:[function(require,module,exports){
window.OperatorCategoriesService = {
  reorderCategories: function(_arg) {
    var categoryId, insertIdx, newPositions;
    categoryId = _arg.categoryId, insertIdx = _arg.insertIdx;
    newPositions = OperatorCategoriesStore.getReorderedPositions(categoryId, insertIdx);
    if (newPositions.length) {
      OperatorCategoriesServerActions.reorderCategories(newPositions);
      return this.updateCategories(newPositions, function(err, response) {
        if (err) {
          return console.error(err);
        }
      });
    }
  },
  updateCategories: function(data, callback) {
    var done, that;
    done = _.after(data.length, function() {
      return callback();
    });
    that = this;
    return _.each(data, function(i) {
      return CategoriesResource.update({
        categoryId: i.id,
        data: {
          name: i.name,
          position: i.position,
          parent_id: i.parent_id
        },
        success: done
      });
    });
  }
};



},{}],71:[function(require,module,exports){
window.OperatorProductsService = {
  loadProducts: function(_arg) {
    var data, error, success;
    data = _arg.data, success = _arg.success, error = _arg.error;
    return Requester.request({
      url: ApiRoutes.operator_products_by_category_url(),
      data: {
        category_id: data.categoryId,
        filter: data.filter,
        include_subcategories: data.includeSubcategories,
        page: 1,
        per_page: 30
      },
      error: function(xhr, status, err) {
        return typeof error === "function" ? error(err || status) : void 0;
      },
      success: function(response) {
        OperatorProductsServerActions.receiveProducts(data.categoryId, response.products);
        return typeof success === "function" ? success(response) : void 0;
      }
    });
  },
  loadMoreProducts: function(_arg) {
    var data, error, success;
    data = _arg.data, success = _arg.success, error = _arg.error;
    return Requester.request({
      url: ApiRoutes.operator_products_by_category_url(),
      data: {
        category_id: data.categoryId,
        filter: data.filter,
        include_subcategories: data.includeSubcategories,
        page: data.page,
        per_page: 30
      },
      error: function(xhr, status, err) {
        return typeof error === "function" ? error(err || status) : void 0;
      },
      success: function(response) {
        OperatorProductsServerActions.receiveMoreProducts(data.categoryId, response.products);
        return typeof success === "function" ? success(response) : void 0;
      }
    });
  },
  changeProductCategory: function(_arg) {
    var newCategoryId, oldCategoryId, productId, success;
    productId = _arg.productId, newCategoryId = _arg.newCategoryId, oldCategoryId = _arg.oldCategoryId, success = _arg.success;
    return Requester.request({
      url: ApiRoutes.operator_product_url(productId),
      method: 'PUT',
      data: {
        category_id: newCategoryId
      },
      error: function(xhr, status, err) {
        return typeof error === "function" ? error(err || status) : void 0;
      },
      success: function() {
        if (typeof success === "function") {
          success();
        }
        return OperatorProductsServerActions.moveProduct({
          productId: productId,
          categoryId: oldCategoryId
        });
      }
    });
  },
  changeProductsCategory: function(_arg) {
    var completedRequests, newCategoryId, oldCategoryId, product, products, _i, _len, _results;
    products = _arg.products, newCategoryId = _arg.newCategoryId, oldCategoryId = _arg.oldCategoryId;
    completedRequests = 0;
    _results = [];
    for (_i = 0, _len = products.length; _i < _len; _i++) {
      product = products[_i];
      _results.push(this.changeProductCategory({
        productId: product.id,
        newCategoryId: newCategoryId,
        oldCategoryId: oldCategoryId,
        success: function() {
          completedRequests++;
          if (completedRequests === products.length) {
            OperatorCategoriesViewActions.reloadCategory({
              categoryId: newCategoryId
            });
            return OperatorCategoriesViewActions.reloadCategory({
              categoryId: oldCategoryId
            });
          }
        }
      }));
    }
    return _results;
  }
};



},{}],72:[function(require,module,exports){
window.ThumborService = {
  thumbor_url: typeof gon !== "undefined" && gon !== null ? gon.thumbor_url : void 0,
  image_url: function(url, style) {
    if (style == null) {
      style = "100x100";
    }
    if (gon.env === 'static-development') {
      return url;
    }
    if (this.thumbor_url) {
      return this.thumbor_url + ("/unsafe/" + style + "/") + url;
    } else {
      return url;
    }
  }
};



},{}],73:[function(require,module,exports){
window.UuidService = {
  generate: function() {
    var s4;
    s4 = function() {
      return Math.floor((1 + Math.random()) * 0x10000).toString(16).substring(1);
    };
    return "" + (s4() + s4()) + "-" + (s4()) + "-" + (s4()) + "-" + (s4()) + "-" + (s4() + s4() + s4());
  }
};



},{}],74:[function(require,module,exports){
var BaseStore, CHANGE_EVENT,
  __hasProp = {}.hasOwnProperty,
  __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

CHANGE_EVENT = 'change';

BaseStore = (function(_super) {
  __extends(BaseStore, _super);

  function BaseStore() {
    return BaseStore.__super__.constructor.apply(this, arguments);
  }

  BaseStore.prototype.emitChange = function() {
    return this.emit(CHANGE_EVENT);
  };

  BaseStore.prototype.addChangeListener = function(cb) {
    return this.on(CHANGE_EVENT, cb);
  };

  BaseStore.prototype.removeChangeListener = function(cb) {
    return this.off(CHANGE_EVENT, cb);
  };

  return BaseStore;

})(EventEmitter);

module.exports = BaseStore;



},{}],75:[function(require,module,exports){
var BaseStore, _draggedProducts, _selectedProducts;

BaseStore = require('./_base');

_draggedProducts = [];

_selectedProducts = [];

window.DragStateStore = _.extend(new BaseStore(), {
  isDragged: function() {
    return _draggedProducts.length > 0;
  },
  isMultipleSelected: function() {
    return _selectedProducts.length > 1;
  },
  isSelectedProductExists: function(product) {
    var _i, _len, _selectedProduct;
    for (_i = 0, _len = _selectedProducts.length; _i < _len; _i++) {
      _selectedProduct = _selectedProducts[_i];
      if (_selectedProduct.id === product.id) {
        return true;
      }
    }
    return false;
  },
  isDraggedProductExists: function(product) {
    var _draggedProduct, _i, _len;
    for (_i = 0, _len = _draggedProducts.length; _i < _len; _i++) {
      _draggedProduct = _draggedProducts[_i];
      if (_draggedProduct.id === product.id) {
        return true;
      }
    }
    return false;
  },
  pushDraggedProduct: function(product) {
    if (!this.isDraggedProductExists(product)) {
      return _draggedProducts.push(product);
    }
  },
  deleteDraggedProduct: function(product) {
    var clonedDraggedProduct, clonedDraggedProducts, i, _i, _len;
    clonedDraggedProducts = _draggedProducts.slice(0);
    for (i = _i = 0, _len = clonedDraggedProducts.length; _i < _len; i = ++_i) {
      clonedDraggedProduct = clonedDraggedProducts[i];
      if (!(clonedDraggedProduct.id === product.id)) {
        continue;
      }
      clonedDraggedProducts.splice(i, 1);
      break;
    }
    return _draggedProducts = clonedDraggedProducts;
  },
  pushSelectedProduct: function(product) {
    if (!this.isSelectedProductExists(product)) {
      return _selectedProducts.push(product);
    }
  },
  deleteSelectedProduct: function(product) {
    var clonedSelectedProduct, clonedSelectedProducts, i, _i, _len;
    clonedSelectedProducts = _selectedProducts.slice(0);
    for (i = _i = 0, _len = clonedSelectedProducts.length; _i < _len; i = ++_i) {
      clonedSelectedProduct = clonedSelectedProducts[i];
      if (!(clonedSelectedProduct.id === product.id)) {
        continue;
      }
      clonedSelectedProducts.splice(i, 1);
      break;
    }
    return _selectedProducts = clonedSelectedProducts;
  },
  resetProducts: function() {
    _draggedProducts = [];
    return _selectedProducts = [];
  },
  getDraggedProducts: function() {
    return _draggedProducts;
  },
  getSelectedProducts: function() {
    return _selectedProducts;
  }
});

DragStateDispatcher.register(function(payload) {
  var action;
  action = payload.action;
  switch (action.type) {
    case 'productBecameDraggable':
      DragStateStore.pushDraggedProduct(action.product);
      return DragStateStore.emitChange();
    case 'productBecameStatic':
      DragStateStore.deleteDraggedProduct(action.product);
      return DragStateStore.emitChange();
    case 'productBecameSelected':
      return DragStateStore.pushSelectedProduct(action.product);
    case 'productBecameUnselected':
      return DragStateStore.deleteSelectedProduct(action.product);
    case 'productsMoved':
      return DragStateStore.resetProducts();
    case 'currentCategoryChanged':
      if (!DragStateStore.isDragged()) {
        return DragStateStore.resetProducts();
      }
  }
});



},{"./_base":74}],76:[function(require,module,exports){
var BaseStore, _categories, _getNewPositions;

BaseStore = require('./_base');

_categories = [];

_getNewPositions = function(category, insertIndex) {
  var catToShift, currentPosition, minPosition, newPositions, nextSibling, oldCategoriesParent, oldCategoriesPositions, oldTail, originalIndex, positionDiff, previousSibling, slicePosition, _i, _len;
  oldCategoriesParent = OperatorCategoriesStore.getCategoryById(category.parent_id);
  oldCategoriesPositions = OperatorCategoriesStore.getSortedCategoriesByParent(oldCategoriesParent);
  originalIndex = _.findIndex(oldCategoriesPositions, function(i) {
    return i.id === category.id;
  });
  if (insertIndex === originalIndex) {
    return [];
  }
  oldCategoriesPositions = _.reject(oldCategoriesPositions, function(i) {
    return i.id === category.id;
  });
  if (!(insertIndex < 1)) {
    previousSibling = oldCategoriesPositions[insertIndex - 1];
  }
  if (!(insertIndex > oldCategoriesPositions.length - 1)) {
    nextSibling = oldCategoriesPositions[insertIndex];
  }
  if (!nextSibling) {
    return [
      {
        id: category.id,
        position: previousSibling.position + 1
      }
    ];
  }
  if (!previousSibling) {
    previousSibling = {
      position: -1,
      id: null
    };
  }
  positionDiff = nextSibling.position - previousSibling.position;
  if (positionDiff > 1) {
    return [
      {
        id: category.id,
        position: previousSibling.position + 1
      }
    ];
  }
  slicePosition = previousSibling.position + 1;
  newPositions = [
    {
      id: category.id,
      position: slicePosition,
      name: category.name
    }
  ];
  oldTail = oldCategoriesPositions.slice(insertIndex);
  for (_i = 0, _len = oldTail.length; _i < _len; _i++) {
    catToShift = oldTail[_i];
    minPosition = slicePosition + 1;
    currentPosition = catToShift.position;
    if (currentPosition < minPosition) {
      currentPosition = minPosition;
      newPositions.push({
        id: catToShift.id,
        position: currentPosition,
        name: catToShift.name
      });
      slicePosition = currentPosition + 1;
    }
  }
  return newPositions;
};

window.OperatorCategoriesStore = _.extend(new BaseStore(), {
  isCategoryExists: function(category) {
    var _category, _i, _len;
    if (!category) {
      return false;
    }
    for (_i = 0, _len = _categories.length; _i < _len; _i++) {
      _category = _categories[_i];
      if (_category.id === category.id) {
        return true;
      }
    }
    return false;
  },
  pushCategories: function(categories) {
    var category, clonedCategories, _i, _len;
    clonedCategories = _categories.slice(0);
    for (_i = 0, _len = categories.length; _i < _len; _i++) {
      category = categories[_i];
      if (!this.isCategoryExists(category)) {
        clonedCategories.push(category);
      }
    }
    return _categories = clonedCategories;
  },
  updateCategory: function(data) {
    var _category, _i, _len, _results;
    _results = [];
    for (_i = 0, _len = _categories.length; _i < _len; _i++) {
      _category = _categories[_i];
      if (!(_category.id === data.id)) {
        continue;
      }
      _.extend(_category, data);
      break;
    }
    return _results;
  },
  updatePositions: function(newPositions) {
    var category, newPosition, reorderedCategories, _i, _j, _len, _len1;
    reorderedCategories = _categories.slice(0);
    for (_i = 0, _len = reorderedCategories.length; _i < _len; _i++) {
      category = reorderedCategories[_i];
      for (_j = 0, _len1 = newPositions.length; _j < _len1; _j++) {
        newPosition = newPositions[_j];
        if (category.id === newPosition.id) {
          category.position = newPosition.position;
        }
      }
    }
    return _categories = reorderedCategories;
  },
  deleteCategory: function(category) {
    var clonedCategories, clonedCategory, i, _i, _len;
    clonedCategories = _categories.slice(0);
    for (i = _i = 0, _len = clonedCategories.length; _i < _len; i = ++_i) {
      clonedCategory = clonedCategories[i];
      if (!(clonedCategory.id === category.id)) {
        continue;
      }
      clonedCategories.splice(i, 1);
      break;
    }
    return _categories = clonedCategories;
  },
  getCategories: function() {
    return _categories;
  },
  getRootCategory: function() {
    var _category, _i, _len;
    for (_i = 0, _len = _categories.length; _i < _len; _i++) {
      _category = _categories[_i];
      if (_category.parent_id === null) {
        return _category;
      }
    }
  },
  getCategoryLevel: function(category) {
    if (category.parent_id) {
      return 1 + this.getCategoryLevel(this.getCategoryById(category.parent_id));
    } else {
      return 0;
    }
  },
  getCategoryPosition: function(category) {
    var lastPosition, lastSibling, siblings;
    siblings = _.filter(_categories, function(i) {
      return i.parent_id === category.parent_id;
    });
    if (siblings.length) {
      lastSibling = _.max(siblings, function(i) {
        return i.position;
      });
      lastPosition = lastSibling.position;
    } else {
      lastPosition = -1;
    }
    return lastPosition + 1;
  },
  getReorderedPositions: function(categoryId, insertIdx) {
    var category;
    category = this.getCategoryById(categoryId);
    return _getNewPositions(category, insertIdx);
  },
  getCategoryById: function(categoryId) {
    var _category, _i, _len;
    for (_i = 0, _len = _categories.length; _i < _len; _i++) {
      _category = _categories[_i];
      if (_category.id === categoryId) {
        return _category;
      }
    }
  },
  getSortedCategoriesByParent: function(parentCategory) {
    var parentId;
    parentId = parentCategory ? parentCategory.id : null;
    return _.filter(_categories, function(i) {
      return i.parent_id === parentId;
    }).sort(function(a, b) {
      return a.position - b.position;
    });
  }
});

OperatorCategoriesStore.dispatchToken = OperatorCategoriesDispatcher.register(function(payload) {
  var action;
  action = payload.action;
  switch (action.type) {
    case 'categoriesLoaded':
      OperatorCategoriesStore.pushCategories(action.categories);
      return OperatorCategoriesStore.emitChange();
    case 'categoriesReordered':
      OperatorCategoriesStore.updatePositions(action.newPositions);
      return OperatorCategoriesStore.emitChange();
    case 'categoryLoaded':
      if (OperatorCategoriesStore.isCategoryExists(action.category)) {
        OperatorCategoriesStore.updateCategory(action.category);
      } else {
        OperatorCategoriesStore.pushCategories([action.category]);
      }
      return OperatorCategoriesStore.emitChange();
    case 'categoryCreated':
      OperatorCategoriesStore.pushCategories([action.category]);
      return OperatorCategoriesStore.emitChange();
    case 'categoryUpdated':
      OperatorCategoriesStore.updateCategory(action.category);
      return OperatorCategoriesStore.emitChange();
    case 'categoryDeleted':
      OperatorCategoriesStore.deleteCategory(action.category);
      return OperatorCategoriesStore.emitChange();
  }
});



},{"./_base":74}],77:[function(require,module,exports){
var BaseStore, _products;

BaseStore = require('./_base');

_products = {};

window.OperatorProductsStore = _.extend(new BaseStore(), {
  isProductExists: function(categoryId, productId) {
    var product, products, _i, _len, _ref;
    products = (_ref = _products[categoryId]) != null ? _ref : [];
    for (_i = 0, _len = products.length; _i < _len; _i++) {
      product = products[_i];
      if (product.id === productId) {
        return true;
      }
    }
    return false;
  },
  replaceProducts: function(categoryId, products) {
    return _products[categoryId] = products;
  },
  pushProducts: function(categoryId, products) {
    var clonedProducts, product, _i, _len;
    _products[categoryId] || (_products[categoryId] = []);
    clonedProducts = _products[categoryId].slice(0);
    for (_i = 0, _len = products.length; _i < _len; _i++) {
      product = products[_i];
      if (!this.isProductExists(categoryId, product)) {
        clonedProducts.push(product);
      }
    }
    return _products[categoryId] = clonedProducts;
  },
  updateProduct: function(categoryId, data) {
    var product, products, _i, _len;
    products = this.getProducts(categoryId);
    for (_i = 0, _len = products.length; _i < _len; _i++) {
      product = products[_i];
      if (!(product.id === data.id)) {
        continue;
      }
      _.extend(product, data);
      break;
    }
    return _products[categoryId] = products;
  },
  removeProduct: function(categoryId, productId) {
    var clonedProduct, clonedProducts, i, _i, _len;
    if (!this.isProductExists(categoryId, productId)) {
      return;
    }
    clonedProducts = _products[categoryId].slice(0);
    for (i = _i = 0, _len = clonedProducts.length; _i < _len; i = ++_i) {
      clonedProduct = clonedProducts[i];
      if (!(clonedProduct.id === productId)) {
        continue;
      }
      clonedProducts.splice(i, 1);
      break;
    }
    return _products[categoryId] = clonedProducts;
  },
  getProducts: function(categoryId) {
    var _ref;
    return (_ref = _products[categoryId]) != null ? _ref : [];
  }
});

OperatorProductsStore.dispatchToken = OperatorProductsDispatcher.register(function(payload) {
  var action;
  action = payload.action;
  switch (action.type) {
    case 'productsLoaded':
      OperatorProductsStore.replaceProducts(action.categoryId, action.products);
      return OperatorProductsStore.emitChange();
    case 'moreProductsLoaded':
      OperatorProductsStore.pushProducts(action.categoryId, action.products);
      return OperatorProductsStore.emitChange();
    case 'productMoved':
      OperatorProductsStore.removeProduct(action.categoryId, action.productId);
      return OperatorProductsStore.emitChange();
    case 'productUpdated':
      OperatorProductsStore.updateProduct(action.categoryId, action.product);
      return OperatorProductsStore.emitChange();
  }
});



},{"./_base":74}],78:[function(require,module,exports){
window.ApiRoutes = {
  operator_product_image_delete_url: function(id) {
    return gon.api_root_url + '/v1/operator/products/images/' + id;
  },
  operator_products_images_url: function() {
    return gon.api_root_url + '/v1/operator/products/images';
  },
  operator_categories_url: function() {
    return gon.api_root_url + '/v1/operator/categories';
  },
  operator_category_url: function(id) {
    return gon.api_root_url + '/v1/operator/categories/' + id;
  },
  operator_product_url: function(id) {
    return gon.api_root_url + '/v1/operator/products/' + id;
  },
  operator_product_publicate_url: function(id) {
    return gon.api_root_url + '/v1/operator/products/' + id + '/publication';
  },
  operator_products_by_category_url: function() {
    return gon.api_root_url + '/v1/operator/products';
  }
};



},{}],79:[function(require,module,exports){
window.Routes = {
  products_image_delete_path: function(id) {
    return gon.root_url + '/products/images/' + id;
  },
  operator_product_url: function(id) {
    return gon.root_url + '/operator/products/' + id;
  },
  operator_product_edit_url: function(id) {
    return gon.root_url + '/operator/products/' + id + '/edit';
  },
  operator_product_new_url: function() {
    return gon.root_url + '/operator/products/new';
  },
  products_by_category_url: function(id) {
    return gon.root_url + '/operator/products?category_id=' + id;
  }
};



},{}],80:[function(require,module,exports){
/**
 * Copyright (c) 2014, Facebook, Inc.
 * All rights reserved.
 *
 * This source code is licensed under the BSD-style license found in the
 * LICENSE file in the root directory of this source tree. An additional grant
 * of patent rights can be found in the PATENTS file in the same directory.
 */

module.exports.Dispatcher = require('./lib/Dispatcher')

},{"./lib/Dispatcher":81}],81:[function(require,module,exports){
/*
 * Copyright (c) 2014, Facebook, Inc.
 * All rights reserved.
 *
 * This source code is licensed under the BSD-style license found in the
 * LICENSE file in the root directory of this source tree. An additional grant
 * of patent rights can be found in the PATENTS file in the same directory.
 *
 * @providesModule Dispatcher
 * @typechecks
 */

"use strict";

var invariant = require('./invariant');

var _lastID = 1;
var _prefix = 'ID_';

/**
 * Dispatcher is used to broadcast payloads to registered callbacks. This is
 * different from generic pub-sub systems in two ways:
 *
 *   1) Callbacks are not subscribed to particular events. Every payload is
 *      dispatched to every registered callback.
 *   2) Callbacks can be deferred in whole or part until other callbacks have
 *      been executed.
 *
 * For example, consider this hypothetical flight destination form, which
 * selects a default city when a country is selected:
 *
 *   var flightDispatcher = new Dispatcher();
 *
 *   // Keeps track of which country is selected
 *   var CountryStore = {country: null};
 *
 *   // Keeps track of which city is selected
 *   var CityStore = {city: null};
 *
 *   // Keeps track of the base flight price of the selected city
 *   var FlightPriceStore = {price: null}
 *
 * When a user changes the selected city, we dispatch the payload:
 *
 *   flightDispatcher.dispatch({
 *     actionType: 'city-update',
 *     selectedCity: 'paris'
 *   });
 *
 * This payload is digested by `CityStore`:
 *
 *   flightDispatcher.register(function(payload) {
 *     if (payload.actionType === 'city-update') {
 *       CityStore.city = payload.selectedCity;
 *     }
 *   });
 *
 * When the user selects a country, we dispatch the payload:
 *
 *   flightDispatcher.dispatch({
 *     actionType: 'country-update',
 *     selectedCountry: 'australia'
 *   });
 *
 * This payload is digested by both stores:
 *
 *    CountryStore.dispatchToken = flightDispatcher.register(function(payload) {
 *     if (payload.actionType === 'country-update') {
 *       CountryStore.country = payload.selectedCountry;
 *     }
 *   });
 *
 * When the callback to update `CountryStore` is registered, we save a reference
 * to the returned token. Using this token with `waitFor()`, we can guarantee
 * that `CountryStore` is updated before the callback that updates `CityStore`
 * needs to query its data.
 *
 *   CityStore.dispatchToken = flightDispatcher.register(function(payload) {
 *     if (payload.actionType === 'country-update') {
 *       // `CountryStore.country` may not be updated.
 *       flightDispatcher.waitFor([CountryStore.dispatchToken]);
 *       // `CountryStore.country` is now guaranteed to be updated.
 *
 *       // Select the default city for the new country
 *       CityStore.city = getDefaultCityForCountry(CountryStore.country);
 *     }
 *   });
 *
 * The usage of `waitFor()` can be chained, for example:
 *
 *   FlightPriceStore.dispatchToken =
 *     flightDispatcher.register(function(payload) {
 *       switch (payload.actionType) {
 *         case 'country-update':
 *           flightDispatcher.waitFor([CityStore.dispatchToken]);
 *           FlightPriceStore.price =
 *             getFlightPriceStore(CountryStore.country, CityStore.city);
 *           break;
 *
 *         case 'city-update':
 *           FlightPriceStore.price =
 *             FlightPriceStore(CountryStore.country, CityStore.city);
 *           break;
 *     }
 *   });
 *
 * The `country-update` payload will be guaranteed to invoke the stores'
 * registered callbacks in order: `CountryStore`, `CityStore`, then
 * `FlightPriceStore`.
 */

  function Dispatcher() {
    this.$Dispatcher_callbacks = {};
    this.$Dispatcher_isPending = {};
    this.$Dispatcher_isHandled = {};
    this.$Dispatcher_isDispatching = false;
    this.$Dispatcher_pendingPayload = null;
  }

  /**
   * Registers a callback to be invoked with every dispatched payload. Returns
   * a token that can be used with `waitFor()`.
   *
   * @param {function} callback
   * @return {string}
   */
  Dispatcher.prototype.register=function(callback) {
    var id = _prefix + _lastID++;
    this.$Dispatcher_callbacks[id] = callback;
    return id;
  };

  /**
   * Removes a callback based on its token.
   *
   * @param {string} id
   */
  Dispatcher.prototype.unregister=function(id) {
    invariant(
      this.$Dispatcher_callbacks[id],
      'Dispatcher.unregister(...): `%s` does not map to a registered callback.',
      id
    );
    delete this.$Dispatcher_callbacks[id];
  };

  /**
   * Waits for the callbacks specified to be invoked before continuing execution
   * of the current callback. This method should only be used by a callback in
   * response to a dispatched payload.
   *
   * @param {array<string>} ids
   */
  Dispatcher.prototype.waitFor=function(ids) {
    invariant(
      this.$Dispatcher_isDispatching,
      'Dispatcher.waitFor(...): Must be invoked while dispatching.'
    );
    for (var ii = 0; ii < ids.length; ii++) {
      var id = ids[ii];
      if (this.$Dispatcher_isPending[id]) {
        invariant(
          this.$Dispatcher_isHandled[id],
          'Dispatcher.waitFor(...): Circular dependency detected while ' +
          'waiting for `%s`.',
          id
        );
        continue;
      }
      invariant(
        this.$Dispatcher_callbacks[id],
        'Dispatcher.waitFor(...): `%s` does not map to a registered callback.',
        id
      );
      this.$Dispatcher_invokeCallback(id);
    }
  };

  /**
   * Dispatches a payload to all registered callbacks.
   *
   * @param {object} payload
   */
  Dispatcher.prototype.dispatch=function(payload) {
    invariant(
      !this.$Dispatcher_isDispatching,
      'Dispatch.dispatch(...): Cannot dispatch in the middle of a dispatch.'
    );
    this.$Dispatcher_startDispatching(payload);
    try {
      for (var id in this.$Dispatcher_callbacks) {
        if (this.$Dispatcher_isPending[id]) {
          continue;
        }
        this.$Dispatcher_invokeCallback(id);
      }
    } finally {
      this.$Dispatcher_stopDispatching();
    }
  };

  /**
   * Is this Dispatcher currently dispatching.
   *
   * @return {boolean}
   */
  Dispatcher.prototype.isDispatching=function() {
    return this.$Dispatcher_isDispatching;
  };

  /**
   * Call the callback stored with the given id. Also do some internal
   * bookkeeping.
   *
   * @param {string} id
   * @internal
   */
  Dispatcher.prototype.$Dispatcher_invokeCallback=function(id) {
    this.$Dispatcher_isPending[id] = true;
    this.$Dispatcher_callbacks[id](this.$Dispatcher_pendingPayload);
    this.$Dispatcher_isHandled[id] = true;
  };

  /**
   * Set up bookkeeping needed when dispatching.
   *
   * @param {object} payload
   * @internal
   */
  Dispatcher.prototype.$Dispatcher_startDispatching=function(payload) {
    for (var id in this.$Dispatcher_callbacks) {
      this.$Dispatcher_isPending[id] = false;
      this.$Dispatcher_isHandled[id] = false;
    }
    this.$Dispatcher_pendingPayload = payload;
    this.$Dispatcher_isDispatching = true;
  };

  /**
   * Clear bookkeeping used for dispatching.
   *
   * @internal
   */
  Dispatcher.prototype.$Dispatcher_stopDispatching=function() {
    this.$Dispatcher_pendingPayload = null;
    this.$Dispatcher_isDispatching = false;
  };


module.exports = Dispatcher;

},{"./invariant":82}],82:[function(require,module,exports){
/**
 * Copyright (c) 2014, Facebook, Inc.
 * All rights reserved.
 *
 * This source code is licensed under the BSD-style license found in the
 * LICENSE file in the root directory of this source tree. An additional grant
 * of patent rights can be found in the PATENTS file in the same directory.
 *
 * @providesModule invariant
 */

"use strict";

/**
 * Use invariant() to assert state which your program assumes to be true.
 *
 * Provide sprintf-style format (only %s is supported) and arguments
 * to provide information about what broke and what you were
 * expecting.
 *
 * The invariant message will be stripped in production, but the invariant
 * will remain to ensure logic does not differ in production.
 */

var invariant = function(condition, format, a, b, c, d, e, f) {
  if (false) {
    if (format === undefined) {
      throw new Error('invariant requires an error message argument');
    }
  }

  if (!condition) {
    var error;
    if (format === undefined) {
      error = new Error(
        'Minified exception occurred; use the non-minified dev environment ' +
        'for the full error message and additional helpful warnings.'
      );
    } else {
      var args = [a, b, c, d, e, f];
      var argIndex = 0;
      error = new Error(
        'Invariant Violation: ' +
        format.replace(/%s/g, function() { return args[argIndex++]; })
      );
    }

    error.framesToPop = 1; // we don't care about invariant's own frame
    throw error;
  }
};

module.exports = invariant;

},{}]},{},[1]);
