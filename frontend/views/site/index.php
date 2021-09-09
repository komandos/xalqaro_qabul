<?php

/* @var $this yii\web\View */
/* @var $model Section */

/* @var $dataProvider \yii\data\ActiveDataProvider */

use backend\widgets\Select2Default;
use common\models\Gender;
use common\models\Province;
use common\models\Section;
use kartik\depdrop\DepDrop;
use yii\bootstrap4\ActiveForm;
use yii\grid\GridView;
use yii\grid\SerialColumn;
use yii\helpers\ArrayHelper;
use yii\helpers\Html;
use yii\helpers\Url;
use yii\widgets\MaskedInput;

$this->title = Yii::t('app', 'UrSU Vacancy');
?>
<div class="site-index">
    <h4 class="text-center">
        <?= Yii::t('app', 'Urganch davlat universitetining 
2021/2022 o`quv yili qabul uchun xorijiy oliy ta`lim muassasalari bilan xamkorlikda qo`shma ta`lim dasturlari asosida kadrlar tayyorlash bo`yicha to`lov-kontrakt asosida qabul ko`rsatkichlari
') ?>
    </h4>
    <?= GridView::widget([
        'dataProvider' => $dataProvider,
        'pager' => ['class' => '\yii\bootstrap4\LinkPager'],
        'options' => [
            'class' => ' table-responsive'
        ],
        'columns' => [
            ['class' => SerialColumn::class],
            [
                'label' => 'Shifr',
                'attribute' => 'code',
            ],
            [
                'label' => 'Ta`lim yo`nalishlari va mutaxassisliklari nomi',
                'attribute' => 'direction',
            ],
            [
                'label' => 'Xamkor xorijiy oliy ta`lim muassasasi nomi',
                'attribute' => 'university',
            ],
            [
                'label' => 'To`lov-kantrakti asosida qabul ko`rsatkichlari',
                'attribute' => 'quota'
            ],
            [
                'label' => 'Ta`lim shakli',
                'attribute' => 'form_education',
            ],
            [
                'label' => 'Ta`lim tili',
                'attribute' => 'edu_lang',
            ],
            [
                'label' => 'O`qish muddati (OTM + xamkor OTM,yil)',
                'attribute' => 'duration',
            ],
            [
                'label' => 'Ta`lim turi',
                'value' =>function(Section $model){
                    if ($model->type ==='bakalavr'){
                        return 'Bakalavriyat';
                    }
                    if ($model->type === 'magistr'){
                        return 'Magistratura';
                    }
                }
            ],

            [
                'label' => 'Ko`rish',
                'format' => 'html',
                'value' => function (Section $model, $key, $index) {
                    return Html::a('Ariza', ['site/send-resume', 'id' => $model->id], ['class' => 'btn btn-info']);
                }

            ],
        ]
    ]) ?>
</div>

