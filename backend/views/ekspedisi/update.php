<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model backend\models\Ekspedisi */

$this->title = 'Update Ekspedisi: ' . $model->id_ekspedisi;
$this->params['breadcrumbs'][] = ['label' => 'Ekspedisi', 'url' => ['index']];
$this->params['breadcrumbs'][] = ['label' => $model->id_ekspedisi, 'url' => ['view', 'id' => $model->id_ekspedisi]];
$this->params['breadcrumbs'][] = 'Update';
?>
<div class="ekspedisi-update">

    <h1><?= Html::encode($this->title) ?></h1>
    <ul class="breadcrumb">
        <li><a href="/">Home</a></li>
        <li><?= Html::a('Ekspedisi', ['index']) ?></li>
        <li class="active"><?= $this->title ?></li>
    </ul>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
