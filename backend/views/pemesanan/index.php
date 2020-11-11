<?php

use backend\models\Barang;
use backend\models\Pelanggan;
use backend\models\Penjualan;
use backend\models\Sales;
use yii\helpers\Html;
use yii\grid\GridView;

/* @var $this yii\web\View */
/* @var $searchModel backend\models\PemesananSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = 'Pemesanans';
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="pemesanan-index">

    <h1><?= Html::encode($this->title) ?></h1>
    <?php // echo $this->render('_search', ['model' => $searchModel]); 
    ?>

    <p>
        <?= Html::a('Create Pemesanan', ['create'], ['class' => 'btn btn-success']) ?>
    </p>

    <?= GridView::widget([
        'dataProvider' => $dataProvider,
        'filterModel' => $searchModel,
        'columns' => [
            ['class' => 'yii\grid\SerialColumn'],

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
            [
                'label' => 'Status',
                'format' => 'raw',
                'value' => function ($model) {
                    $penjualan = Penjualan::find()->where(['id_pemesanan' => $model->id_pemesanan])->one();
                    if (!empty($penjualan->id_pemesanan)) {
                        return '<span class="label label-success">Disetujui</span>';
                    } else {
                        return '<span class="label label-warning">Menunngu Disetujui</span>';
                    }
                }
            ],

            ['class' => 'yii\grid\ActionColumn'],
        ],
    ]); ?>
</div>