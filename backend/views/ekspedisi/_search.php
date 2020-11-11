<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model backend\models\EkspedisiSearch */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="ekspedisi-search">

    <?php $form = ActiveForm::begin([
        'action' => ['index'],
        'method' => 'get',
    ]); ?>

    <?= $form->field($model, 'id_ekspedisi') ?>

    <?= $form->field($model, 'tanggal') ?>

    <?= $form->field($model, 'type') ?>

    <?= $form->field($model, 'id_destination') ?>

    <?= $form->field($model, 'product') ?>

    <?php // echo $form->field($model, 'long') ?>

    <?php // echo $form->field($model, 'wide') ?>

    <?php // echo $form->field($model, 'high') ?>

    <?php // echo $form->field($model, 'note') ?>

    <?php // echo $form->field($model, 'recipient_name') ?>

    <?php // echo $form->field($model, 'recipient_company') ?>

    <?php // echo $form->field($model, 'recipient_address') ?>

    <?php // echo $form->field($model, 'recipient_zip_code') ?>

    <?php // echo $form->field($model, 'recipient_phone') ?>

    <?php // echo $form->field($model, 'recipient_email') ?>

    <?php // echo $form->field($model, 'shipper_name') ?>

    <?php // echo $form->field($model, 'shipper_company') ?>

    <?php // echo $form->field($model, 'shipper_address') ?>

    <?php // echo $form->field($model, 'shipper_zip_code') ?>

    <?php // echo $form->field($model, 'shipper_phone') ?>

    <?php // echo $form->field($model, 'shipper_email') ?>

    <?php // echo $form->field($model, 'status') ?>

    <?php // echo $form->field($model, 'id_login') ?>

    <div class="form-group">
        <?= Html::submitButton('Search', ['class' => 'btn btn-primary']) ?>
        <?= Html::resetButton('Reset', ['class' => 'btn btn-default']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
