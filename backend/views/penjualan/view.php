<?php

use backend\models\Barang;
use backend\models\Kolektor;
use backend\models\Login;
use backend\models\Pemesanan;
use backend\models\Penjualan;
use yii\helpers\Html;
use yii\widgets\DetailView;

/* @var $this yii\web\View */
/* @var $model backend\models\Penjualan */

$this->title = $model->id_penjualan;
$this->params['breadcrumbs'][] = ['label' => 'Penjualans', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
\yii\web\YiiAsset::register($this);
?>
<div class="penjualan-view">

    <h1><?= Html::encode($this->title) ?></h1>

    <p>
        <?= Html::a('Update', ['update', 'id' => $model->id_penjualan], ['class' => 'btn btn-primary']) ?>
        <?= Html::a('Delete', ['delete', 'id' => $model->id_penjualan], [
            'class' => 'btn btn-danger',
            'data' => [
                'confirm' => 'Are you sure you want to delete this item?',
                'method' => 'post',
            ],
        ]) ?>
    </p>

    <?= DetailView::widget([
        'model' => $model,
        'attributes' => [
            // 'id_penjualan',
            'tanggal_penjualan',
            'total_penjualan',
            [
                'attribute' => 'id_kolektor',
                'format' => 'raw',
                'label' => 'Kolektor',
                'value' => function ($model) {
                    $kolektor = Kolektor::findOne(['id_kolektor' => $model->id_kolektor]);
                    return (!empty($kolektor->nama_kolektor)) ? $kolektor->nama_kolektor : '';;
                }
            ],
            'id_pemesanan',
        ],
    ]) ?>

    <div class="box box-primary">
        <div class="box-body">
            <div class="row">
                <div class="col-md-6">
                    <?php
                    $barang = Yii::$app->db->createCommand("SELECT * FROM pemesanan LEFT JOIN barang ON barang.id_barang = pemesanan.id_barang WHERE pemesanan.id_pemesanan = $model->id_pemesanan")->queryOne();
                    $nominal_barang = (!empty($barang['harga'])) ? $barang['harga'] : 0;

                    if ($barang['jenis_pembayaran'] == 'cash') {
                        $angsuran = $barang['harga'];
                    } else {
                        $angsuran = $barang['harga'] / 10;
                    }

                    $login = Login::findOne(['id_login' => Yii::$app->user->id]);
                    $tlp = preg_replace("/[^0-9]/", "", $login->username);
                    $kolektor = Penjualan::find()
                        ->leftJoin('kolektor', 'kolektor.id_kolektor = penjualan.id_kolektor')
                        ->where(['kolektor.nama_kolektor' => $login->nama])
                        ->andWhere(['kolektor.tlp' => $tlp])
                        ->one();
                    // var_dump($kolektor, $login);
                    // die;
                    ?>
                    <?= Html::a('Pembayaran', ['angsuran/create', 'pemesanan' => $model->id_pemesanan, 'kolektor' => $kolektor->id_kolektor, 'angsuran' => $angsuran], ['class' => 'btn btn-success']) ?>
                    <table class="table">
                        <thead>
                            <tr>
                                <th>#</th>
                                <th>Tanggal</th>
                                <th>Nominal Bayar</th>
                                <th>Aksi</th>
                            </tr>
                        </thead>
                        <tbody>
                            <?php
                            $no = 0;
                            $dibayar = 0;
                            $angsuran_ = Yii::$app->db->createCommand("SELECT * FROM angsuran WHERE angsuran.id_pemesanan = $model->id_pemesanan")->queryAll();

                            foreach ($angsuran_ as $key => $val) {
                                $no++;
                                $dibayar += $val['total_angsuran'];
                            ?>
                                <tr>
                                    <td><?= $no ?></td>
                                    <td><?= tanggal_indo($val['tanggal_angsuran']) ?></td>
                                    <td><?= $val['total_angsuran'] ?></td>
                                    <td></td>
                                </tr>
                            <?php } ?>
                        </tbody>
                    </table>
                </div>
                <div class="col-md-6">
                    <table class="table table-striped">
                        <tr>
                            <td><b>Yang Harus Dibayar</b></td>
                            <td><?= number_format($nominal_barang) ?></td>
                        </tr>
                        <tr>
                            <td><b>Nominal Cicilan</b></td>
                            <td><?= number_format($angsuran) ?></td>
                        </tr>
                        <tr>
                            <td><b>Yang Telah Dibayar</b></td>
                            <td><?= number_format($dibayar) ?></td>
                        </tr>
                        <tr>
                            <td><b>Sisa Yang Harus Dibayar</b></td>
                            <td><?= number_format($nominal_barang - $dibayar) ?></td>
                        </tr>
                    </table>
                </div>
            </div>
        </div>
    </div>

</div>