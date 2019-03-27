<?php
/**
 * Created by PhpStorm.
 * User: EmptyWave
 * Date: 08.03.2019
 * Time: 14:55
 */
?>


<div class="single-product-img">
    <div class="single-product-slider">
        <img src="<?=$good['img-max'].'/000/fff'?>">
    </div>
</div>
<div class="product-menu">
    <div class="container">
        <section class="product-menu-container">
            <h3 class="product-menu-container-h3"><?=$good['name']?></h3>
            <h4 class="product-menu-container-h4">Category - <?=$good['category_id']?></h4>
            <div class="product-menu-text-container"><?=$good['about']?></div>
            <div class="product-tech">
                <p class="protuct-tech-text">MATERIAL: <span class="tech-info"><?=$good['material']?></span></p>
                <p class="protuct-tech-text">DESIGNER: <span class="tech-info"><?=$good['brand']?></span></p>
            </div>
            <p class="price"><?=$good['price']?>$</p>
            <a href="?c=cart&act=add&id=<?=$good['id']?>" class="menu__btn">Добавить в корзину</a>
        </section>
    </div>
</div>