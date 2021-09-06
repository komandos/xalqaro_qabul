<?php

/* @var $this yii\web\View */
/* @var $model \common\models\Vakancy */

/* @var $dataProvider \yii\data\ActiveDataProvider */

use yii\grid\GridView;
use yii\grid\SerialColumn;

$this->title = Yii::t('app', 'UrSU Questions');
?>
<div class="site-index">
    <h1>
        <?= Yii::t('app', 'Questions') ?>
    </h1>
    <?= GridView::widget([
        'dataProvider' => $dataProvider,
        'columns' => [
            ['class' => SerialColumn::class],
            [
                'label' => 'Code',
                'attribute' => 'code',
            ],
            [
                'label' => 'Name',
                'attribute' => 'name',
            ],
            [
                'label' => 'File',
                'attribute' => 'file',
            ],


        ]
    ]) ?>
</div>
