<?php

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


/* @var $this yii\web\View */
/* @var $searchModel backend\models\PurchaseOrderSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = 'Laporan Pemesanan';
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
                            <?php $form = ActiveForm::begin([
                                'method' => 'post',
                                'action' => [''],
                            ]); ?>

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
                                    <td width="10%">
                                        <div class="form-group">Sales</div>
                                    </td>
                                    <td align="center" width="5%">
                                        <div class="form-group">:</div>
                                    </td>
                                    <td width="30%">
                                        <div class="form-group">
                                            <select class="form-control" name="sales">
                                                <option value="">Pilih Sales</option>
                                            </select>
                                        </div>
                                    </td>
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
                                    <td width="5%"></td>
                                    <td width="10%">
                                        <div class="form-group">Status</div>
                                    </td>
                                    <td align="center" width="5%">
                                        <div class="form-group">:</div>
                                    </td>
                                    <td width="30%">
                                        <div class="form-group">
                                            <select class="form-control" name="status">
                                                <option value="">Pilih Status</option>
                                                <option value="1">Order</option>
                                                <option value="2">Penjualan</option>
                                                <option value="3">Pembayaran</option>
                                                <option value="4">Selesai</option>
                                                <option value="5">Canceled</option>
                                            </select>
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

                            <?php ActiveForm::end(); ?>
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </div>

    <?php
    if ($tanggal_awal != '' && $tanggal_akhir != '') {
    ?>

        <p style="font-family: 'Times New Roman'">
            <h4>
                <?= $this->title ?> Pertanggal : <?= date('d/m/Y', strtotime($tanggal_awal)) ?> s/d <?= date('d/m/Y', strtotime($tanggal_akhir)) ?>
                <?= Html::a('Cetak Laporan', ['cetak-laporan', 'tanggal_awal' => $tanggal_awal, 'tanggal_akhir' => $tanggal_akhir, 'sales' => $sales, 'status' => $status], ['class' => 'btn btn-primary', 'target' => '_blank', 'method' => 'post']) ?>
                <?= Html::a('Export Laporan', ['export-laporan', 'tanggal_awal' => $tanggal_awal, 'tanggal_akhir' => $tanggal_akhir, 'sales' => $sales, 'status' => $status], ['class' => 'btn btn-success', 'target' => '_blank', 'method' => 'post']) ?>
                <br>
                <?php
                $sales_penjualan = Login::findOne($sales);
                if (!empty($sales_penjualan->nama)) {
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
            <div class="box-header">
                <div class="col-md-12" style="padding: 0;">
                    <div class="box-body">
                        <table class="table">
                            <thead>
                                <tr>
                                    <th>#</th>
                                    <th>Nama Sales</th>
                                    <th>Jumlah SP</th>
                                    <th>KOM</th>
                                    <th>REG</th>
                                    <th>Value Kompor</th>
                                    <th>Value Regulator</th>
                                    <th>Total</th>
                                </tr>
                            </thead>

                        </table>

                    </div>
                </div>
            </div>
        </div>

    <?php } ?>

</div>