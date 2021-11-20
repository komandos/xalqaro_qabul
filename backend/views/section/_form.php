<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model common\models\Section */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="container-fluid">

    <div class="card">
        <div class="card-body">

            <?php $form = ActiveForm::begin(); ?>

            <?= $form->field($model, 'code')->textInput(['maxlength' => true]) ?>

            <?= $form->field($model, 'direction')->textInput(['maxlength' => true]) ?>

            <?= $form->field($model, 'university')->textInput(['maxlength' => true]) ?>

            <?= $form->field($model, 'quota')->textInput(['type'=>'number']) ?>

            <?= $form->field($model, 'form_education')->textInput(['maxlength' => true]) ?>

            <?= $form->field($model, 'edu_lang')->textInput(['maxlength' => true]) ?>

            <?= $form->field($model, 'duration')->textInput(['maxlength' => true]) ?>

            <?= $form->field($model, 'type')->dropDownList(['magistr'=>'magistr','bakalavr'=>'bakalavr']) ?>
            <?= $form->field($model, 'status')->dropDownList(['0'=>'DeActive','1'=>'Active'],['prompt'=>'--Select--']) ?>

            <div class="form-group">
                <?= Html::submitButton('Save', ['class' => 'btn btn-success']) ?>
            </div>

            <?php ActiveForm::end(); ?>

        </div>
    </div>
</div>
