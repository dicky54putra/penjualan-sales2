<?php

use backend\models\Kolektor;
use yii\helpers\Html;
use yii\grid\GridView;

/* @var $this yii\web\View */
/* @var $searchModel backend\models\PenjualanSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = 'Penjualan';
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="penjualan-index">

    <h1><?= Html::encode($this->title) ?></h1>
    <?php // echo $this->render('_search', ['model' => $searchModel]); 
    ?>

    <p>
        <!-- <?= Html::a('Create Penjualan', ['create'], ['class' => 'btn btn-success']) ?> -->
    </p>
    <div class="box box-success">
        <div class="box-header">
            <div class="col-md-12" style="padding: 0;">
                <div class="box-body">
                    <?php
                    $userrole = Yii::$app->db->createCommand("SELECT system_role.nama_role FROM user_role INNER JOIN system_role ON system_role.id_system_role = user_role.id_system_role WHERE user_role.id_login = " . Yii::$app->user->id)->queryScalar();
                    if ($userrole == 'ADMINISTRATOR') {
                        $updel = ' {update} {delete}';
                    } else {
                        $updel = ' {view}';
                    }
                    ?>
                    <?= GridView::widget([
                        'dataProvider' => $dataProvider,
                        'filterModel' => $searchModel,
                        'columns' => [
                            ['class' => 'yii\grid\SerialColumn'],

                            // 'id_penjualan',
                            'tanggal_penjualan',
                            'total_penjualan',
                            [
                                'attribute' => 'id_kolektor',
                                'format' => 'raw',
                                'label' => 'Kolektor',
                                'value' => function ($model) {
                                    $kolektor = Kolektor::findOne(['id_kolektor' => $model->id_kolektor]);
                                    return (!empty($kolektor->nama_kolektor)) ? $kolektor->nama_kolektor : '';
                                }
                            ],
                            // 'id_pemesanan',

                            [
                                'class' => 'yii\grid\ActionColumn',
                                'header' => 'Actions',
                                'headerOptions' => ['style' => 'color:#337ab7'],
                                'template' => $updel,
                            ],
                        ],
                    ]); ?>
                </div>
            </div>
        </div>
    </div>
</div>