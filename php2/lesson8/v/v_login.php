<?php

?>
<div class="form_container">

  <form class="form" method="post" action="?c=user&act=auth">
    <?=getMSG();?>
    <input type="text" name="login" placeholder="Имя пользователя" class="form__input" required>
    <input type="password" name="password" placeholder="Пароль" class="form__input" required>
    <input type="submit" value="Вход" class="menu-btn__form">
  </form>
</div>

