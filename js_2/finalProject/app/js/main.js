$(document).ready(() => {
  // Товары
  const products = [];
  const productCountPage = 16;

  // Корзина
  let cart = new Cart('getCart.json');

  fetch('getProduct.json')
    .then(result => result.json())
    .then(data => {
      for (let i = 0; i < productCountPage; i++) {
        products
          .push(
            new Product(
              data[i].id_product,
              data[i].product_name,
              data[i].price,
              '.items-list'
              /*product.img,
              product.min_img*/
            )
          );
      }
      // Добавление товара в корзину
      $('.buyBtn').click(e => {
        cart.addProduct(e.target);
      });
    });


});