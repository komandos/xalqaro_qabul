<?php

use yii\helpers\Html;
use yii\widgets\DetailView;

/* @var $this yii\web\View */
/* @var $model common\models\TurkmanProfile */

$this->title = $model->id;
$this->params['breadcrumbs'][] = ['label' => 'Turkman Profiles', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
\yii\web\YiiAsset::register($this);
?>
<div class="turkman-profile-view">

    <h1><?= Html::encode($this->title) ?></h1>

    <p>
        <?= Html::a('Update', ['update', 'id' => $model->id], ['class' => 'btn btn-primary']) ?>
        <?= Html::a('Delete', ['delete', 'id' => $model->id], [
            'class' => 'btn btn-danger',
            'data' => [
                'confirm' => 'Are you sure you want to delete this item?',
                'method' => 'post',
            ],
        ]) ?>
    </p>

    <?= DetailView::widget([
        'model' => $model,
        'attributes' => [
            'id',
            'first_name',
            'last_name',
            'patronymic',
//            'state_id',
            [
                'attribute' => 'state_id',
                'value' => $model->state->name,
            ],
            'province_id',
            'region_id',
            'address:ntext',
            'phone_1',
            'phone_2',
            'date_birth:date',
            'email:email',
//            'gender_id',
            [
                    'attribute'=>'gender_id',
                    'value'=>$model->gender->name,
            ],
            'status',
            'year_of_graduation:date',
            'pass_seria',
            'pass_num',
            [
                'label' => 'Diplom',
                'format' => 'html',
                'attribute' => function ($model) {
                    if ($model->diplom === null) {
                        return 'Fayl Yo`q';
                    } else {
                        return Html::a('Yuklash', ['profile/download', 'file' => $model->diplom], ['target' => '_blank', 'class' => 'fa fa-download']);
                    }

                }
            ],
//            'diplom',
//            'image:ntext',
            [
                'label' => 'Fotosurat',
                'format' => 'html',
                'attribute' => function ($model) {
                    if ($model->image === null) {
                        return 'Fayl Yo`q';
                    } else {
                        return Html::a('Yuklash', ['profile/download', 'file' => $model->image], ['target' => '_blank', 'class' => 'fa fa-download']);
                    }

                }
            ],
            [
                'label' => 'Vaqtinchalik pasport',
                'format' => 'html',
                'attribute' => function ($model) {
                    if ($model->vaqtinchalik_pasport === null) {
                        return 'Fayl Yo`q';
                    } else {
                        return Html::a('Yuklash', ['profile/download', 'file' => $model->vaqtinchalik_pasport], ['target' => '_blank', 'class' => 'fa fa-download']);
                    }

                }
            ],
            [
                'label' => 'medsertifikat',
                'format' => 'html',
                'attribute' => function ($model) {
                    if ($model->medsertifikat === null) {
                        return 'Fayl Yo`q';
                    } else {
                        return Html::a('Yuklash', ['profile/download', 'file' => $model->medsertifikat], ['target' => '_blank', 'class' => 'fa fa-download']);
                    }

                }
            ],
            [
                'label' => 'Pasport fayli',
                'format' => 'html',
                'attribute' => function ($model) {
                    if ($model->pass_file === null) {
                        return 'Fayl Yo`q';
                    } else {
                        return Html::a('Yuklash', ['profile/download', 'file' => $model->pass_file], ['target' => '_blank', 'class' => 'fa fa-download']);
                    }

                }
            ],
//            'vaqtinchalik_pasport',
//            'medsertifikat',
//            'pass_file',
//            'section_id',
            [
                'label' => 'Ariza',
                'format' => 'html',
                'attribute' => function ($model) {
                    if ($model->ariza === null) {
                        return 'Fayl Yo`q';
                    } else {
                        return Html::a('Yuklash', ['profile/download', 'file' => $model->ariza], ['target' => '_blank', 'class' => 'fa fa-download']);
                    }

                }
            ],
            'created_at:datetime',
            'updated_at:datetime',
        ],
    ]) ?>

</div>
