<?php

class order{
  private $id;
  private $identifier;
  private $fio;
  private $phone;
  private $mail;
  private $goods;
  private $state=0;

  function __construct($id,$fio,$phone,$mail,$goods){
    $this->setId($id);
    $this->setFIO($fio);
    $this->setPhone($phone);
    $this->setMail($mail);
    $this->setGoods($goods);
    $this->genIdentifier($id);
    $this->setState(1);
  }

  function setId($id){
    $this->id = $id;
  }
  function setFIO($fio){
    $this->fio = $fio;
  }
  function setPhone($phone){
    $this->phone = $phone;
  }
  function setMail($mail){
    $this->mail = $mail;
  }
  function setGoods($goods){
    $this->goods = $goods;
  }
  function genIdentifier($id){
    $this->identifier = date("His").$id;
  }
  function setState($state){
    $this->state = $state;
  }

  function getOrder(){
    $order['id'] = $this->getId();
    $order['fio'] = $this->getFIO();
    $order['phone'] = $this->getPhone();
    $order['mail'] = $this->getMail();
    $order['goods'] = $this->getGoods();
    $order['identifier'] = $this->getIdentifier();
    $order['state'] = $this->getState();
    return $order;
  }

  function getId(){
    return $this->id;
  }
  function getFIO(){
    return $this->fio;
  }
  function getPhone(){
    return $this->phone;
  }
  function getMail(){
    return $this->mail;
  }
  function getGoods(){
    return $this->goods;
  }
  function getIdentifier(){
    return $this->identifier;
  }
  function getState(){
    return $this->state;
  }
}