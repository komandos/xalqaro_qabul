<?php

use yii\helpers\Html;
use yii\grid\GridView;
use yii\widgets\Pjax;

/* @var $this yii\web\View */
/* @var $searchModel backend\models\search\ProvinceSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = Yii::t('app', 'Provinces');
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="container-fluid">

    <div class="card">
        <div class="card-body">

            <h1><?= Html::encode($this->title) ?></h1>
            <?php Pjax::begin(); ?>

            <p>
                <?= Html::a(Yii::t('app', 'Create Province'), ['create'], ['class' => 'btn btn-info']) ?>
            </p>
                <p>
                    <?= Html::a(Yii::t('app', 'Import Province'), ['province/province-import2'], ['class' => 'btn btn-primary']) ?>
                </p>

            <?php // echo $this->render('_search', ['model' => $searchModel]); ?>

            <?= GridView::widget([
                'dataProvider' => $dataProvider,
                'filterModel' => $searchModel,
                'columns' => [
                    ['class' => 'yii\grid\SerialColumn'],

                    //'id',
                    'name',
                    'status',
                    'state_id',
                    'created_at',
                    //'updated_at',

                    ['class' => 'yii\grid\ActionColumn'],
                ],
            ]); ?>

        </div>
        <?php Pjax::end(); ?>
    </div>
</div>
