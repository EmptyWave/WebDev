<?php

?>

<form method="post" action="?c=user&act=newUser">
    <input type="text" name="login" placeholder="login" required>
    <input type="text" name="name" placeholder="name" required>
    <input type="text" name="password" placeholder="password" required>
    <input type="submit" value="Регистрация">
</form>
<?=getMSG();