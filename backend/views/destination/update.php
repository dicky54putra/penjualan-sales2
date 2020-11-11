<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model backend\models\Destination */

$this->title = 'Update Destination: ' . $model->id_destination;
$this->params['breadcrumbs'][] = ['label' => 'Destinations', 'url' => ['index']];
$this->params['breadcrumbs'][] = ['label' => $model->id_destination, 'url' => ['view', 'id' => $model->id_destination]];
$this->params['breadcrumbs'][] = 'Update';
?>
<div class="destination-update">

    <h1><?= Html::encode($this->title) ?></h1>
    <ul class="breadcrumb">
        <li><a href="/">Home</a></li>
        <li><?= Html::a('Destination', ['index']) ?></li>
        <li class="active"><?= $this->title ?></li>
    </ul>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
