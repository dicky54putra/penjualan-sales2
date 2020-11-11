<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model backend\models\KolektorSearch */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="kolektor-search">

    <?php $form = ActiveForm::begin([
        'action' => ['index'],
        'method' => 'get',
    ]); ?>

    <?= $form->field($model, 'id_kolektor') ?>

    <?= $form->field($model, 'nama_kolektor') ?>

    <?= $form->field($model, 'alamat') ?>

    <?= $form->field($model, 'tlp') ?>

    <div class="form-group">
        <?= Html::submitButton('Search', ['class' => 'btn btn-primary']) ?>
        <?= Html::resetButton('Reset', ['class' => 'btn btn-default']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
