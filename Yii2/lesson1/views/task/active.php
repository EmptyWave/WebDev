<?php
use yii\helpers\Html;
use yii\bootstrap\ActiveForm;

$this->title = $title;
//$this->params['breadcrumbs'][] = ['label' => 'Tasks', 'url' => '?r=task%2Findex'];
$this->params['breadcrumbs'][] = $this->title;
?>
<h3>а тут активные таски (конкретно пользователя(если есть))</h3>