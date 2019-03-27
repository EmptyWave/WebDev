<?php

?>

<div class="cart__container">
  <? foreach ($cart['cart_data'] as $good) { ?>
    <div class="cart__item__order">
        <div class="cart__item-text">
          <h3><?= $view[$good['id']]['name'] ?></h3>
          <p>Количество: <?= $good['count'] ?></p>
          <p>Стоимость: <?= $good['count'] ?> х <?= $good['price'] ?>$ = <?= $good['count']*$good['price'] ?>$</p>
        </div>
    </div>
  <? } ?>
</div>
<div class="cart__price">
  <h3>Общая стоимость: <?=$cart['cart_price']?>$</h3>
</div>
<div class="form_container">
  <form class="form__line" method="post" accept-charset="UTF-8" action="?c=order&act=setNew">
    <?=getMSG();?>
    <? if (!isAuthorized()){?>
    <input type="text" name="name" placeholder="Имя" class="form__input" required>
    <input type="tel" name="phone" placeholder="Номер телефона" class="form__input" required>
    <input type="text" name="address" placeholder="Адрес" class="form__input__line" required>
    <?}?>
    <input type="submit" class="menu-btn__form__line" value="Заказать">
  </form>
</div>
