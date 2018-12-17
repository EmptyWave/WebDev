"use strict";

$(document).ready(function () {
  var settings = {
    productsCountOnPage: {
      "": 8,
      index: 8,
      product: 9,
      "single-page": 4
    },
    productsContainerOnPge: {
      "": '.items-list',
      index: '.items-list',
      product: '.items-container',
      "single-page": '.items-list'
    },
    cartContainer: '.cart-list-container',
    sources: {
      items: 'getProduct.json',
      cart: 'getCart.json'
    }
  }; // Товары

  var products = [];
  var pageName = window.location.pathname.split("/").pop().split(".").shift();
  var productCountOnPage = settings.productsCountOnPage[pageName];
  var productsContainerOnPge = settings.productsContainerOnPge[pageName]; // Корзина

  var cart = new Cart(settings.sources.cart, settings.cartContainer);
  fetch(settings.sources.items).then(function (result) {
    return result.json();
  }).then(function (data) {
    for (var i = 0; i < productCountOnPage; i++) {
      products.push(new Product(data[i].id_product, data[i].product_name, data[i].price, productsContainerOnPge, data[i].img, data[i].min_img));
    } // Добавление товара в корзину


    $('.buyBtn').click(function (e) {
      cart.addProduct(e.target);
    });
  });
});