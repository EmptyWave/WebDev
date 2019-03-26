<?php
/**
 * Created by PhpStorm.
 * User: EmptyWave
 * Date: 08.03.2019
 * Time: 14:54
 */

//include_once ('m/goods.php');

class C_Goods extends C_Base
{
    public function action_index(){
        $this->title .= '::Каталог товаров';
        $this->content = $this->Template('v/v_goods.php', array());
    }

    public function action_open(){
        if ($this->IsGet()){
            $open_id = $_GET['id'];
            $goods = new goods();
            $good = $goods->getGood($open_id);
            $this->title .= "::{$good['name']}";
            $this->content = $this->Template('v/v_good.php', array('good'=>$good));
        }
    }
/*    public function action_goods(){
        $itemCount = 10;

        if ($this->isPost()) {
            if (isset($_POST['page'])){
                $startRow = ($_POST['page']-1) * $itemCount;
                $goods = new goods;
                $data = $goods->getData($startRow,$itemCount);
                echo $data;
            }
        }
    }*/
}