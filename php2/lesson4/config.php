<?php

CONST IMAGE_DIR = 'images/max/';
CONST LOG_DIR = 'logs/';
CONST LOG_NAME = 'log';
CONST LOG_FORMAT = '.txt';

function connect() {
  static $link;
  if (empty($link)) {
    $link = mysqli_connect('localhost', 'root', '', 'gbphp');
  }
  return $link;
}

function clearStr($str) {
  return mysqli_real_escape_string(connect(), strip_tags(trim($str)));
}

function getMsg(){
  $msg = '';
  if (! empty($_SESSION['msg'])){
    $msg = $_SESSION['msg'];
    $_SESSION['msg'] = '';
  }
  return  $msg;
}