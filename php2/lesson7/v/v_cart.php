<?php
/**
 * Created by PhpStorm.
 * User: EmptyWave
 * Date: 08.03.2019
 * Time: 14:55
 */
// TODO:
?>


<? if ($msg) {echo $msg;}
else {?>
    <div class="cart__container">
        <? foreach ($cart['cart_data'] as $good) {?>
            <div class="cart__item">
                <div class="cart__item-box">
                    <div class="cart__item-img">
                        <img src="<?=$view[$good['id']]['img-min']?>" alt="<?=$view[$good['id']]['name']?>">
                    </div>
                    <div class="cart__item-text">
                        <h3><?=$view[$good['id']]['name']?></h3>
                        <p><?=$good['count']?></p>
                    </div>
                </div>
            </div>
        <?}?>
    </div>
<?}?>

