<?php

define('DB_DRIVER','mysql');
define('DB_HOST','localhost');
define('DB_NAME','gbphp');
define('DB_USER','root');
define('DB_PASS','');
define('WRONG_DATA','NULL');

function isAuthorized(){
    return isAdmin()||isUser();
}

function isAdmin(){
    return $_SESSION['user_type'] == 9;
}

function isUser(){
    return $_SESSION['user_type'] == 1;
}

function getMSG(){
    if (isset($_SESSION['msg'])) {
        $msg = $_SESSION['msg'];
        unset($_SESSION['msg']);
        return $msg;
    }
    return;
}

function isWrongData($data){
    return $data == WRONG_DATA;
}

