<?php

use yii\helpers\Html;
use yii\grid\GridView;

/* @var $this yii\web\View */
/* @var $searchModel backend\models\AngsuranSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = 'Angsurans';
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="angsuran-index">

    <h1><?= Html::encode($this->title) ?></h1>
    <?php // echo $this->render('_search', ['model' => $searchModel]); ?>

    <p>
        <?= Html::a('Create Angsuran', ['create'], ['class' => 'btn btn-success']) ?>
    </p>

    <?= GridView::widget([
        'dataProvider' => $dataProvider,
        'filterModel' => $searchModel,
        'columns' => [
            ['class' => 'yii\grid\SerialColumn'],

            'id_angsuran',
            'tanggal_angsuran',
            'total_angsuran',
            'id_kolektor',
            'id_pemesanan',

            ['class' => 'yii\grid\ActionColumn'],
        ],
    ]); ?>
</div>
