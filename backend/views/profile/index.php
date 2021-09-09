<?php

use common\models\constant\GeneralStatus;
use common\models\Profile;
use kartik\select2\Select2;
use yii\helpers\ArrayHelper;
use yii\helpers\Html;
use yii\grid\GridView;

/* @var $this yii\web\View */
/* @var $searchModel backend\models\search\ProfileSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = 'Profiles';
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="container-fluid">

    <div class="card">
        <div class="card-body">

            <h1><?= Html::encode($this->title) ?></h1>


            <?php // echo $this->render('_search', ['model' => $searchModel]); ?>

            <?= GridView::widget([
                'dataProvider' => $dataProvider,
                'filterModel' => $searchModel,
                'columns' => [
                    ['class' => 'yii\grid\SerialColumn'],

                    //'id',
                    [
                        'label' => 'FIO',
                        'attribute' => 'first_name',
                        'value' => function (Profile $model) {
                            return $model->last_name . ' ' . $model->first_name . ' ' . $model->patronymic;
                        }

                    ],
                    [
                        'label' => 'Davlat',
                        'value' => 'state.name'
                    ],
                    [
                        'label' => 'Viloyat',
                        'value' => 'province.name'
                    ],
                    [
                        'label' => 'Region',
                        'value' => 'region.name'
                    ],
                    //'province_id',
                    //'region_id',
                    //'address:ntext',
                    //'phone_1',
                    //'phone_2',
                    //'date_birth',
                    //'email:email',
                    //'gender_id',
                    //'image:ntext',
                    //'status',

                    [
                        'attribute' => 'status',
                        'format' => 'html',
                        'value' => function ($model) {
                            return GeneralStatus::getString($model->status);
                        },
                        'filter' => GeneralStatus::getList()
                    ],
                    [
                        'label' => 'Passport',
                        'attribute' => 'pass_num',
                        'value' => function (Profile $model) {
                            return $model->pass_seria . ' ' . $model->pass_num;
                        }
                    ],
                    //'created_at',
                    //'updated_at',
                    //'diplom',
                    //'transkriptlar',
                    //'year_of_graduation',
                    //'sertifikat',
                    //'pass_seria',
                    //'pass_num',
                    //'pass_file',

                    [
                        'class' => 'yii\grid\ActionColumn',
                        'template' => '{view} {delete}',
                    ],
                ],
            ]); ?>


        </div>
    </div>
</div>
