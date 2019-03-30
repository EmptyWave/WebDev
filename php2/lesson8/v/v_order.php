<?php

?>

<? if (isAuthorized() or !is_null($orders)){?>
<div class="orders_container">
    <?
    if (is_null($orders)){?>
      <div class="cart__btns"><?= $msg;?></div>
    <?}else
      foreach ($orders as $order) {?>
        <div class="order" data-id="<?=$order['order_id']?>">
            <div class="order_box">
                <h3>Заказ № <?=$order['order_num']?> | Состояние: <?=getOrderState($order['order_state'])?></h3>
                <? foreach ($order['order_info'] as $key=>$data) {?>
                    <p><?=$key?>: <?=$data?></p>
                <? } ?>
                <h4>Товары:</h4>
                <? foreach ($order['order_data'] as $goods) {?>
                    <p><?=$goods['name']?> | Кол-во: <?=$goods['count']?></p>
                <? } ?>
            </div>
            <? if (isAdmin()){?>
                <div class="order_ctrl">
                    <form action="?c=order&act=state" method="post">
                        <p><select name="order_state">
                            <option value="2"><?=getOrderState(2)?></option>
                            <option value="3"><?=getOrderState(3)?></option>
                            <option value="4"><?=getOrderState(4)?></option>
                            <option value="5"><?=getOrderState(5)?></option>
                            <option value="6"><?=getOrderState(6)?></option>
                        </select></p>
                        <input type="hidden" name="order_id" value="<?=$order['order_id']?>" required>
                        <input type="submit" value="Изменить">
                    </form>
                </div>
            <?}?>
        </div>
    <?}?>
</div>
<?}else{?>
  <div class="form_container">
    <form class="form" method="post" action="?c=order">
      <?=$msg;?>
      <input type="text" name="order_num" placeholder="Номер заказа" class="form__input" required>
      <input type="submit" class="menu-btn__form" value="Проверить">
    </form>
  </div>
<?}?>