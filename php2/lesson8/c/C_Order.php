<?php
/**
 * Created by PhpStorm.
 * User: EmptyWave
 * Date: 06.03.2019
 * Time: 22:49
 */

include_once('m/order.php');

class C_Order extends C_Base
{
  public function action_index()
  {
    $this->title .= '::Заказы';
    $order = new order();
    if ($this->isPost()) {
      $orders = $order->getOrders($_POST['order_num']);
      $MSG = is_null($orders) ? 'Номер заказа не найден' : '';
    }elseif ($this->isGet()){
      $orders = $order->getOrders($_GET['order']);
      $MSG = is_null($orders)&&isAuthorized() ? 'Номер заказа не найден' : '';
    }else{
      $orders = $order->getOrders();
      $MSG = is_null($orders)&&isAuthorized() ? 'У вас нет активных заказов' : '';
    }
    $this->content = $this->Template('v/v_order.php', array('orders' => $orders,
                                                                    'msg' => $MSG));
  }

  public function action_state()
  {
    if ($this->isPost()) {
      if (isset($_POST['order_id']) && isset($_POST['order_state'])) {
        $order = new order();
        $order_id = $_POST['order_id'];
        $order_state = $_POST['order_state'];
        $order->updateOrderState($order_id, $order_state);
      }
    }
    header('Location: ?c=order');
  }

  public function action_new(){
    $cart = new cart();
    $cartData = $cart->getSessionCart();
    $viewData = $cart->getViewData();
    $this->title .= '::Оформление заказа';
    $this->content = $this->Template('v/v_newOrder.php', array('cart' => $cartData,
                                                                       'view' => $viewData));
  }
  public function action_setNew(){
    if (isAuthorized()) {// TODO: автозаполнение для существующих пользователей
      $order_info['name'] = $_SESSION['user_name'];
      $order_info['phone'] = '88005553535';//$_SESSION['user_phone'];
      $order_info['address'] = 'Где-то на Земле';//$_SESSION['user_address'];
    }elseif ($this->isPost()) {
      $order_info['name'] = isset($_POST['name']) ? $_POST['name'] : NULL;
      $order_info['phone'] = isset($_POST['phone']) ? $_POST['phone'] : NULL;
      $order_info['address'] = isset($_POST['address']) ? $_POST['address'] : NULL;
    }
    if (isset($order_info)){
      $order = new order();
      $orderNum = $order->setNewOrder($order_info);
      if (!is_null($orderNum)){
        $cart = new cart();
        $cart->dellCart();
        if (isAuthorized())
          header("Location: ?c=order");
        else
          header("Location: ?c=order&order=$orderNum");
      }else
        header("Location: ?c=order&act=new");

    }

  }
}