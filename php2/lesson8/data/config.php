<?php

define('DB_DRIVER','mysql');
define('DB_HOST','localhost');
define('DB_NAME','gbphp');
define('DB_USER','root');
define('DB_PASS','');
define('WRONG_DATA','NULL');
define('PLUS','+');
define('MINUS','-');

function isAuthorized(){
    return isAdmin()||isUser();
}

function isAdmin(){
    return $_SESSION['user_type'] == 9;
}

function isUser(){
    return $_SESSION['user_type'] == 1;
}

function getLogin(){
    return $_SESSION['user_login'];
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

function getOrderState($state){
    switch ($state){
        case 1: return "В обработке";
        case 2: return "Подтвержден";
        case 3: return "Подготовка к отправке";
        case 4: return "Отправлен";
        case 5: return "Доставлен";
        case 6: return "Исполнен";
    }
    return "Err:OrderStateCode_isWrong!";
}

function getCartCount(){
    $cart = json_decode($_SESSION['cart'],true);
    return $cart['cart_count'];
}

