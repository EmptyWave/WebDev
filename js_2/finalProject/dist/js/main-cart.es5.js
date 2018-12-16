"use strict";

$(document).ready(function () {
  // Товары
  var product1 = new Product(123, 'Ноутбук', 45600);
  var product2 = new Product(124, 'Мышь', 600);
  var product3 = new Product(125, 'Клавиатура', 1600);
  var product4 = new Product(456, 'Мышка', 1000); // Корзина

  var cart = new Cart('getCart.json'); // Добавление товара в корзину

  $('.buyBtn').click(function (e) {
    cart.addProduct(e.target);
  });
});