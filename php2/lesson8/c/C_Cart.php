<?php
/**
 * Created by PhpStorm.
 * User: EmptyWave
 * Date: 08.03.2019
 * Time: 14:54
 */

class C_Cart extends C_Base
{
  public function action_index()
  {
    $this->title .= '::Корзина';
    $cart = new cart();
    if ($cart->sessionIsEmpty()) {
      $MSG = "Ваша корзна пуста";
    } else {
      $cartData = $cart->getSessionCart();
      $viewData = $cart->getViewData();
    }

    $this->content = $this->Template('v/v_cart.php', array('cart' => $cartData,
      'view' => $viewData,
      'msg' => $MSG));
  }

  public function action_add()
  {
    if ($this->isGet()) {
      if (isset($_GET['id'])) {
        $id = $_GET['id'];
        if (isset($_SESSION['user_id']))
          $cart = new cart($_SESSION['user_id']);
        else
          $cart = new cart();

        if (!$cart->sessionIsEmpty()) {
          $cart->getSessionCart();
        }
        $cart->setNewGood($id);
      }
    }
    header("Location: {$_SERVER['HTTP_REFERER']}");
  }

  public function action_dell()
  {
    if ($this->isGet()) {
      if (isset($_GET['id'])) {
        $id = $_GET['id'];
        $cart = new cart();
        if (!$cart->sessionIsEmpty()) {
          $cart->getSessionCart();
        }
        $cart->resetGood($id);
      }
    }
    header("Location: {$_SERVER['HTTP_REFERER']}");
  }

  public function action_dellAll()
  {
    if ($this->isGet()) {
      $cart = new cart();
      if (!$cart->sessionIsEmpty()) {
        $cart->getSessionCart();
      }
      $cart->dellCart();
    }
    header("Location: {$_SERVER['HTTP_REFERER']}");
  }
}