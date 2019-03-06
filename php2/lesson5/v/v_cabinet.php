<? $role = isAdmin()? "Admin" : "User"; ?>
<?="Hello, ".$_SESSION['user_name']."! Your role is - ". $role;