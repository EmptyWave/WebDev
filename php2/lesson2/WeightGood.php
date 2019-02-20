<?php
include "Good.php";

class WeightGood extends Good {
  private $weight;

  function __construct($name,$count,$price,$brand,$lifeTime,$weight){
    parent::__construct($name,$count,$price,$brand,$lifeTime);
    $this->setWeight($weight);
  }
  function setWeight($weight){
    $this->weight = $weight;
  }
  function getWeight(){
    return $this->weight;
  }
  function getGood(){
    $good = parent::getGood();
    $good['weight'] = $this->weight;
    return $good;
  }

  function getTotalCost()
  {
    return $this->getPrice() * $this->getWeight();
  }
}