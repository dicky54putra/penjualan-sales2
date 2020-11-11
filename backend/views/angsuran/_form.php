<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model backend\models\Angsuran */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="angsuran-form">

    <?php $form = ActiveForm::begin(); ?>

    <?= $form->field($model, 'tanggal_angsuran')->textInput() ?>

    <?= $form->field($model, 'total_angsuran')->textInput() ?>

    <?= $form->field($model, 'id_kolektor')->textInput() ?>

    <?= $form->field($model, 'id_pemesanan')->textInput() ?>

    <div class="form-group">
        <?= Html::submitButton('Save', ['class' => 'btn btn-success']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
