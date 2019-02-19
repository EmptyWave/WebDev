<?php

abstract class Good{
  private $name;
  private $count;
  private $price;
  private $brand;
  private $lifeTime;
  private $salesNum=0;

  function __construct($name,$count,$price,$brand,$lifeTime){
    $this->setName($name);
    $this->setCount($count);
    $this->setPrise($price);
    $this->setBrand($brand);
    $this->setLifeTime($lifeTime);
  }

  function setName($name){
    $this->name = $name;
  }
  function setCount($count){
    $this->count = $count;
  }
  function setPrise($price){
    $this->price = $price;
  }
  function setBrand($brand){
    $this->brand = $brand;
  }
  function setLifeTime($lifeTime){
    $this->lifeTime = $lifeTime;
  }
  function setSalesNum($alesNum){
    $this->alesNum = $alesNum;
  }

  function getName(){
    return $this->name;
  }
  function getCount(){
    return $this->count;
  }
  function getPrice(){
    return $this->price;
  }
  function getBrand(){
    return $this->brand;
  }
  function getLifeTime(){
    return $this->lifeTime;
  }

  function getGood(){
    $good['name'] = $this->name ;
    $good['count'] = $this->count ;
    $good['price'] = $this->price ;
    $good['brand'] = $this->brand ;
    $good['lifeTime'] = $this->lifeTime ;
    return $good;
  }

  function incSalesNum(){
    inc($this->salesNum);
  }
  function CountUpSalesRevenue(){
    return $this->salesNum*$this->price;
  }

  abstract function getTotalCost();

}