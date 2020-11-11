<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model backend\models\Destination */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="destination-form">
	<div class="panel panel-primary">
        <div class="panel-heading"><span class="fa fa-table"></span> Destination</div>
        <div class="panel-body">
            <div class="col-md-12" style="padding: 0;">
                <div class="box-body">

			    <?php $form = ActiveForm::begin(); ?>

			    <?= $form->field($model, 'destination_name')->textInput(['maxlength' => true]) ?>

			    <?= $form->field($model, 'cost')->widget(\yii\widgets\MaskedInput::className(), [
                                                        'clientOptions' => ['alias' => 'decimal', 'groupSeparator' => '.', 'autoGroup' => true, 'removeMaskOnSubmit' => true, 'rightAlign' => false, 'min' => 0,],
                                                        'options' => ['required' => true]
                                                    ]); ?>

			    <div class="form-group">
			        <?= Html::submitButton('Save', ['class' => 'btn btn-success']) ?>
			    </div>

			    <?php ActiveForm::end(); ?>

    			</div>
            </div>
        </div>
    </div>
</div>
