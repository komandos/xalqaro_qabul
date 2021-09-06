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
        <?= Yii::t('app', 'Урганч давлат университетининг 
2021/2022 ўқув йили қабули учун хорижий олий таълим муассасалари билан ҳамкорликда қўшма таълим дастурлари асосида кадрлар тайёрлаш бўйича тўлов-контракт асосида қабул кўрсаткичлари
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
                'label' => 'Шифр',
                'attribute' => 'code',
            ],
            [
                'label' => 'Таълим йўналишлари ва мутахассисликлар номи',
                'attribute' => 'direction',
            ],
            [
                'label' => 'Ҳамкор хорижий олий таълим муассасаси номи',
                'attribute' => 'university',
            ],
            [
                'label' => 'Тўлов-контракт асосида қабул кўрсаткич-лари',
                'attribute' => 'quota'
            ],
            [
                'label' => 'Таълим шакли',
                'attribute' => 'form_education',
            ],
            [
                'label' => 'Таълим тили',
                'attribute' => 'edu_lang',
            ],
            [
                'label' => 'Ўқиш муддати (ОТМ+ҳамкор ОТМ, йил)',
                'attribute' => 'duration',
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

