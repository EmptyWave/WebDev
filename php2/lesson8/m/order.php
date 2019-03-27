<?php
/**
 * Created by PhpStorm.
 * User: EmptyWave
 * Date: 08.03.2019
 * Time: 11:51
 */

class order
{
  private $db; //TODO: перевести обращение к базе

  public function __construct()
  {
    $this->db = new db();
  }
  public function getOrderState($state)
  {
    switch ($state) {
      case 1:
        return "В обработке";
      case 2:
        return "Подтвержден";
      case 3:
        return "Подготовка к отправке";
      case 4:
        return "Отправлен";
      case 5:
        return "Доставлен";
      case 6:
        return "Исполнен";
    }
    return "Err:OrderStateCode_isWrong!";
  }

  public function getDB()
  {
    $connectString = DB_DRIVER . ':host=' . DB_HOST . ';dbname=' . DB_NAME . ';charset=UTF8;';
    return new PDO($connectString, DB_USER, DB_PASS,
      [
        PDO::ATTR_DEFAULT_FETCH_MODE => PDO::FETCH_ASSOC,
        PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION
      ]
    );
  }

  public function getOrders($order_num = 0)
  {
    $db = $this->getDB();
    $user_id = $_SESSION['user_id'];
    if (isAdmin()) {
      $sql = "SELECT * FROM zakaz WHERE order_state <= 6";
    } elseif (isUser()) {
      $sql = "SELECT * FROM zakaz WHERE user_id = '$user_id' AND order_state < 6";
    } elseif ($order_num !== 0) {
      $sql = "SELECT * FROM zakaz WHERE order_num = '$order_num' AND order_state < 6";
    } else return NULL;

    $orders = $db->query($sql)->fetchAll();

    if ($orders) {
      for ($i = 0; $i < count($orders); $i++) {
        $orders[$i]['order_info'] = json_decode($orders[$i]['order_info'], true);
        $orders[$i]['order_data'] = json_decode($orders[$i]['order_data'], true);
      }
      return $orders;
    }
    return NULL;
  }

  public function setOrderNumDB($order_id)
  {
    $order_num = $this->genOrderNum($order_id);
    $db = $this->getDB();
    $num = $db->exec("UPDATE `zakaz` SET `order_num`='$order_num' WHERE order_id = '$order_id'");
    if ($num) return;
    $_SESSION['msg'] = 'Не удалось обновить - номер заказа';
    return;
  }

  public function genOrderNum($order_id)
  {
    $date = date("Y_m_d_H_i_s");
    return $order_id . $date;
  }

  public function updateOrderState($order_id, $order_state)
  {
    $db = $this->getDB();
    $state = $db->exec("UPDATE `zakaz` SET `order_state`='$order_state' WHERE order_id = '$order_id'");
    if ($state) return;
    $_SESSION['msg'] = 'Не удалось обновить - состояние заказа';
    return;
  }

  public function setNewOrder($order_info)
  {
    $db = $this->getDB();
    $sessionCart = $this->getSessionCart();
    $date = date("mdHis");
    $user_id = $sessionCart['user_id'];
    $order_num = $user_id.'8'.$date;
    $order_data = json_encode($sessionCart['cart_data'],JSON_UNESCAPED_UNICODE);
    $order_info = json_encode($order_info,JSON_UNESCAPED_UNICODE);
    $state = $db->exec("INSERT INTO `zakaz` (`order_num`,`user_id`,`order_info`,`order_data`,`order_state`)
                                 VALUES ('$order_num','$user_id','$order_info','$order_data','1')");
    if ($state) return $order_num;
    $_SESSION['msg'] = 'Не удалось создать заказ, попробуйте еще раз';
    return NULL;
  }

  public function getSessionCart()
  {
    $sessionCart = json_decode($_SESSION['cart'], true);
    return $sessionCart;
  }

}