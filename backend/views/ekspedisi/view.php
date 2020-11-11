<?php

use yii\helpers\Html;
use yii\widgets\DetailView;

/* @var $this yii\web\View */
/* @var $model backend\models\Ekspedisi */

$this->title = 'Detail Ekspedisi : ' . $model->id_ekspedisi;
// $this->params['breadcrumbs'][] = ['label' => 'Ekspedisis', 'url' => ['index']];
// $this->params['breadcrumbs'][] = $this->title;
\yii\web\YiiAsset::register($this);
?>
<div class="ekspedisi-view">

    <h1><?= Html::encode($this->title) ?></h1>
    <ul class="breadcrumb">
        <li><a href="/">Home</a></li>
        <li><?= Html::a('Ekspedisi', ['index']) ?></li>
        <li class="active"><?= $this->title ?></li>
    </ul>

    <p>
        <?= Html::a('<span class="glyphicon glyphicon-circle-arrow-left"></span> Back', ['index'], ['class' => 'btn btn-warning']) ?>
        <?= Html::a('<span class="glyphicon glyphicon-edit"></span> Update', ['update', 'id' => $model->id_ekspedisi], ['class' => 'btn btn-primary']) ?>
        <?= Html::a('<span class="glyphicon glyphicon-trash"></span> Delete', ['delete', 'id' => $model->id_ekspedisi], [
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
            'id_ekspedisi',
            'tanggal',
            'type',
            'id_destination',
            'product',
            'long',
            'wide',
            'high',
            'note:ntext',
            'recipient_name',
            'recipient_company',
            'recipient_address:ntext',
            'recipient_zip_code',
            'recipient_phone',
            'recipient_email:email',
            'shipper_name',
            'shipper_company',
            'shipper_address:ntext',
            'shipper_zip_code',
            'shipper_phone',
            'shipper_email:email',
            'status',
            'id_login',
        ],
    ]) ?>

</div>
