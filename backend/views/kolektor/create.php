<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model backend\models\Kolektor */

$this->title = 'Create Kolektor';
$this->params['breadcrumbs'][] = ['label' => 'Kolektors', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="kolektor-create">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
