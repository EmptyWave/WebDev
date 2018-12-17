"use strict";

function _classCallCheck(instance, Constructor) { if (!(instance instanceof Constructor)) { throw new TypeError("Cannot call a class as a function"); } }

function _defineProperties(target, props) { for (var i = 0; i < props.length; i++) { var descriptor = props[i]; descriptor.enumerable = descriptor.enumerable || false; descriptor.configurable = true; if ("value" in descriptor) descriptor.writable = true; Object.defineProperty(target, descriptor.key, descriptor); } }

function _createClass(Constructor, protoProps, staticProps) { if (protoProps) _defineProperties(Constructor.prototype, protoProps); if (staticProps) _defineProperties(Constructor, staticProps); return Constructor; }

var Cart =
/*#__PURE__*/
function () {
  function Cart(source) {
    var container = arguments.length > 1 && arguments[1] !== undefined ? arguments[1] : '#cart';

    _classCallCheck(this, Cart);

    this.source = source;
    this.container = container;
    this.countGoods = 0; // Общее кол-во товаров в корзине

    this.amount = 0; // Общее стоимость товаров в корзине

    this.cartItems = []; // Массив со всеми товарами

    this._init(this.source);
  }

  _createClass(Cart, [{
    key: "_render",
    value: function _render() {
      var $cartItemsDiv = $('<div/>', {
        class: 'cart-items-wrap'
      });
      /*let $totalProducts = $('<div/>', {
        class: 'cart-summary sum-amount'
      });*/

      var $totalPrice = $('<div/>', {
        class: 'cart-price'
      });
      var $buttonsBox = $('<div/>', {
        class: 'cart-buttons-box'
      });
      $(this.container).text('Корзина');
      $cartItemsDiv.appendTo($(this.container)); //$totalProducts.appendTo($(this.container));

      $totalPrice.append($("<p>TOTAL</p>"));
      $totalPrice.append($("<p class=\"sum-price\"></p>"));
      $totalPrice.appendTo($(this.container));
      $buttonsBox.append($("<a class=\"button-site checkout-button\" href=\"checkout.html\">Checkout</a>"));
      $buttonsBox.append($("<a class=\"drop-cart-button\" href=\"shopping-cart.html\">Go to cart</a>"));
      $buttonsBox.appendTo($(this.container));
    }
  }, {
    key: "_init",
    value: function _init(source) {
      var _this = this;

      this._render();

      if (!localStorage.getItem('mycart')) {
        fetch(source).then(function (result) {
          return result.json();
        }).then(function (data) {
          var _iteratorNormalCompletion = true;
          var _didIteratorError = false;
          var _iteratorError = undefined;

          try {
            for (var _iterator = data.contents[Symbol.iterator](), _step; !(_iteratorNormalCompletion = (_step = _iterator.next()).done); _iteratorNormalCompletion = true) {
              var product = _step.value;

              _this.cartItems.push(product);

              _this._renderItem(product);
            }
          } catch (err) {
            _didIteratorError = true;
            _iteratorError = err;
          } finally {
            try {
              if (!_iteratorNormalCompletion && _iterator.return != null) {
                _iterator.return();
              }
            } finally {
              if (_didIteratorError) {
                throw _iteratorError;
              }
            }
          }

          _this.countGoods = data.countGoods;
          _this.amount = data.amount;
          localStorage.setItem('mycart', JSON.stringify(_this.cartItems));
          localStorage.setItem('countGoods', _this.countGoods);
          localStorage.setItem('amount', _this.amount);

          _this._renderSum();
        });
      } else {
        this.cartItems = JSON.parse(localStorage.getItem('mycart'));
        var _iteratorNormalCompletion2 = true;
        var _didIteratorError2 = false;
        var _iteratorError2 = undefined;

        try {
          for (var _iterator2 = this.cartItems[Symbol.iterator](), _step2; !(_iteratorNormalCompletion2 = (_step2 = _iterator2.next()).done); _iteratorNormalCompletion2 = true) {
            var product = _step2.value;

            this._renderItem(product);
          }
        } catch (err) {
          _didIteratorError2 = true;
          _iteratorError2 = err;
        } finally {
          try {
            if (!_iteratorNormalCompletion2 && _iterator2.return != null) {
              _iterator2.return();
            }
          } finally {
            if (_didIteratorError2) {
              throw _iteratorError2;
            }
          }
        }

        this.countGoods = JSON.parse(localStorage.getItem('countGoods'));
        this.amount = JSON.parse(localStorage.getItem('amount'));

        this._renderSum();
      }
    }
  }, {
    key: "_renderSum",
    value: function _renderSum() {
      //$('.sum-amount').text(`Всего товаров в корзине: ${this.countGoods}`);
      $('.sum-price').text("$".concat(this.amount));
      if (this.countGoods === 0) $(this.container).hide();
    }
  }, {
    key: "_renderItem",
    value: function _renderItem(product) {
      var _this2 = this;

      var $container = $('<div/>', {
        class: 'cart-item-box'
      });
      var $itemContainer = $('<div/>', {
        class: 'cart-item-container'
      });
      var $itemLinkImg = $('<a/>', {
        class: 'single-page-link',
        href: 'single-page.html'
      });
      var $itemInfo = $('<div/>', {
        class: 'cart-product-info',
        'data-product': product.id_product
      });
      var $itemLinkName = $('<a/>', {
        class: 'single-page-link',
        href: 'single-page.html'
      });
      var $delButton = $('<a>', {
        class: 'cart-del-item',
        href: "#del_".concat(product.id_product),
        'data-product': product.id_product
      });
      $itemLinkImg.append($("<img class=\"cart-img\" src=\"".concat(product.min_img, "\" alt=\"product1\">")));
      $itemLinkImg.appendTo($itemContainer);
      $itemLinkName.append($("<h3>".concat(product.product_name, "</h3>")));
      $itemLinkName.appendTo($itemInfo);
      $itemInfo.append($("<i class=\"fas fa-star item-stars\"></i>"));
      $itemInfo.append($("<i class=\"fas fa-star item-stars\"></i>"));
      $itemInfo.append($("<i class=\"fas fa-star item-stars\"></i>"));
      $itemInfo.append($("<i class=\"fas fa-star item-stars\"></i>"));
      $itemInfo.append($("<i class=\"fas fa-star-half-alt item-stars\"></i>"));
      $itemInfo.append($("<p> <span class=\"product-quantity\">".concat(product.quantity, "</span> x \n                            <span class=\"product-price\">$").concat(product.price, "</span></p>")));
      $itemInfo.appendTo($itemContainer);
      $delButton.on('click', function (event) {
        return _this2._remove(event.target.parentNode);
      });
      $delButton.append($("<i class=\"fas fa-times-circle\"></i>"));
      $delButton.appendTo($itemContainer);
      $itemContainer.appendTo($container);
      $container.appendTo($('.cart-items-wrap'));
    }
  }, {
    key: "_updateCart",
    value: function _updateCart(product) {
      var $container = $("div[data-product=\"".concat(product.id_product, "\"]"));
      $container.find('.product-quantity').text(product.quantity);
      $container.find('.product-price').text("$".concat(product.price));
    }
  }, {
    key: "addProduct",
    value: function addProduct(element) {
      var productId = +$(element).data('id');
      var find = this.cartItems.find(function (product) {
        return product.id_product === productId;
      });

      if (find) {
        find.quantity++;
        this.countGoods++;
        this.amount += find.price;

        this._updateCart(find);
      } else {
        var product = {
          id_product: productId,
          price: +$(element).data('price'),
          product_name: $(element).data('title'),
          min_img: $(element).data('img'),
          quantity: 1
        };
        this.cartItems.push(product);
        this.countGoods++;
        this.amount += product.price;

        this._renderItem(product);

        $(this.container).show();
      }

      localStorage.setItem('mycart', JSON.stringify(this.cartItems));
      localStorage.setItem('countGoods', this.countGoods);
      localStorage.setItem('amount', this.amount);

      this._renderSum();
    }
  }, {
    key: "_remove",
    value: function _remove(element) {
      var productId = $(element).data('product');
      var find = this.cartItems.find(function (product) {
        return product.id_product === productId;
      });

      if (find) {
        find.quantity--;
        this.countGoods--;
        this.amount -= find.price;

        if (find.quantity === 0) {
          element.parentNode.parentNode.remove();
          var findIndex = this.cartItems.findIndex(function (product) {
            return product.id_product === productId;
          });
          this.cartItems.splice(findIndex, 1);
        }

        if (this.countGoods === 0) $(this.container).hide();else this._updateCart(find);
      } else {
        console.log('error');
      }

      localStorage.setItem('mycart', JSON.stringify(this.cartItems));
      localStorage.setItem('countGoods', this.countGoods);
      localStorage.setItem('amount', this.amount);

      this._renderSum();
    }
  }]);

  return Cart;
}();