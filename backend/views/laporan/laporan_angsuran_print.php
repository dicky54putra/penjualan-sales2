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
?>
<style>
    .tabel {
        font-family: 'Source Sans Pro', 'Helvetica Neue', Helvetica, Arial, sans-serif;
    }

    .tabel th,
    .tabel td {
        padding: 2px;
        text-align: left;
        font-size: 12px;
    }

    .table td {
        border-bottom: 1px solid #000000;
        text-align: left;
        padding: 5px;
    }

    .table thead {
        border-bottom: 1px solid #000000;
        padding: 5px;
    }

    .table {
        border-collapse: collapse;
        width: 100%;
        font-size: 12px;
        font-family: 'Source Sans Pro', 'Helvetica Neue', Helvetica, Arial, sans-serif;
    }

    .table th,
    .table td {
        padding: 5px;
    }
</style>
<div class="purchase-order-index">

    <div class="invoice-view">

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
            <?php
            $query_angsuran = Angsuran::find()->where(['BETWEEN', 'tanggal_angsuran', $tanggal_awal, $tanggal_akhir])->orderBy("tanggal_angsuran ASC")->groupBy('id_kolektor')->all();

            foreach ($query_angsuran as $key => $data) {
                $pemesanan = Pemesanan::findOne($data['id_pemesanan']);
                $barang = Barang::findOne($pemesanan->id_barang);
                $sum_angsuran = Yii::$app->db->createCommand("SELECT SUM(total_angsuran) FROM angsuran WHERE id_kolektor = '$data[id_kolektor]'")->queryScalar();
                $kolektor = Kolektor::findOne($data['id_kolektor']);
            ?>
                <div class="box">
                    <div class="panel panel-primary">
                        <div class="panel-heading" style="overflow-x: auto;">
                            <style>
                                .tabel {
                                    width: 100%;
                                }

                                .tabel th,
                                .tabel td {
                                    padding: 2px;
                                }
                            </style>
                            <table class="tabel">
                                <thead>
                                    <tr>
                                        <th style="width: 12%;white-space: nowrap;">Nama Kolektor</th>
                                        <th style="width: 12%;white-space: nowrap;">Total Angsuran</th>
                                        <th></th>
                                    </tr>
                                    <tr>
                                        <td style="text-transform: capitalize;"><?= $kolektor->nama_kolektor ?></td>
                                        <td><?= $sum_angsuran ?></td>
                                    </tr>
                                </thead>
                            </table>
                        </div>
                        <div class="panel-body">
                            <div class="col-md-12">
                                <div class="box-body" style="overflow-x: auto;">
                                    <table class="table table-condensed table-bordered">
                                        <thead>
                                            <tr>
                                                <th style="width: 7%;">Nama Barang</th>
                                                <th style="width: 22%;">Harga</th>
                                                <th style="width: 10%; text-align: center;">Paket Pemesanan</th>
                                                <th style="width: 10%; text-align: center;">Pelanggan</th>
                                                <th style="width: 10%; text-align: center;">Angsuran ke</th>
                                                <th style="width: 10%; text-align: center;">Total Angsuran</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <?php
                                            $query_angsuran2 = Angsuran::find()->where(['BETWEEN', 'tanggal_angsuran', $tanggal_awal, $tanggal_akhir])->andWhere(['id_kolektor' => $data['id_kolektor']])->orderBy("tanggal_angsuran ASC")->all();
                                            $total = 0;
                                            foreach ($query_angsuran2 as $data2) {
                                                $pemesanan2 = Pemesanan::findOne($data2['id_pemesanan']);
                                                $barang2 = Barang::findOne($pemesanan2->id_barang);
                                                $pelanggan = Pelanggan::findOne($pemesanan->id_pelanggan);
                                                $rupiah = $barang2->harga * $pemesanan2->jumlah_pemesanan;
                                                $total += $data2['total_angsuran'];
                                            ?>
                                                <tr>
                                                    <td style="text-transform: capitalize;"><?= $barang2->nama_barang ?></td>
                                                    <td style="text-transform: capitalize;"><?= ribuan($barang2->harga) ?></td>
                                                    <td style="text-transform: capitalize;"><?= $pemesanan2->paket_pemesanan ?></td>
                                                    <td style="text-transform: capitalize;"><?= $pelanggan->nama_pelanggan ?></td>
                                                    <td align="right" style="text-transform: capitalize;">
                                                        <?php
                                                        $count = Angsuran::find()->where(['id_pemesanan' => $data2['id_pemesanan']])->andWhere(['<', 'id_angsuran', $data2['id_angsuran']])->orderBy('tanggal_angsuran ASC')->count();
                                                        echo $count + 1;
                                                        ?>
                                                    </td>
                                                    <td align="right">
                                                        <?= ribuan($data2['total_angsuran']) ?>
                                                    </td>
                                                </tr>
                                            <?php } ?>
                                        </tbody>
                                        <tfoot>
                                            <tr>
                                                <td colspan="4"></td>
                                                <td style="font-weight:bold;" align="right">Total</td>
                                                <td align="right"> <?= ribuan($total) ?> </td>
                                            </tr>
                                        </tfoot>
                                    </table>

                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <br>
                <br>
            <?php
            }
            ?>
        <?php
        }
        ?>

    </div>
</div>

<script type="text/javascript">
    window.print();
    setTimeout(window.close, 500);
</script>