<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model backend\models\Pelanggan */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="box box-success">
    <div class="box-header">
        <div class="col-md-12" style="padding: 0;">
            <div class="box-body">
                <div class="pelanggan-form">

                    <?php $form = ActiveForm::begin(); ?>

                    <?= $form->field($model, 'nama_pelanggan')->textInput(['maxlength' => true]) ?>

                    <?= $form->field($model, 'alamat')->textarea(['rows' => 6]) ?>

                    <?= $form->field($model, 'tlp')->textInput(['maxlength' => true]) ?>

                    <div class="form-group">
                        <?= Html::submitButton('Save', ['class' => 'btn btn-success']) ?>
                    </div>

                    <?php ActiveForm::end(); ?>

                </div>
            </div>
        </div>
    </div>
</div>