<?php

use backend\models\Barang;
use backend\models\Kolektor;
use backend\models\Pemesanan;
use backend\models\Sales;
use yii\helpers\ArrayHelper;
use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model backend\models\Penjualan */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="penjualan-form">

    <?php $form = ActiveForm::begin(); ?>

    <?= $form->field($model, 'tanggal_penjualan')->textInput(['type' => 'date', 'value' => date('Y-m-d')]) ?>

    <?php
    if (!empty($_GET['id'])) {
        $pesanan = Pemesanan::find()->where(['id_pemesanan' => $_GET['id']])->one();
        if (!empty($pesanan->jumlah_pemesanan)) {
            $val = $pesanan->jumlah_pemesanan;
        } else {
            $val = 1;
        }
        $read = "readonly";
    } else {
        $val = 1;
        $read = "";
    }
    ?>
    <?= $form->field($model, 'total_penjualan')->textInput(['type' => 'number', 'value' => $val, $read => true]) ?>

    <?php
    $kolektor = ArrayHelper::map(Kolektor::find()->all(), "id_kolektor", function ($model) {
        return $model->nama_kolektor . ' - ' . $model->alamat;
    });
    ?>
    <?= $form->field($model, 'id_kolektor')->dropDownList($kolektor, ['prompt' => 'Pilih Kolektor'])->label('Kolektor') ?>

    <?php
    if (!empty($_GET['id'])) {
        $pemesanan = ArrayHelper::map(Pemesanan::find()->where(['id_pemesanan' => $_GET['id']])->all(), "id_pemesanan", function ($model) {
            $barang = Barang::find()->where(['id_barang' => $model->id_barang])->one();
            $sales = Sales::find()->where(['id_sales' => $model->id_sales])->one();
            if (!empty($barang->nama_barang) && !empty($sales->nama_sales)) {
                return 'nama sales: ' . $sales->nama_sales . ' - ' . $barang->nama_barang . '(' . number_format($barang->harga) . ')';
            }
        });
        $model->id_pemesanan = $_GET['id'];
    } else {
        $pemesanan = ArrayHelper::map(Pemesanan::find()->all(), "id_pemesanan", function ($model) {
            $barang = Barang::find()->where(['id_barang' => $model->id_barang])->one();
            $sales = Sales::find()->where(['id_sales' => $model->id_sales])->one();
            if (!empty($barang->nama_barang) && !empty($sales->nama_sales)) {
                return 'nama sales: ' . $sales->nama_sales . ' - ' . $barang->nama_barang . '(' . number_format($barang->harga) . ')';
            }
        });
    }
    ?>
    <?= $form->field($model, 'id_pemesanan')->dropDownList($pemesanan, ['prompt' => 'Pilih Pemesanan'])->label('Pemesanan') ?>

    <div class="form-group">
        <?= Html::submitButton('Save', ['class' => 'btn btn-success']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>