<?php

use common\models\Profile;
use common\models\Section;
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
                    [
                        'label' => 'Ro`yxatdan o`tkanlar soni',
                        'attribute' => 'count',
                        'value' => function (Section $model) {
                            return count(Profile::find()->where(['section_id' => $model->id])->all());
                        }
                    ],
                    //'created_at',
                    //'updated_at',

                    [
                        'class' => 'yii\grid\ActionColumn',
                        'template' => '{view}{delete}{update}',
                        'visibleButtons'=>[
                            'delete' => Yii::$app->getUser()->getIdentity()->isAdmin(),
                            'update' => Yii::$app->getUser()->getIdentity()->isAdmin(),
                        ]
                    ],
                ],
            ]); ?>


        </div>
    </div>
</div>
