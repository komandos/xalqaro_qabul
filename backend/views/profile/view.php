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
            'status',
            'created_at',
            'updated_at',
            'diplom',
            'transkriptlar',
            'year_of_graduation',
            'sertifikat',
            'pass_seria',
            'pass_num',
            'pass_file',
        ],
    ]) ?>

</div>
