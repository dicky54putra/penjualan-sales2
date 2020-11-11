<?php

use yii\helpers\Html;
use kartik\grid\GridView;

/* @var $this yii\web\View */
/* @var $searchModel backend\models\EkspedisiSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = 'Ekspedisi';
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="ekspedisi-index">

    <h1><?= Html::encode($this->title) ?></h1>
    <?php // echo $this->render('_search', ['model' => $searchModel]); ?>
    <ul class="breadcrumb">
        <li><a href="/">Home</a></li>
        <li class="active">Ekspedisi</li>
    </ul>

    <p>
        <?= Html::a('Create Ekspedisi', ['create'], ['class' => 'btn btn-success']) ?>
    </p>

    <?= GridView::widget([
        'dataProvider' => $dataProvider,
        'filterModel' => $searchModel,
        'columns' => [
            ['class' => 'yii\grid\SerialColumn'],

            // 'id_ekspedisi',
            'tanggal',
            'type',
            [
                'attribute' => 'id_destination',
                'label' => 'Destination',
                'value' => function ($model) {
                    if (!empty($model->destination->destination_name)) {
                        # code...
                        return $model->destination->destination_name;
                    } else {
                        # code...
                    }
                }
            ],
            // 'product',
            //'long',
            //'wide',
            //'high',
            //'note:ntext',
            'recipient_name',
            //'recipient_company',
            //'recipient_address:ntext',
            //'recipient_zip_code',
            //'recipient_phone',
            //'recipient_email:email',
            'shipper_name',
            //'shipper_company',
            //'shipper_address:ntext',
            //'shipper_zip_code',
            //'shipper_phone',
            //'shipper_email:email',
            'status',
            //'id_login',

            [
                'class' => 'yii\grid\ActionColumn',
                'header' => 'Aksi',
                'headerOptions' => ['style' => 'color:#337ab7'],
                'template' => "{view} {update} {delete}",
                'buttons' => [
                    'view' => function ($url, $model) {
                        return Html::a('<button class = "btn btn-info"><span class="glyphicon glyphicon-eye-open"></span> Detail </button>', $url, [
                            'title' => Yii::t('app', 'lead-view'),
                        ]);
                    },

                    'update' => function ($url, $model) {
                        return Html::a('<button class = "btn btn-primary"><span class="glyphicon glyphicon-edit"></span> Update</button>', $url, [
                            'title' => Yii::t('app', 'lead-update'),
                        ]);
                    },
                    'delete' => function ($url, $model) {
                        return Html::a('<button class = "btn btn-danger"><span class="glyphicon glyphicon-trash"></span> Detele</button>', $url, [
                            'title' => Yii::t('app', 'lead-delete'),
                            'data' => [
                                'confirm' => 'Anda yakin ingin menghapus data?',
                                'method' => 'post'
                            ],
                        ]);
                    },

                ],
                'urlCreator' => function ($action, $model, $key, $index) {
                    if ($action === 'view') {
                        $url = 'index.php?r=ekspedisi/view&id=' . $model->id_ekspedisi;
                        return $url;
                    }

                    if ($action === 'update') {
                        $url = 'index.php?r=ekspedisi/update&id=' . $model->id_ekspedisi;
                        return $url;
                    }

                    if ($action === 'delete') {
                        $url = 'index.php?r=ekspedisi/delete&id=' . $model->id_ekspedisi;
                        return $url;
                    }
                }
            ],
        ],
        'containerOptions' => ['style' => 'overflow: auto'], // only set when $responsive = false
        'headerRowOptions' => ['class' => 'kartik-sheet-style'],
        'filterRowOptions' => ['class' => 'kartik-sheet-style'],
        //'pjax' => true, // pjax is set to always true for this demo
        // set your toolbar
        'toolbar' =>  [

            '{export}',
            '{toggleData}',
        ],
        'toggleDataContainer' => ['class' => 'btn-group mr-2'],
        // set export properties
        'export' => [
            'fontAwesome' => true
        ],
        // parameters from the demo form
        //'bordered' => $bordered,
        //'striped' => $striped,
        //'condensed' => $condensed,
        //'responsive' => $responsive,
        //'hover' => $hover,
        //'showPageSummary' => $pageSummary,
        'panel' => [
            'type' => GridView::TYPE_PRIMARY,
            'heading' => '<span class="fa fa-table"></span> Destination',
        ],
        'persistResize' => false,
        'toggleDataOptions' => ['minCount' => 100],
        'autoXlFormat' => true,
        'toggleDataContainer' => ['class' => 'btn-group mr-2'],
        'export' => [
            'showConfirmAlert' => false,
            'target' => GridView::TARGET_BLANK
        ],
        'exportConfig' => [
            GridView::EXCEL =>  [
                'filename' => 'Akun',
                'showPageSummary' => true,
            ]

        ],
    ]); ?>
</div>
