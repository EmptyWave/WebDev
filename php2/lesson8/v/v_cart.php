<?php
/**
 * Created by PhpStorm.
 * User: EmptyWave
 * Date: 08.03.2019
 * Time: 14:55
 */
// TODO:
?>


<? if ($msg) {?>
  <div class="cart__btns"><?= $msg;?></div>
<?} else { ?>
  <div class="cart__btns">
    <a href='index.php?c=order&act=new' class="menu__btn new-order__btn">Оформить заказ</a>
    <a href='index.php?c=cart&act=dellAll' class="menu__btn new-order__btn">Очистить карзину</a>
  </div>
  <div class="cart__container">
    <? foreach ($cart['cart_data'] as $good) { ?>
      <div class="cart__item">
        <div class="cart__item-box">
          <img src="<?= $view[$good['id']]['img-min'] ?>"
               alt="<?= $view[$good['id']]['name'] ?>"
               class="cart__item__img">
          <div class="cart__item-text">
            <h3><?= $view[$good['id']]['name'] ?></h3>
            <p>Количество: <?= $good['count'] ?></p>
            <p>Стоимость: <?= $good['count'] ?> х <?= $good['price'] ?>$ = <?= $good['count']*$good['price'] ?>$</p>
          </div>
          <div class="cart__item__btn">
            <a href='index.php?c=cart&act=dell&id=<?=$good['id']?>' class="menu__btn new-order__btn">Удалить товар</a>
            <a href='index.php?c=cart&act=add&id=<?=$good['id']?>' class="menu__btn new-order__btn">Добавить товар</a>
          </div>
        </div>
      </div>
    <? } ?>
  </div>
  <div class="cart__price">
    <h3>Общая стоимость: <?=$cart['cart_price']?>$</h3>
  </div>
<? } ?>

