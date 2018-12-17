$(document).ready(() => {

  const settings = {
    productsCountOnPage: {
      "": 8,
      index: 8,
      product: 9,
      "single-page": 4,
    },
    productsContainerOnPge: {
      "": '.items-list',
      index: '.items-list',
      product: '.items-container',
      "single-page": '.items-list',
    },
    cartContainers: {
      "": '.cart-list-container',
      index: '.cart-list-container',
      product: '.cart-list-container',
      "single-page": '.cart-list-container',
      "shopping-cart": '.cart-product-box',
    },
    sources: {
      items: 'getProduct.json',
      cart: 'getCart.json',
    },
  };
  // Товары
  const products = [];
  const pageName = window.location.pathname.split("/").pop().split(".").shift();
  const productCountOnPage = settings.productsCountOnPage[pageName];
  const productsContainerOnPge = settings.productsContainerOnPge[pageName];
  const cartContainerOnPge = settings.cartContainers[pageName];

  // Корзина
  let cart = new Cart(settings.sources.cart,cartContainerOnPge,pageName === "shopping-cart");

  if (productCountOnPage !== 0) {
    fetch(settings.sources.items)
      .then(result => result.json())
      .then(data => {
        for (let i = 0; i < productCountOnPage; i++) {
          products
            .push(
              new Product(
                data[i].id_product,
                data[i].product_name,
                data[i].price,
                productsContainerOnPge,
                data[i].img,
                data[i].min_img
              )
            );
        }
        // Добавление товара в корзину
        $('.buyBtn').click(e => {
          cart.addProduct(e.target);
        });
      });
  }
});