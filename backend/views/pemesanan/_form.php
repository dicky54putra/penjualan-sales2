<?php

use backend\models\Barang;
use backend\models\Pelanggan;
use backend\models\Sales;
use yii\helpers\ArrayHelper;
use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model backend\models\Pemesanan */
/* @var $form yii\widgets\ActiveForm */
?>
<div class="pemesanan-form">

    <?php $form = ActiveForm::begin(); ?>

    <?= $form->field($model, 'tanggal_pemesanan')->textInput(['type' => 'date', 'value' => date('Y-m-d')]) ?>

    <?= $form->field($model, 'paket_pemesanan')->dropDownList([
        'cash' => 'cash',
        'credit' => 'credit'
    ], ['prompt' => 'Pilih Paket Pemesanan']) ?>

    <?= $form->field($model, 'jumlah_pemesanan')->textInput(['type' => 'number', 'value' => 1]) ?>

    <?php
    $sales = ArrayHelper::map(Sales::find()->all(), "id_sales", function ($model) {
        return $model->nama_sales . ' - ' . $model->alamat;
    });
    ?>
    <?= $form->field($model, 'id_sales')->dropDownList($sales, ['prompt' => 'Pilih Sales'])->label('Sales') ?>

    <?php
    $pelanggan = ArrayHelper::map(Pelanggan::find()->all(), "id_pelanggan", function ($model) {
        return $model->nama_pelanggan . ' - ' . $model->alamat;
    });
    ?>
    <?= $form->field($model, 'id_pelanggan')->dropDownList($pelanggan, ['prompt' => 'Pilih Pelanggan'])->label('Pelanggan') ?>

    <?= $form->field($model, 'id_barang')->dropDownList(['prompt' => 'Pilih Barang'])->label('Barang') ?>

    <div class="form-group">
        <?= Html::submitButton('Save', ['class' => 'btn btn-success']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
<?php
$script = <<< JS
    $(document).ready(function() {
        $("#pemesanan-paket_pemesanan").change(function() {
            var paket_pemesanan = $("#pemesanan-paket_pemesanan").val();
            $.ajax({
                type: 'POST',
                url: "index.php?r=pemesanan%2Fget-barang&paket_pemesanan=" + paket_pemesanan,
                data: {
                    paket_pemesanan: paket_pemesanan
                },
                cache: false,
                success: function(msg) {
                    $("#pemesanan-id_barang").html(msg);
                }
            });
        });
    });
JS;
$this->registerJs($script);
?>