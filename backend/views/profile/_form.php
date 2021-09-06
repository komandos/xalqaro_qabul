<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model common\models\Profile */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="container-fluid">

    <div class="card">
        <div class="card-body">


            <?php $form = ActiveForm::begin(); ?>

            <?= $form->field($model, 'first_name')->textInput(['maxlength' => true]) ?>

            <?= $form->field($model, 'last_name')->textInput(['maxlength' => true]) ?>

            <?= $form->field($model, 'patronymic')->textInput(['maxlength' => true]) ?>

            <?= $form->field($model, 'state_id')->textInput() ?>

            <?= $form->field($model, 'province_id')->textInput() ?>

            <?= $form->field($model, 'region_id')->textInput() ?>

            <?= $form->field($model, 'address')->textarea(['rows' => 6]) ?>

            <?= $form->field($model, 'phone_1')->textInput(['maxlength' => true]) ?>

            <?= $form->field($model, 'phone_2')->textInput(['maxlength' => true]) ?>

            <?= $form->field($model, 'date_birth')->textInput() ?>

            <?= $form->field($model, 'email')->textInput(['maxlength' => true]) ?>

            <?= $form->field($model, 'gender_id')->textInput() ?>

            <?= $form->field($model, 'image')->textarea(['rows' => 6]) ?>

            <?= $form->field($model, 'status')->textInput() ?>

            <?= $form->field($model, 'created_at')->textInput() ?>

            <?= $form->field($model, 'updated_at')->textInput() ?>

            <?= $form->field($model, 'diplom')->textInput(['maxlength' => true]) ?>

            <?= $form->field($model, 'transkriptlar')->textInput(['maxlength' => true]) ?>

            <?= $form->field($model, 'year_of_graduation')->textInput() ?>

            <?= $form->field($model, 'sertifikat')->textInput(['maxlength' => true]) ?>

            <?= $form->field($model, 'pass_seria')->textInput(['maxlength' => true]) ?>

            <?= $form->field($model, 'pass_num')->textInput(['maxlength' => true]) ?>

            <?= $form->field($model, 'pass_file')->textInput(['maxlength' => true]) ?>

            <div class="form-group">
                <?= Html::submitButton('Save', ['class' => 'btn btn-success']) ?>
            </div>

            <?php ActiveForm::end(); ?>

        </div>
    </div>
</div>
