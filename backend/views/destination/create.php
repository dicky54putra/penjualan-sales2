<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model backend\models\Destination */

$this->title = 'Create Destination';
$this->params['breadcrumbs'][] = ['label' => 'Destination', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="destination-create">

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
