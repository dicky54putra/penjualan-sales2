<?php

use backend\models\Barang;
use yii\helpers\Html;
use backend\models\Pelanggan;
use backend\models\Pemesanan;
use backend\models\Sales;
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
    $query_pemesanan = Pemesanan::find()->where(['BETWEEN', 'tanggal_pemesanan', $tanggal_awal, $tanggal_akhir])->orderBy("tanggal_pemesanan ASC")->groupBy('id_sales')->all();

    foreach ($query_pemesanan as $key => $data) {
        $barang = Barang::findOne($data['id_barang']);
        $sum_pemesanan = Yii::$app->db->createCommand("SELECT SUM(jumlah_pemesanan) FROM pemesanan WHERE id_sales = '$data[id_sales]'")->queryScalar();
        $sales = Sales::findOne($data['id_sales']);
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
                                <th style="width: 12%;white-space: nowrap;">Nama Sales</th>
                                <th style="width: 12%;white-space: nowrap;">Total Pemesanan</th>
                                <th></th>
                            </tr>
                            <tr>
                                <td style="text-transform: capitalize;"><?= $sales->nama_sales ?></td>
                                <td><?= $sum_pemesanan ?></td>
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
                                        <th style="width: 10%; text-align: center;">Jumlah Pesanan</th>
                                        <th style="width: 10%; text-align: center;">Total Harga</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <?php
                                    $query_pemesanan2 = Pemesanan::find()->where(['BETWEEN', 'tanggal_pemesanan', $tanggal_awal, $tanggal_akhir])->andWhere(['id_sales' => $data['id_sales']])->orderBy("tanggal_pemesanan ASC")->all();
                                    $total = 0;
                                    foreach ($query_pemesanan2 as $data2) {
                                        $barang2 = Barang::findOne($data2['id_barang']);
                                        $pelanggan = Pelanggan::findOne($data2['id_pelanggan']);
                                        $rupiah = $barang2->harga * $data2['jumlah_pemesanan'];
                                        $total += $rupiah;
                                    ?>
                                        <tr>
                                            <td style="text-transform: capitalize;"><?= $barang2->nama_barang ?></td>
                                            <td style="text-transform: capitalize;"><?= ribuan($barang2->harga) ?></td>
                                            <td style="text-transform: capitalize;"><?= $data2['paket_pemesanan'] ?></td>
                                            <td style="text-transform: capitalize;"><?= $pelanggan->nama_pelanggan ?></td>
                                            <td align="right" style="text-transform: capitalize;"><?= $data2['jumlah_pemesanan'] ?>
                                            </td>
                                            <td align="right">
                                                <?= ribuan($rupiah) ?>
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
<script type="text/javascript">
    window.print();
    setTimeout(window.close, 500);
</script>