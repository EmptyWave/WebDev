<?php
/**
 * Created by PhpStorm.
 * User: EmptyWave
 * Date: 08.03.2019
 * Time: 14:54
 */

class C_Cart extends C_Base
{
    public function action_index(){
        $this->title .= '::Корзина';
        $cart = new cart();
        if ($cart->sessionIsEmpty()){
            $MSG = "Ваша корзна пуста";
        }else{
            $cartData = $cart->getSessionCart();
            $viewData = $cart->getViewData();
        }

        $this->content = $this->Template('v/v_cart.php', array('cart' => $cartData,
                                                                        'view' => $viewData ,
                                                                        'msg' => $MSG));
    }

    public function action_add(){
        if ($this->isGet()){
            if (isset($_GET['id'])){
                $id = $_GET['id'];
                $cart = new cart();
                if (!$cart->sessionIsEmpty()){
                    $cart->getSessionCart();
                }
                $cart->setNewGood($id);
                // TODO: add new good in cart;
            }
        }
        header("Location: {$_SERVER['HTTP_REFERER']}");
    }
}