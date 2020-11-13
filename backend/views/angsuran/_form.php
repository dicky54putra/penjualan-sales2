<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model backend\models\Angsuran */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="angsuran-form">
    <div class="box box-success">
        <div class="box-header">
            <div class="col-md-12" style="padding: 0;">
                <div class="box-body">
                    <?php $form = ActiveForm::begin(); ?>

                    <?= $form->field($model, 'tanggal_angsuran')->textInput(['type' => 'date', 'value' => date('Y-m-d')]) ?>

                    <?= $form->field($model, 'total_angsuran')->textInput(['readonly' => true, 'value' => $_GET['angsuran']]) ?>

                    <?= $form->field($model, 'id_kolektor')->textInput(['value' => $_GET['kolektor'], 'type' => 'hidden'])->label(false) ?>

                    <?= $form->field($model, 'id_pemesanan')->textInput(['value' => $_GET['pemesanan'], 'type' => 'hidden'])->label(false) ?>

                    <div class="form-group">
                        <?= Html::submitButton('Save', ['class' => 'btn btn-success']) ?>
                    </div>

                    <?php ActiveForm::end(); ?>

                </div>
            </div>
        </div>
    </div>
</div>