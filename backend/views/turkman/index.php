<?php

use common\models\TurkmanProfile;
use yii\helpers\Html;
use yii\helpers\Url;
use yii\grid\ActionColumn;
use yii\grid\GridView;

/* @var $this yii\web\View */
/* @var $searchModel common\models\query\TurkmanProfileSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = 'Turkman Profiles';
//$this->params['breadcrumbs'][] = $this->title;
?>
<div class="container-fluid">
    <div class="card">
        <div class="card-body">
            <h1><?= Html::encode($this->title) ?></h1>


            <!--    --><?php // echo $this->render('_search', ['model' => $searchModel]); ?>
            <?= Html::a('Export', ['index', 'export' => 1], ['class' => 'btn btn-outline-info']) ?>
            <?= GridView::widget([
                'dataProvider' => $dataProvider,
                'filterModel' => $searchModel,
                'columns' => [
                    ['class' => 'yii\grid\SerialColumn'],

                    'id',
                    'first_name',
                    'last_name',
                    'patronymic',
                    'state_id',
                    //'province_id',
                    //'region_id',
                    //'address:ntext',
                    //'phone_1',
                    //'phone_2',
                    //'date_birth',
                    //'email:email',
                    //'gender_id',
                    //'image:ntext',
                    //'status:boolean',
                    //'created_at',
                    //'updated_at',
                    //'diplom',
                    //'transkriptlar',
                    //'year_of_graduation',
                    //'sertifikat',
                    //'pass_seria',
                    //'pass_num',
                    //'pass_file',
                    //'section_id',
                    [
                        'class' => ActionColumn::className(),
                        'urlCreator' => function ($action, TurkmanProfile $model, $key, $index, $column) {
                            return Url::toRoute([$action, 'id' => $model->id]);
                        },
                        'template' => '{view} {delete}',

                    ],
                ],
            ]); ?>

        </div>
    </div>
</div>
