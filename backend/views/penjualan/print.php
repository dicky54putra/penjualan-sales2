<style>
    .table1 {
        border-collapse: collapse;
        width: 45%;
    }

    .table1 th {
        padding: 10px;
    }

    .table2 {
        border-collapse: collapse;
        width: 45%;
        border: 1px solid #000000;
    }

    .label_kiri {
        text-align: left;
        width: 52%;
        padding: 5px;
        padding-left: 10px;
    }
</style>
<?php

use backend\models\Angsuran;
use backend\models\Kolektor;
use backend\models\Pelanggan;
use backend\models\Pemesanan;

if (!empty($_GET['id'])) {
    $angsuran = Angsuran::find()->where(['id_angsuran' => $_GET['id']])->one();
    if (!empty($angsuran->id_pemesanan) && !empty($angsuran->id_kolektor)) {
        $pemesanan = Pemesanan::find()->where(['id_pemesanan' => $angsuran->id_pemesanan])->one();
        $kolektor = Kolektor::find()->where(['id_kolektor' => $angsuran->id_kolektor])->one();
        if (!empty($pemesanan->id_pelanggan)) {
            $pelanggan = Pelanggan::find()->where(['id_pelanggan' => $pemesanan->id_pelanggan])->one();
?>
            <table class="table1" border="1">
                <thead>
                    <tr>
                        <th><?= $kolektor->nama_kolektor ?></th>
                    </tr>
                </thead>
            </table>
            <table class="table2">
                <thead>
                    <tr>
                        <th colspan="2" style="font-size: 20px;">Bukti Pembayaran</th>
                    </tr>
                    <tr>
                        <th class="label_kiri">Tanggal Pembayaran</th>
                        <td>
                            <?= date('d/m/Y', strtotime($angsuran->tanggal_angsuran)) ?>
                        </td>
                    </tr>
                    <tr>
                        <th class="label_kiri">Nama Pelanggan</th>
                        <td><?= (!empty($pelanggan->nama_pelanggan)) ? $pelanggan->nama_pelanggan : '' ?></td>
                    </tr>
                    <tr>
                        <th class="label_kiri">Angsuran yang ke</th>
                        <td>
                            <?php
                            $count = Angsuran::find()->where(['id_pemesanan' => $angsuran->id_pemesanan])->andWhere(['<', 'id_angsuran', $angsuran->id_angsuran])->orderBy('tanggal_angsuran ASC')->count();
                            echo $count + 1;
                            ?>
                        </td>
                    </tr>
                    <tr>
                        <th class="label_kiri">Nominal</th>
                        <td>
                            <?= ribuan($angsuran->total_angsuran) ?>
                        </td>
                    </tr>
                    <tr>
                        <th class="label_kiri">Keterangan</th>
                        <td>
                            <?php
                            $barang = Yii::$app->db->createCommand("SELECT * FROM pemesanan LEFT JOIN barang ON barang.id_barang = pemesanan.id_barang WHERE pemesanan.id_pemesanan = $pemesanan->id_pemesanan")->queryOne();
                            $nominal_barang = (!empty($barang['harga'])) ? $barang['harga'] * $pemesanan->jumlah_pemesanan : 0;

                            $no = 0;
                            $dibayar = 0;
                            $angsuran_ = Yii::$app->db->createCommand("SELECT * FROM angsuran WHERE angsuran.id_pemesanan = $pemesanan->id_pemesanan")->queryAll();

                            foreach ($angsuran_ as $key => $val) {
                                $no++;
                                $dibayar += $val['total_angsuran'];
                            }
                            echo ($nominal_barang > $dibayar) ? 'BELUM LUNAS' : 'LUNAS';
                            ?>
                        </td>
                    </tr>
                    <tr>
                        <th style="font-size: 15px;">TTD<br>Kolektor</th>
                        <td></td>
                    </tr>
                    <tr>
                        <th style="height: 50px;"></th>
                        <td></td>
                    </tr>
                    <tr>
                        <th><?= $kolektor->nama_kolektor ?></th>
                        <td></td>
                    </tr>
                </thead>
            </table>
        <?php } else {
            echo "Ada Data dari relasi yang terhapus, sehingga menyebabkan tidak bisa tampil";
        } ?>
    <?php } else {
        echo "Ada Data dari relasi yang terhapus, sehingga menyebabkan tidak bisa tampil";
    }
    ?>
<?php } ?>
<script type="text/javascript">
    window.print();
    setTimeout(window.close, 500);
</script>