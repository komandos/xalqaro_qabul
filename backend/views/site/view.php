<?php

use yii\helpers\Html;
use yii\widgets\DetailView;

/* @var $this yii\web\View */
/* @var $model common\models\Profile */

$this->title = $model->id;
$this->params['breadcrumbs'][] = ['label' => 'Profiles', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
\yii\web\YiiAsset::register($this);
?>
<div class="profile-view">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= DetailView::widget([
        'model' => $model,
        'attributes' => [
            'id',
            'first_name',
            'last_name',
            'patronymic',
            [
                'label' => 'State',
                'attribute' => 'state.name'
            ],
            [
                'label' => 'Province',
                'attribute' => 'province.name'
            ],
            [
                'label' => 'Region',
                'attribute' => 'region.name'
            ],
            'address:ntext',
            'phone_1',
            'phone_2',
            'date_birth',
            'email:email',
            [
                'label' => 'Gender',
                'attribute' => 'gender.name'
            ],

            [
                'label' => 'Ogohlantirish',
                'format' => 'html',
                'attribute' => function ($model) {
                    if ($model->status === 1) {
                        return '<p style="color: #02a302">Ogohlantirilgan</p>';
                    }
                }
            ],
            [
                'label' => 'Passport',
                'attribute' => function ($model) {
                return $model->pass_seria .' '.$model->pass_num;
                }
            ],
            'year_of_graduation',
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
                'label' => 'Diplom fayl',
                'format' => 'html',
                'attribute' => function ($model) {
                    if ($model->diplom === null) {
                        return 'Fayl Yo`q';
                    } else {
                        return Html::a('Yuklash', ['profile/download', 'file' => $model->diplom], ['target' => '_blank', 'class' => 'fa fa-download']);
                    }

                }
            ],
            [
                'label' => 'Diplom ilovasi',
                'format' => 'html',
                'attribute' => function ($model) {
                    if ($model->transkriptlar === null) {
                        return 'Fayl Yo`q';
                    } else {
                        return Html::a('Yuklash', ['profile/download', 'file' => $model->transkriptlar], ['target' => '_blank', 'class' => 'fa fa-download']);
                    }

                }
            ],
            [
                'label' => 'Sertifikat',
                'format' => 'html',
                'attribute' => function ($model) {
                    if ($model->sertifikat === null) {
                        return 'Fayl Yo`q';
                    } else {
                        return Html::a('Yuklash', ['profile/download', 'file' => $model->sertifikat], ['target' => '_blank', 'class' => 'fa fa-download']);
                    }

                }
            ],
            [
                'label' => 'Passport elektron fayl',
                'format' => 'html',
                'attribute' => function ($model) {
                    if ($model->pass_file === null) {
                        return 'Fayl Yo`q';
                    } else {
                        return Html::a('Yuklash', ['profile/download', 'file' => $model->pass_file], ['target' => '_blank', 'class' => 'fa fa-download']);
                    }
                }
            ],
            'created_at',
            'updated_at',
        ],
    ]) ?>

</div>
