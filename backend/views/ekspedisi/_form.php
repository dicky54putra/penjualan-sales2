<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;
use yii\helpers\ArrayHelper;
use yii\jui\AutoComplete;
use yii\web\JsExpression;
use kartik\select2\Select2;
use backend\models\Destination;

/* @var $this yii\web\View */
/* @var $model backend\models\Ekspedisi */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="ekspedisi-form">
    <div class="destination-form">
        <div class="panel panel-primary">
            <div class="panel-heading"><span class="fa fa-table"></span> Ekspedisi</div>
            <div class="panel-body">
                <div class="col-md-12" style="padding: 0;">
                    <div class="box-body">

                        <?php $form = ActiveForm::begin(); ?>

                        <div class="row">
                            <div class="col-lg-4">
                                <div class="panel panel-primary">
                                    <div class="panel-heading"><span class="fa fa-box"></span> CALCULATIONS</div>
                                    <div class="panel-body">
                                        <div class="col-md-12" style="padding: 0;">
                                            <div class="box-body">
                                                <?php

                                                if ($model->tanggal == '0000-00-00' || $model->tanggal == '') {
                                                    $model->tanggal = Yii::$app->formatter->asDate('now', 'php:Y-m-d');
                                                }

                                                ?>
                                                <?= $form->field($model, 'tanggal')->widget(\yii\jui\DatePicker::classname(), [
                                                    'clientOptions' => [
                                                        'changeMonth' => true,
                                                        'changeYear' => true,
                                                    ],
                                                    'dateFormat' => 'yyyy-MM-dd',
                                                    'options' => ['class' => 'form-control']
                                                ]) ?>

                                                <?= $form->field($model, 'type')->widget(Select2::classname(), [
                                                    'data' =>  array(
                                                        1 => 'DOMESTIK',
                                                        2 => 'LUAR NEGERI',
                                                    ),
                                                    'language' => 'en',
                                                    'options' => ['placeholder' => 'Pilih Type'],
                                                    'pluginOptions' => [
                                                        'allowClear' => true
                                                    ],
                                                ]) ?>

                                                <?= $form->field($model, 'id_destination')->widget(Select2::classname(), [
                                                    'data' => ArrayHelper::map(
                                                        Destination::find()->all(),
                                                        'id_destination',
                                                        'destination_name'
                                                    ),
                                                    'language' => 'en',
                                                    'options' => ['placeholder' => 'Pilih Destination', 'id' => 'id_destination'],
                                                    'pluginOptions' => [
                                                        'allowClear' => true
                                                    ],
                                                ])->label('Destination Name') ?>

                                                <?= $form->field($model, 'product')->widget(Select2::classname(), [
                                                    'data' =>  array(
                                                        1 => 'ONS',
                                                        2 => 'REGULER',
                                                    ),
                                                    'language' => 'en',
                                                    'options' => ['placeholder' => 'Pilih Product'],
                                                    'pluginOptions' => [
                                                        'allowClear' => true
                                                    ],
                                                ]) ?>

                                                <div class="row">
                                                    <div class="col-lg-12">
                                                        <div class="panel panel-primary">
                                                            <div class="panel-body">
                                                                <div class="col-md-12" style="padding: 0;">
                                                                    <div class="box-body">
                                                                        <div class="col-lg-4">
                                                                            <?= $form->field($model, 'long')->textInput(['id' => 'long']) ?>
                                                                        </div>
                                                                        <div class="col-lg-4">

                                                                            <?= $form->field($model, 'wide')->textInput(['id' => 'wide']) ?>
                                                                        </div>
                                                                        <div class="col-lg-4">

                                                                            <?= $form->field($model, 'high')->textInput(['id' => 'high']) ?>

                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>


                                                <?= $form->field($model, 'total_biaya')->textInput(['id' => 'total_biaya']) ?>

                                                <?= $form->field($model, 'note')->textarea(['rows' => 6]) ?>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="col-lg-4">
                                <div class="panel panel-primary">
                                    <div class="panel-heading"><span class="fa fa-user"></span> RECEPIENT</div>
                                    <div class="panel-body">
                                        <div class="col-md-12" style="padding: 0;">
                                            <div class="box-body">
                                                <?= $form->field($model, 'recipient_name')->textInput(['maxlength' => true]) ?>

                                                <?= $form->field($model, 'recipient_company')->textInput(['maxlength' => true]) ?>

                                                <?= $form->field($model, 'recipient_address')->textarea(['rows' => 6]) ?>

                                                <?= $form->field($model, 'recipient_zip_code')->textInput(['maxlength' => true]) ?>

                                                <?= $form->field($model, 'recipient_phone')->textInput(['maxlength' => true]) ?>

                                                <?= $form->field($model, 'recipient_email')->textInput(['maxlength' => true]) ?>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="col-lg-4">
                                <div class="panel panel-primary">
                                    <div class="panel-heading"><span class="fa fa-user"></span> SHIPPER</div>
                                    <div class="panel-body">
                                        <div class="col-md-12" style="padding: 0;">
                                            <div class="box-body">
                                                <?= $form->field($model, 'shipper_name')->textInput(['maxlength' => true]) ?>

                                                <?= $form->field($model, 'shipper_company')->textInput(['maxlength' => true]) ?>

                                                <?= $form->field($model, 'shipper_address')->textarea(['rows' => 6]) ?>

                                                <?= $form->field($model, 'shipper_zip_code')->textInput(['maxlength' => true]) ?>

                                                <?= $form->field($model, 'shipper_phone')->textInput(['maxlength' => true]) ?>

                                                <?= $form->field($model, 'shipper_email')->textInput(['maxlength' => true]) ?>

                                                <?php
                                                if ($model->isNewRecord) {
                                                    # code...
                                                ?>
                                                    <?= $form->field($model, 'status')->dropDownList(array(1 => "Aktif")) ?>
                                                <?php
                                                } else {
                                                    # code...
                                                ?>
                                                    <?= $form->field($model, 'status')->dropDownList(array(1 => "Aktif", 2 => "Selesai")) ?>
                                                <?php
                                                }

                                                ?>

                                                <?= $form->field($model, 'id_login')->hiddenInput(['value' => $id_login])->label(false) ?>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <?= Html::submitButton('Save', ['class' => 'btn btn-success']) ?>
                                </div>
                            </div>
                        </div>

                    </div>


                    <?php ActiveForm::end(); ?>

                </div>
            </div>
        </div>
    </div>
</div>
</div>

<?php

$script = <<< JS
    const total_biaya = document.querySelector('#total_biaya');
    const long = document.querySelector('#long');
    const wide = document.querySelector('#wide');
    const high = document.querySelector('#high');


     async function setvalueTotalBiaya(id, long = 0, wide = 0, high = 0 ) {

        let cost;

       const fetch_cost = await fetch("index.php?r=ekspedisi/get-cost-destination&id=" + id)
        .then(res => res.json())
        .then(response => {
           cost = response.cost;
        }).catch(err => console.log(err))

        
        if(long == 0 || wide == 0 || high == 0  ) {
            total_biaya.value = cost;
        } else {
         let rumus = (( long * wide * high ) / 6000 ) * cost;
         total_biaya.value = Math.floor(rumus);
        }
    }   

    $('#id_destination').on("select2:select", function (e) {
        let id = e.params.data.id;
        setvalueTotalBiaya(id,long.value,wide.value,high.value);

        long.addEventListener("change", function(e) {
            setvalueTotalBiaya(id,long.value,wide.value,high.value);
        })   

        wide.addEventListener("change", function(e) {
            setvalueTotalBiaya(id,long.value,wide.value,high.value);
        })   

        high.addEventListener("change", function(e) {
            setvalueTotalBiaya(id,long.value,wide.value,high.value);
        })   

    })


  
           

JS;

$this->registerJs($script);

?>