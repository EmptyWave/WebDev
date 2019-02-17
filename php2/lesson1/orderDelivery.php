<?php
include "order.php";

class orderDelivery extends order{
  private $address;
  private $type;
  private $comment;

  function __construct($id,$fio,$phone,$mail,$goods,$address,$type,$comment){
    parent::__construct($id,$fio,$phone,$mail,$goods);
    $this->setAddress($address);
    $this->setType($type);
    $this->setComment($comment);
  }
  function setAddress($address){
    $this->address = $address;
  }
  function setType($type){
    $this->type = $type;
  }
  function setComment($comment){
    $this->comment = $comment;
  }

  function getOrder(){
    $order = parent::getOrder();
    $order['address'] = $this->getAddress();
    $order['type'] = $this->getType();
    $order['comment'] = $this->getComment();
    return $order;
  }

  function getAddress(){
    return $this->address;
  }
  function getType(){
    return $this->type;
  }
  function getComment(){
    return $this->comment;
  }
}