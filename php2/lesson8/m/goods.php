<?php
/**
 * Created by PhpStorm.
 * User: EmptyWave
 * Date: 08.03.2019
 * Time: 14:53
 */

$itemCount = 10;

if ($_SERVER['REQUEST_METHOD'] == "POST") {
    include_once('../data/config.php');
    include_once ('db.php');
    if (isset($_POST['page'])){
        $page = $_POST['page'];
        $startRow = ($_POST['page']-1) * $itemCount;
        $goods = new goods;
        $data = $goods->getData($startRow,$itemCount);
        echo $data;
    }
}

class goods
{
    public function getData($startRow,$itemCount){
        $db = new db();
        $data = $db->selectLimit('items',$startRow,$itemCount);
        if ($data){
            return json_encode($data);
        }
        return NULL;
    }

    public function getGood($open_id){
        $db = new db();
        $good = $db->select('items','id',$open_id);
        if ($good){
            return $good;
        }
        return NULL;
    }
}