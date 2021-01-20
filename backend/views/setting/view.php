<?php

use yii\helpers\Html;
use yii\widgets\DetailView;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model backend\models\Setting */

$this->title = 'Detail Setting Company';
$this->params['breadcrumbs'][] = ['label' => 'Settings', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
\yii\web\YiiAsset::register($this);
?>
<div class="setting-view">

    <h1><?= Html::encode($this->title) ?></h1>

    <p>
        <!-- <?= Html::a('Update', ['update', 'id' => $model->id_setting], ['class' => 'btn btn-primary']) ?>
        <?= Html::a('Delete', ['delete', 'id' => $model->id_setting], [
            'class' => 'btn btn-danger',
            'data' => [
                'confirm' => 'Are you sure you want to delete this item?',
                'method' => 'post',
            ],
        ]) ?> -->
    </p>
    <div class="box">
        <div class="box-header">
            <div class="col-md-12" style="padding: 0;">
                <div class="box-body">
                    <?= DetailView::widget([
                        'model' => $model,
                        'attributes' => [
                            // 'id_setting',
                            'nama',
                            'email:email',
                            'alamat:ntext',
                            'telepon',
                            'nama_bank',
                            'nomor_rekening',
                            [
                                'attribute' => 'foto',
                                'format'    => 'html',
                                'value'     => function ($model) {
                                    return "<img src='upload/$model->foto' width='150'>";
                                }
                            ],
                        ],
                    ]) ?>

                </div>
            </div>
        </div>
    </div>
</div>