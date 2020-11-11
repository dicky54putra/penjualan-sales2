<?php

use backend\models\Barang;
use backend\models\Pelanggan;
use backend\models\Penjualan;
use backend\models\Sales;
use yii\helpers\Html;
use yii\widgets\DetailView;

/* @var $this yii\web\View */
/* @var $model backend\models\Pemesanan */

$this->title = $model->id_pemesanan;
$this->params['breadcrumbs'][] = ['label' => 'Pemesanans', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
\yii\web\YiiAsset::register($this);
?>
<div class="pemesanan-view">

    <h1><?= Html::encode($this->title) ?></h1>

    <p>
        <?= Html::a('Update', ['update', 'id' => $model->id_pemesanan], ['class' => 'btn btn-primary']) ?>
        <?= Html::a('Delete', ['delete', 'id' => $model->id_pemesanan], [
            'class' => 'btn btn-danger',
            'data' => [
                'confirm' => 'Are you sure you want to delete this item?',
                'method' => 'post',
            ],
        ]) ?>
        <?php
        $userrole = Yii::$app->db->createCommand("SELECT system_role.nama_role FROM user_role INNER JOIN system_role ON system_role.id_system_role = user_role.id_system_role WHERE user_role.id_login = " . Yii::$app->user->id)->queryScalar();
        if ($userrole == 'ADMINISTRATOR') {
            $cek_penjualan = Penjualan::find()->where(['id_pemesanan' => $_GET['id']])->count();
            if ($cek_penjualan == 0) {
                echo Html::a('Approve', ['penjualan/create', 'id' => $model->id_pemesanan], ['class' => 'btn btn-success']);
            }
        }
        ?>
    </p>

    <?= DetailView::widget([
        'model' => $model,
        'attributes' => [
            // 'id_pemesanan',
            'tanggal_pemesanan',
            'paket_pemesanan',
            'jumlah_pemesanan',
            [
                'attribute' => 'id_sales',
                'format' => 'raw',
                'label' => 'Sales',
                'value' => function ($model) {
                    $sales = Sales::findOne(['id_sales' => $model->id_sales]);
                    return (!empty($sales->nama_sales)) ? $sales->nama_sales : '';
                }
            ],
            [
                'attribute' => 'id_pelanggan',
                'format' => 'raw',
                'label' => 'Pelanggan',
                'value' => function ($model) {
                    $pelanggan = Pelanggan::findOne(['id_pelanggan' => $model->id_pelanggan]);
                    return (!empty($pelanggan->nama_pelanggan)) ? $pelanggan->nama_pelanggan : '';
                }
            ],
            [
                'attribute' => 'id_barang',
                'format' => 'raw',
                'label' => 'Barang',
                'value' => function ($model) {
                    $barang = Barang::findOne(['id_barang' => $model->id_barang]);
                    return (!empty($barang->nama_barang)) ? $barang->nama_barang . ' - ' . number_format($barang->harga) : '';
                }
            ],
        ],
    ]) ?>

</div>