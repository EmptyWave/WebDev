<?php
session_start();
include_once 'config.php';
//include_once 'goods.php';
require_once 'Twig/Autoloader.php';
Twig_Autoloader::register();

try{

  $loader = new Twig_Loader_Filesystem('templates');
  $twig = new Twig_Environment($loader);

  $template = $twig->loadTemplate('good.tmpl');
  $data = [];

  /*$sql = "SELECT id, name, price, about, `img-min`
          FROM items
          ORDER BY id;";
  $res = mysqli_query(connect(), $sql);
  while ($row = mysqli_fetch_assoc($res)) {
    array_push($data,$row);
  }*/

/*  $goods = $template->render(array(
    'ContainerClassName' => 'galleryImgContainer',
    'ImgClassName' => 'galleryMinImg',
    'data' => $data,
  ));*/

  $template = $twig->loadTemplate('footer.tmpl');
  $footer = $template->render(array ());

  $template = $twig->loadTemplate('main.tmpl');
  $content = $template->render(array(
    'style' => 'css/style.css',
    /*'images' => $goods,*/
    'footer' => $footer,
  ));

  echo $content;


} catch (Exception $e) {
  die ('ERROR: ' . $e->getMessage());
}

?>
