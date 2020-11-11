<?php

use backend\models\Barang;
use backend\models\Kolektor;
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
                    <?= Html::a('Pembayaran', ['update', 'id' => $model->id_penjualan], ['class' => 'btn btn-success']) ?>

                </div>
                <div class="col-md-6">
                    <table class="table table-striped">
                        <tr>
                            <td><b>Yang Harus Dibayar</b></td>
                            <td></td>
                        </tr>
                        <tr>
                            <td></td>
                            <td></td>
                        </tr>
                        <tr>
                            <td></td>
                            <td></td>
                        </tr>
                        <tr>
                            <td></td>
                            <td></td>
                        </tr>
                    </table>
                </div>
            </div>
        </div>
    </div>

</div>