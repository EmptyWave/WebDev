$(document).ready(() => {
  let page = 1;
  const productsContainerOnPge = '.item-list';
  let productCountOnPage = 25;
  const products = [];

  if (productCountOnPage !== 0) {
    getGoods(page);
  }
  $('.btnMoreGoods').click(e => {
    e.preventDefault();
    page++;
    getGoods(page);
  });

  async function getGoods(page) {
    $.ajax({
      url: 'm/goods.php',
      type: 'POST',
      data: {page: page},
      success: data => {
        const parseData = $.parseJSON(data);
        parseData.forEach( item => {
            products.push(
              new Product(
                item.id,
                item.name,
                item.price,
                productsContainerOnPge,
                item.img,
                item.min_img,
                item.about,
              )
            )
          }
        );
      },
    });
  }
});