<?php

use yii\helpers\Html;
use yii\grid\GridView;

/* @var $this yii\web\View */
/* @var $searchModel backend\models\search\SectionSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = 'Sections';
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="container-fluid">

    <div class="card">
        <div class="card-body">
            <h1><?= Html::encode($this->title) ?></h1>

            <p>
                <?= Html::a('Create Section', ['create'], ['class' => 'btn btn-info']) ?>
            </p>

            <?php // echo $this->render('_search', ['model' => $searchModel]); ?>

            <?= GridView::widget([
                'dataProvider' => $dataProvider,
                'filterModel' => $searchModel,
                'columns' => [
                    ['class' => 'yii\grid\SerialColumn'],

                    //'id',
                    'code',
                    'direction',
                    'university',
                    'quota',
                    'form_education',
                    'edu_lang',
                    'duration',
                    'type',
                    //'created_at',
                    //'updated_at',

                    ['class' => 'yii\grid\ActionColumn'],
                ],
            ]); ?>


        </div>
    </div>
</div>
