<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model backend\models\Ekspedisi */

$this->title = 'Create Ekspedisi';
$this->params['breadcrumbs'][] = ['label' => 'Ekspedisi', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="ekspedisi-create">

    <h1><?= Html::encode($this->title) ?></h1>
    <ul class="breadcrumb">
        <li><a href="/">Home</a></li>
        <li><?= Html::a('Ekspedisi', ['index']) ?></li>
        <li class="active"><?= $this->title ?></li>
    </ul>

    <?= $this->render('_form', [
        'model' => $model,
        'id_login' => $id_login,
    ]) ?>

</div>
