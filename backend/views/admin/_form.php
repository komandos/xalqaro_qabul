<?php

use common\models\Admin;
use yii\helpers\Html;
use yii\widgets\ActiveForm;
use yii\widgets\MaskedInput;

/* @var $this yii\web\View */
/* @var $model common\models\Admin */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="container-fluid">

    <div class="card">
        <div class="card-body">

            <?php $form = ActiveForm::begin(); ?>

            <?= $form->field($model, 'username')->textInput(['maxlength' => true]) ?>

            <?= $form->field($model, 'password_hash')->textInput(['maxlength' => true]) ?>

            <?= $form->field($model, 'email')->widget(MaskedInput::class, [
                'clientOptions' => [
                    'alias' => 'email'
                ],
            ]) ?>
            <?php if (Yii::$app->getUser()->getIdentity()->isAdmin()): ?>
                <?= $form->field($model, 'role')->dropDownList(
                    [
                        Admin::ROLE_XALQARO => 'Xalqaro bo`limi',
                        Admin::ROLE_USER => 'User',
                        Admin::ROLE_ADMIN => 'Administrator',
                    ],
                    [
                        'prompt' => "-- Rolini tanlang ---",

                    ]
                ) ?>
            <?php endif; ?>

            <div class="form-group">
                <?= Html::submitButton(Yii::t('app', 'Save'), ['class' => 'btn btn-success']) ?>
            </div>

            <?php ActiveForm::end(); ?>

        </div>
    </div>
</div>
