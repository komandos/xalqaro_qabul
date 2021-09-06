<?php

use yii\helpers\ArrayHelper;
use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model common\models\Departments */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="departments-form">

    <?php $form = ActiveForm::begin(); ?>

    <?= $form->field($model, 'code')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'name')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'structure_type')->dropDownList([
        1 => 'Rahbariyat',
        2 => 'Fakultet',
        3 => 'Kafedra',
        4 => 'Markaz',
        5 => 'Bo`lim',

    ]) ?>

    <?= $form->field($model, 'parent')->dropDownList(
        ArrayHelper::map(\common\models\Departments::find()->all(), 'id', 'name'),
        [
            'prompt' => 'Shu bo\'limga tegishli'
        ]
    ) ?>


    <div class="form-group">
        <?= Html::submitButton(Yii::t('app', 'Save'), ['class' => 'btn btn-success']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
