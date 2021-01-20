<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model backend\models\PemesananSearch */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="pemesanan-search">

    <?php $form = ActiveForm::begin([
        'action' => ['index'],
        'method' => 'get',
    ]); ?>

    <?= $form->field($model, 'id_pemesanan') ?>

    <?= $form->field($model, 'tanggal_pemesanan') ?>

    <?= $form->field($model, 'paket_pemesanan') ?>

    <?= $form->field($model, 'jumlah_pemesanan') ?>

    <?= $form->field($model, 'id_sales') ?>

    <?php // echo $form->field($model, 'id_pelanggan') ?>

    <?php // echo $form->field($model, 'id_barang') ?>

    <div class="form-group">
        <?= Html::submitButton('Search', ['class' => 'btn btn-primary']) ?>
        <?= Html::resetButton('Reset', ['class' => 'btn btn-default']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
