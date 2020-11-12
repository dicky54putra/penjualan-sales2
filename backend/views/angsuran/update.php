<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model backend\models\Angsuran */

$this->title = 'Update Angsuran: ' . $model->id_angsuran;
$this->params['breadcrumbs'][] = ['label' => 'Angsurans', 'url' => ['index']];
$this->params['breadcrumbs'][] = ['label' => $model->id_angsuran, 'url' => ['view', 'id' => $model->id_angsuran]];
$this->params['breadcrumbs'][] = 'Update';
?>
<div class="angsuran-update">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
