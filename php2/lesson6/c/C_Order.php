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

    public function action_index(){
        $this->title .= '::Заказы';
        $orders = getOrders();
        $this->content = $this->Template('v/v_order.php', array('orders' => $orders));
    }

    public function action_state(){
        if ($this->isPost()){
            if (isset($_POST['order_id']) && isset($_POST['order_state'])){
                $order_id = $_POST['order_id'];
                $order_state = $_POST['order_state'];
                updateOrderState($order_id,$order_state);
            }
        }
        header('Location: ?c=order');
    }
}