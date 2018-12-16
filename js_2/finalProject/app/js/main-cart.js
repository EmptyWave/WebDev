$(document).ready(() => {
   // Товары
   let product1 = new Product(123, 'Ноутбук', 45600);
   let product2 = new Product(124, 'Мышь', 600);
   let product3 = new Product(125, 'Клавиатура', 1600);
  let product4 = new Product(456, 'Мышка', 1000);

   // Корзина
    let cart = new Cart('getCart.json');

    // Добавление товара в корзину
    $('.buyBtn').click(e => {
        cart.addProduct(e.target);
    })
});