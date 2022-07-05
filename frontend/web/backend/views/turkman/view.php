<?php

use yii\helpers\Html;
use yii\widgets\DetailView;

/* @var $this yii\web\View */
/* @var $model common\models\TurkmanProfile */

$this->title = $model->id;
$this->params['breadcrumbs'][] = ['label' => Yii::t('app', 'Turkman Profiles'), 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
\yii\web\YiiAsset::register($this);
?>
<div class="turkman-profile-view">

    <h1><?= Html::encode($this->title) ?></h1>

    <p>
        <?= Html::a(Yii::t('app', 'Update'), ['update', 'id' => $model->id], ['class' => 'btn btn-primary']) ?>
        <?= Html::a(Yii::t('app', 'Delete'), ['delete', 'id' => $model->id], [
            'class' => 'btn btn-danger',
            'data' => [
                'confirm' => Yii::t('app', 'Are you sure you want to delete this item?'),
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
            'state_id',
            'province_id',
            'region_id',
            'address:ntext',
            'phone_1',
            'phone_2',
            'date_birth',
            'email:email',
            'gender_id',
            'image:ntext',
            'status:boolean',
            'created_at',
            'updated_at',
            'diplom',
            'vaqtinchalik_pasport',
            'year_of_graduation',
            'medsertifikat',
            'pass_seria',
            'pass_num',
            'pass_file',
            'section_id',
            'ariza',
        ],
    ]) ?>

</div>
