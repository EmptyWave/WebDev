<?php
/**
 * Created by PhpStorm.
 * User: EmptyWave
 * Date: 08.03.2019
 * Time: 14:55
 */

class cart
{
  private $user_id;
  private $cart_data;
  private $cart_price;
  private $cart_state;
  private $cart_count;
  private $db;

  public function __construct($user_id = 0)
  {
    $this->db = new db();
    $this->setUserId($user_id);
    $this->setPrice(0);
    $this->setState(0);
    $this->setCount(0);
  }

  public function setUserId($user_id)
  {
    $this->user_id = $user_id;
  }

  public function setCartData($cart_data)
  {
    $this->cart_data = $cart_data;
  }

  public function setPrice($cart_price)
  {
    $this->cart_price = $cart_price;
  }

  public function setState($cart_state)
  {
    $this->cart_state = $cart_state;
  }

  public function setCount($cart_count)
  {
    $this->cart_count = $cart_count;
  }

  public function getUserId()
  {
    return $this->user_id;
  }

  public function getData()
  {
    return $this->cart_data;
  }

  public function getPrice()
  {
    return $this->cart_price;
  }

  public function getState()
  {
    return $this->cart_state;
  }

  public function getCount()
  {
    return $this->cart_count;
  }

  public function incCount()
  {
    $this->cart_count++;
  }

  public function decCount()
  {
    if ($this->cart_count > 0) $this->cart_count--;
  }

  public function updateCartPrice($price, $key = PLUS)
  {
    switch ($key) {
      case PLUS:
        $this->cart_price += $price;
        break;
      case MINUS:
        $this->cart_price -= $price;
        break;
    }
  }

  public function sessionIsEmpty()
  {
    return !isset($_SESSION['cart']);
  }

  public function getSessionCart()
  {
    $sessionCart = json_decode($_SESSION['cart'], true);
    $this->setUserId($sessionCart['user_id']);
    $this->setCartData($sessionCart['cart_data']);
    $this->setPrice($sessionCart['cart_price']);
    $this->setState($sessionCart['cart_state']);
    $this->setCount($sessionCart['cart_count']);
    return $sessionCart;
  }

  public function setSessionCart()
  {
    $cart['user_id'] = $this->getUserId();
    $cart['cart_data'] = $this->getData();
    $cart['cart_price'] = $this->getPrice();
    $cart['cart_state'] = $this->getState();
    $cart['cart_count'] = $this->getCount();
    $_SESSION['cart'] = json_encode($cart);
  }

  public function setNewGood($id)
  {
    $good = $this->db->select('items', 'id', $id);
    if ($good) {
      $this->incCount();
      $count = 1;
      if (!is_null($this->cart_data)) {
        for ($i = 0; $i < count($this->cart_data); $i++) {
          if ($this->cart_data[$i]['id'] == $id) {
            $this->cart_data[$i]['count']++;
            $count = 0;
            break;
          }
        }
      }
      if ($count == 1) $this->cart_data[] = ['id' => $good['id'],'name' => $good['name'], 'price' => $good['price'], 'count' => $count];
      $this->updateCartPrice($good['price']);
      $this->setSessionCart();
    }
    return NULL;
  }

  public function resetGood($id)
  {
    $this->decCount();
    for ($i = 0; $i < count($this->cart_data); $i++) {
      if ($this->cart_data[$i]['id'] == $id) {
        $price = $this->cart_data[$i]['price'];
        $this->cart_data[$i]['count'] > 1 ? $this->cart_data[$i]['count']-- : $this->dellGood($i);
        break;
      }
    }
    $this->updateCartPrice($price, MINUS);
    $this->cart_count !== 0 ? $this->setSessionCart(): $this->dellCart();
  }

  public function dellGood($i)
  {
    array_splice($this->cart_data, $i,1);
  }

  function dellCart(){
    $this->unsetSessionCart();
    unset($this->cart_data);
  }
  public function unsetSessionCart()
  {
    unset($_SESSION['cart']);
  }

  public function getViewData()
  {
    $goods = [];
    foreach ($this->cart_data as $data) {
      $goods[] = $this->db->select('items', 'id', $data['id']);
    }
    $viewData = [];
    foreach ($goods as $good) {
      $id = $good['id'];
      unset($good['id']);
      $viewData[$id] = $good;
    }
    return $viewData;

  }

}