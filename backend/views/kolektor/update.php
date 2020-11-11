<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model backend\models\Kolektor */

$this->title = 'Update Kolektor: ' . $model->id_kolektor;
$this->params['breadcrumbs'][] = ['label' => 'Kolektors', 'url' => ['index']];
$this->params['breadcrumbs'][] = ['label' => $model->id_kolektor, 'url' => ['view', 'id' => $model->id_kolektor]];
$this->params['breadcrumbs'][] = 'Update';
?>
<div class="kolektor-update">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
