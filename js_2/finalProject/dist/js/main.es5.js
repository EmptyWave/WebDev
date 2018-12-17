"use strict";

$(document).ready(function () {
  // Товары
  var products = [];
  var productCountPage = 16; // Корзина

  var cart = new Cart('getCart.json');
  fetch('getProduct.json').then(function (result) {
    return result.json();
  }).then(function (data) {
    for (var i = 0; i < productCountPage; i++) {
      products.push(new Product(data[i].id_product, data[i].product_name, data[i].price));
    } // Добавление товара в корзину


    $('.buyBtn').click(function (e) {
      cart.addProduct(e.target);
    });
  });
});