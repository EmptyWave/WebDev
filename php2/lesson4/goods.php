<?php

include_once 'config.php';
$itemCount = 10;

if ($_SERVER['REQUEST_METHOD'] == "POST") {
  if (isset($_POST['page'])){
    $data = [];
    $startRow = ($_POST['page']-1) * $itemCount;
    $sql = "SELECT id, name, price, about, `img-min` FROM items LIMIT {$startRow}, {$itemCount}";
    $res = mysqli_query(connect(), $sql);
    while ($row = mysqli_fetch_assoc($res)) {
      array_push($data, $row);
    }
    echo json_encode($data);
  }
}