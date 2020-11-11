<?php

use backend\models\Kolektor;
use yii\helpers\Html;
use yii\grid\GridView;

/* @var $this yii\web\View */
/* @var $searchModel backend\models\PenjualanSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = 'Penjualans';
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="penjualan-index">

    <h1><?= Html::encode($this->title) ?></h1>
    <?php // echo $this->render('_search', ['model' => $searchModel]); 
    ?>

    <p>
        <?= Html::a('Create Penjualan', ['create'], ['class' => 'btn btn-success']) ?>
    </p>

    <?= GridView::widget([
        'dataProvider' => $dataProvider,
        'filterModel' => $searchModel,
        'columns' => [
            ['class' => 'yii\grid\SerialColumn'],

            'id_penjualan',
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

            ['class' => 'yii\grid\ActionColumn'],
        ],
    ]); ?>
</div>