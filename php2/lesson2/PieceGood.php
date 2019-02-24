<?php
include "Good.php";

class PieceGood extends Good{
  private $unitCount;

  function __construct($name, $count, $price, $brand, $lifeTime,$unitCount)
  {
    parent::__construct($name, $count, $price, $brand, $lifeTime);
    $this->setUnitCount($unitCount);
  }
  function setUnitCount($unitCount){
    $this->unitCount = $unitCount;
  }
  function getUnitCount(){
    return $this->unitCount;
  }
  function getGood(){
    $good = parent::getGood();
    $good['UnitCount'] = $this->getUnitCount();
    return $good;
  }


  function getTotalCost()
  {
    return $this->getUnitCount() * $this->getPrice();
  }
}