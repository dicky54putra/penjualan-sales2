<?php

use yii\helpers\Html;
use yii\grid\GridView;

/* @var $this yii\web\View */
/* @var $searchModel backend\models\KolektorSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = 'Kolektor';
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="kolektor-index">

    <h1><?= Html::encode($this->title) ?></h1>
    <?php // echo $this->render('_search', ['model' => $searchModel]); 
    ?>

    <p>
        <?= Html::a('Create Kolektor', ['create'], ['class' => 'btn btn-success']) ?>
    </p>
    <div class="box box-success">
        <div class="box-header">
            <div class="col-md-12" style="padding: 0;">
                <div class="box-body">
                    <?= GridView::widget([
                        'dataProvider' => $dataProvider,
                        'filterModel' => $searchModel,
                        'columns' => [
                            ['class' => 'yii\grid\SerialColumn'],

                            // 'id_kolektor',
                            'nama_kolektor',
                            'alamat:ntext',
                            'tlp',

                            ['class' => 'yii\grid\ActionColumn'],
                        ],
                    ]); ?>
                </div>
            </div>
        </div>
    </div>
</div>