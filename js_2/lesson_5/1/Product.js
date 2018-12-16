class Product {
    constructor(id, title, price, img = 'https://placehold.it/200x150',
                container = '#products', product_img = 'https://placehold.it/72x85'){
        this.id = id;
        this.title = title;
        this.price = price;
        this.img = img;
        this.container = container;
        this.product_img = product_img;
        this._render();
    }
    _render(){
        let $wrapper = $('<div/>', {
            class: 'product'
        });
        // let $wrapper1 = $(`<div class="product"></div>`);
        let $img = $('<img/>', {
            src: this.img
        });
        let $desc = $('<div/>', {
            class: 'desc'
        });
        let $name = $('<p/>', {
            text: this.title
        });
        let $price = $(`<p>Цена: <span class="product-price">${this.price}</span> руб.</p>`);

        let $buyBtn = $('<button/>', {
            class: 'buyBtn',
            text: 'Купить',
            'data-id': this.id,
            'data-price': this.price,
            'data-title': this.title
        });

        // $buyBtn.click()


        // Создаем структуру товара (верстку)
        $img.appendTo($wrapper);
        $name.appendTo($desc);
        $price.appendTo($desc);
        $buyBtn.appendTo($desc);
        $desc.appendTo($wrapper);
        $(this.container).append($wrapper);
    }
}