<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model backend\models\search\SectionSearch */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="section-search">

    <?php $form = ActiveForm::begin([
        'action' => ['index'],
        'method' => 'get',
    ]); ?>

    <?= $form->field($model, 'id') ?>

    <?= $form->field($model, 'code') ?>

    <?= $form->field($model, 'direction') ?>

    <?= $form->field($model, 'university') ?>

    <?= $form->field($model, 'quota') ?>

    <?php // echo $form->field($model, 'form_education') ?>

    <?php // echo $form->field($model, 'edu_lang') ?>

    <?php // echo $form->field($model, 'duration') ?>

    <?php // echo $form->field($model, 'created_at') ?>

    <?php // echo $form->field($model, 'updated_at') ?>

    <div class="form-group">
        <?= Html::submitButton('Search', ['class' => 'btn btn-primary']) ?>
        <?= Html::resetButton('Reset', ['class' => 'btn btn-outline-secondary']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
