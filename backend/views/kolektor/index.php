<?php

use yii\helpers\Html;
use yii\grid\GridView;

/* @var $this yii\web\View */
/* @var $searchModel backend\models\KolektorSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = 'Kolektors';
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="kolektor-index">

    <h1><?= Html::encode($this->title) ?></h1>
    <?php // echo $this->render('_search', ['model' => $searchModel]); ?>

    <p>
        <?= Html::a('Create Kolektor', ['create'], ['class' => 'btn btn-success']) ?>
    </p>

    <?= GridView::widget([
        'dataProvider' => $dataProvider,
        'filterModel' => $searchModel,
        'columns' => [
            ['class' => 'yii\grid\SerialColumn'],

            'id_kolektor',
            'nama_kolektor',
            'alamat:ntext',
            'tlp',

            ['class' => 'yii\grid\ActionColumn'],
        ],
    ]); ?>
</div>
