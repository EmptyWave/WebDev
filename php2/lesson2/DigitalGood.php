<?php
include "PieceGood.php";

class DigitalGood extends PieceGood{

  function __construct($name, $count, $price, $brand, $lifeTime, $unitCount){
    parent::__construct($name, $count, $price/2, $brand, $lifeTime,$unitCount);
  }

}