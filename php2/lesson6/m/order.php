<?php
/**
 * Created by PhpStorm.
 * User: EmptyWave
 * Date: 06.03.2019
 * Time: 22:50
 */

include_once('data/config.php');

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

function getDB(){
    $connectString = DB_DRIVER.':host=' . DB_HOST . ';dbname=' . DB_NAME . ';charset=UTF8;';
    return new PDO($connectString, DB_USER, DB_PASS,
        [
            PDO::ATTR_DEFAULT_FETCH_MODE => PDO::FETCH_ASSOC,
            PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION
        ]
    );
}

function getOrders(){ // TODO: in perspective - $order_num
    $db = getDB();
    $user_id = $_SESSION['user_id'];
    if (isAdmin()) {
        $sql = "SELECT * FROM zakaz WHERE order_state <= 6";
    }
    else  {
        $sql = "SELECT * FROM zakaz where user_id = '$user_id' AND order_state < 6";
    }

    $orders = $db->query($sql)->fetchAll();

    if ($orders){
        for ($i = 0; $i<count($orders); $i++){
            $orders[$i]['order_info'] = json_decode($orders[$i]['order_info'],true);
            $orders[$i]['order_data'] = json_decode($orders[$i]['order_data'],true);
        }
        return $orders;
    }
    return NULL;
}

function updateOrderState($order_id,$order_state){
    $db = getDB();
    $state = $db->exec("UPDATE `zakaz` SET `order_state`='$order_state' WHERE order_id = '$order_id'");
    if ($state) return;
    $_SESSION['msg'] = 'Не удалось обновить запись';
    return;
}