<?php

?>
  <div class="form_container">
    <form class="form" method="post" action="?c=user&act=newUser">
      <?=getMSG();?>
      <input type="text" name="login" placeholder="Имя пользователя" class="form__input" required>
      <input type="text" name="name" placeholder="Имя" class="form__input" required>
      <input type="password" name="password" placeholder="Пароль" class="form__input" required>
      <input type="submit" class="menu-btn__form" value="Регистрация">
    </form>
  </div>