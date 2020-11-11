<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model backend\models\AngsuranSearch */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="angsuran-search">

    <?php $form = ActiveForm::begin([
        'action' => ['index'],
        'method' => 'get',
    ]); ?>

    <?= $form->field($model, 'id_angsuran') ?>

    <?= $form->field($model, 'tanggal_angsuran') ?>

    <?= $form->field($model, 'total_angsuran') ?>

    <?= $form->field($model, 'id_kolektor') ?>

    <?= $form->field($model, 'id_pemesanan') ?>

    <div class="form-group">
        <?= Html::submitButton('Search', ['class' => 'btn btn-primary']) ?>
        <?= Html::resetButton('Reset', ['class' => 'btn btn-default']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
