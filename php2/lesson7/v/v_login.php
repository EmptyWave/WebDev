<?php

?>

<form method="post" action="?c=user&act=auth">
    <input type="text" name="login" placeholder="login" required>
    <input type="text" name="password" placeholder="password" required>
    <input type="submit" value="Вход">
</form>
<?=getMSG();