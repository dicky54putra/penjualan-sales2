<?php

use backend\models\Angsuran;
use backend\models\Barang;
use backend\models\Kolektor;
use yii\helpers\Html;
// use yii\grid\GridView;
use kartik\grid\GridView;
use kartik\daterange\DateRangePicker;
use yii\widgets\ActiveForm;
use yii\jui\AutoComplete;
use yii\web\JsExpression;
use backend\models\Userrole;
use backend\models\Penjualan;
use backend\models\PenjualanDetail;
use backend\models\Login;
use backend\models\Pelanggan;
use backend\models\Pemesanan;
use backend\models\Sales;

/* @var $this yii\web\View */
/* @var $searchModel backend\models\PurchaseOrderSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = 'Laporan Penjulan';
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="purchase-order-index">

    <div class="invoice-view">

        <h4><?= Html::encode($this->title) ?></h4>

        <div class="box">
            <div class="box-header">
                <div class="col-md-12" style="padding: 0;">
                    <div class="box-body">
                        <div>
                            <?= Html::beginForm(['', array('class' => 'form-inline')]) ?>

                            <table border="0" width="100%">
                                <tr>
                                    <td width="10%">
                                        <div class="form-group">Dari Tanggal</div>
                                    </td>
                                    <td align="center" width="5%">
                                        <div class="form-group">:</div>
                                    </td>
                                    <td width="30%">
                                        <div class="form-group">
                                            <input type="date" name="tanggal_awal" class="form-control" required>
                                        </div>
                                    </td>
                                    <td width="5%"></td>

                                </tr>
                                <tr>
                                    <td width="10%">
                                        <div class="form-group">Sampai Tanggal</div>
                                    </td>
                                    <td align="center" width="5%">
                                        <div class="form-group">:</div>
                                    </td>
                                    <td width="30%">
                                        <div class="form-group">
                                            <input type="date" name="tanggal_akhir" class="form-control" required>
                                        </div>
                                    </td>

                                </tr>
                                <tr>
                                    <td></td>
                                    <td></td>
                                    <td>
                                        <div class="form-group">
                                            <?= Html::submitButton('Submit', ['class' => 'btn btn-success']) ?>
                                        </div>
                                    </td>
                                </tr>
                            </table>

                            <?= Html::endForm() ?>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <?php
        if ($tanggal_awal != '' && $tanggal_akhir != '') {
            # code...
        ?>
            <p style="font-family: 'Times New Roman'">
                <h4>
                    <?= $this->title ?> Pertanggal : <?= date('d/m/Y', strtotime($tanggal_awal)) ?> s/d <?= date('d/m/Y', strtotime($tanggal_akhir)) ?>

                    <br>
                    <?php
                    $sales_penjualan = Sales::findOne($sales);
                    if (!empty($sales_penjualan->nama)) {
                        # code...
                        echo 'Sales : ' . $sales_penjualan->nama;
                    }
                    ?>
                    <br>
                    <?php
                    if (!empty($status)) {
                        # code...
                        if ($status == 1) {
                            # code...
                            echo "Status : Order";
                        } elseif ($status == 2) {
                            # code...
                            echo "Status : Penjualan";
                        } elseif ($status == 3) {
                            # code...
                            echo "Status : Pembayaran";
                        } elseif ($status == 4) {
                            # code...
                            echo "Status : Selesai";
                        } elseif ($status == 5) {
                            # code...
                            echo "Status : Canceled";
                        }
                    }
                    ?>
                </h4>
            </p>

            <div class="box">
                <div class="panel panel-primary">
                    <div class="panel-body">
                        <div class="col-md-12">
                            <div class="box-body" style="overflow-x: auto;">
                                <table class="table table-condensed table-bordered">
                                    <thead>
                                        <tr>
                                            <th style="width: 7%;">No</th>
                                            <th style="width: 10%;">Nama</th>
                                            <th style="width: 10%;">jumlah SP</th>
                                            <th style="width: 10%; text-align: center;">KOM</th>
                                            <th style="width: 10%; text-align: center;">REG</th>
                                            <th style="width: 10%; text-align: center;">Value Kompor</th>
                                            <th style="width: 10%; text-align: center;">Value Regulator</th>
                                            <th style="width: 10%; text-align: center;">Total</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <?php
                                        $no = 0;
                                        $query_penjualan = Pemesanan::find()->where(['BETWEEN', 'tanggal_pemesanan', $tanggal_awal, $tanggal_akhir])->orderBy("tanggal_pemesanan ASC")->groupBy('id_sales')->all();

                                        foreach ($query_penjualan as $key => $data) {
                                            $sales = Sales::findOne($data['id_sales']);
                                            $jumlah_sp = Pemesanan::find()->where(['id_sales' => $data['id_sales']])->count();
                                            $no++;
                                        ?>
                                            <tr>
                                                <td style="text-transform: capitalize;"><?= $no ?></td>
                                                <td style="text-transform: capitalize;"><?= $sales->nama_sales ?></td>
                                                <td style="text-transform: capitalize;"><?= $jumlah_sp ?></td>
                                                <td style="text-transform: capitalize;"></td>
                                                <td style="text-transform: capitalize;"></td>
                                                <td style="text-transform: capitalize;"></td>
                                                <td style="text-transform: capitalize;"></td>
                                                <td style="text-transform: capitalize;"></td>
                                            </tr>
                                        <?php } ?>
                                    </tbody>
                                    <tfoot>
                                        <tr>
                                            <td colspan="6"></td>
                                            <td style="font-weight:bold;" align="right">Total</td>
                                            <td align="right"> </td>
                                        </tr>
                                    </tfoot>
                                </table>

                            </div>
                        </div>
                    </div>
                </div>
            </div>
        <?php
        }
        ?>

    </div>
</div>