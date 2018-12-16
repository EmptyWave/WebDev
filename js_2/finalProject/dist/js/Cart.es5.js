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
      var $totalProducts = $('<div/>', {
        class: 'cart-summary sum-amount'
      });
      var $totalPrice = $('<div/>', {
        class: 'cart-summary sum-price'
      });
      $(this.container).text('Корзина');
      $cartItemsDiv.appendTo($(this.container));
      $totalProducts.appendTo($(this.container));
      $totalPrice.appendTo($(this.container));
    }
  }, {
    key: "_init",
    value: function _init(source) {
      var _this = this;

      this._render();

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

        _this._renderSum();
      });
    }
  }, {
    key: "_renderSum",
    value: function _renderSum() {
      $('.sum-amount').text("\u0412\u0441\u0435\u0433\u043E \u0442\u043E\u0432\u0430\u0440\u043E\u0432 \u0432 \u043A\u043E\u0440\u0437\u0438\u043D\u0435: ".concat(this.countGoods));
      $('.sum-price').text("\u041E\u0431\u0449\u0430\u044F \u0441\u0443\u043C\u043C\u0430: ".concat(this.amount, " \u0440\u0443\u0431"));
    }
  }, {
    key: "_renderItem",
    value: function _renderItem(product) {
      var _this2 = this;

      var $container = $('<div/>', {
        class: 'cart-item',
        'data-product': product.id_product
      });
      var $delButton = $('<button>', {
        class: 'delBtn',
        text: 'Удалить'
      });
      $delButton.on('click', function (event) {
        return _this2._remove(event.target.parentNode);
      });
      $container.append($("<p class=\"product-name\">".concat(product.product_name, "</p>")));
      $container.append($("<p class=\"product-quantity\">".concat(product.quantity, "</p>")));
      $container.append($("<p class=\"product-price\">".concat(product.price, " \u0440\u0443\u0431.</p>")));
      $container.append($delButton);
      $container.appendTo($('.cart-items-wrap'));
    }
  }, {
    key: "_updateCart",
    value: function _updateCart(product) {
      var $container = $("div[data-product=\"".concat(product.id_product, "\"]"));
      $container.find('.product-quantity').text(product.quantity);
      $container.find('.product-price').text("".concat(product.quantity * product.price, " \u0440\u0443\u0431"));
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
          quantity: 1
        };
        this.cartItems.push(product);
        this.countGoods++;
        this.amount += product.price;

        this._renderItem(product);
      }

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
          element.remove();
          var findIndex = this.cartItems.findIndex(function (product) {
            return product.id_product === productId;
          });
          this.cartItems.splice(findIndex, 1);
        } else this._updateCart(find);
      } else {
        console.log('error');
      }

      this._renderSum();
    }
  }]);

  return Cart;
}();