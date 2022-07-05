<?php


/* @var $this \yii\web\View */
/* @var $model \common\models\TurkmanProfile */

/* @var $profile \common\models\TurkmanProfile */

use backend\widgets\Select2Default;
use common\models\Family;
use common\models\Fields;
use common\models\Gender;
use common\models\Nations;
use common\models\Partys;
use common\models\Province;
use common\models\Rank;
use common\models\Specializations;
use kartik\depdrop\DepDrop;
use yii\bootstrap4\ActiveForm;
use yii\helpers\ArrayHelper;
use yii\helpers\Html;
use yii\helpers\Url;
use yii\widgets\MaskedInput;

?>
<div class="site-index">
    <h1>
        <?= Yii::t('app', 'Form') ?>
    </h1>
    <?php $form = ActiveForm::begin(); ?>
    <table id="PersonalDetails" class="table table-condensed table-bordered">
        <tbody>
        <tr>
            <td class="col-sm-2 text-right"><font style="vertical-align: inherit;"><font
                            style="vertical-align: inherit;"> O'qishni yakunlagan sanasi</font></font><span class="text-danger"><font style="vertical-align: inherit;"><font
                                style="vertical-align: inherit;">*</font></font></span>
            </td>
            <td class="col-sm-4">
                <div class="row">
                    <div class="col-sm-8">
                        <?= $form->field($model, 'year_of_graduation')->textInput(['type' =>'date'])->label('Sana') ?>
                    </div>
                </div>
            </td>
        </tr>

        <tr>
            <td class="col-sm-2 text-right"><font style="vertical-align: inherit;"><font
                            style="vertical-align: inherit;">To'liq
                        ism-sharifi </font></font><span class="text-danger"><font style="vertical-align: inherit;"><font
                                style="vertical-align: inherit;">*</font></font></span>
            </td>
            <td class="col-sm-4">
                <div class="row">
                    <div class="col-sm-8">
                        <?= $form->field($model, 'first_name')->textInput(['maxlength' => true])->label('Ismi') ?>

                        <?= $form->field($model, 'last_name')->textInput(['maxlength' => true])->label('Familiyasi') ?>
                        <?= $form->field($model, 'patronymic')->textInput(['maxlength' => true])->label('Otasining Ismi') ?>

                        <span class="field-validation-valid text-danger" data-valmsg-for="PersonalDetails.Name"
                              data-valmsg-replace="true"></span>
                    </div>
                </div>
                <br>
            </td>
        </tr>
        <tr>
            <td class="col-sm-4 text-right"><font style="vertical-align: inherit;"><font
                            style="vertical-align: inherit;">Millati </font></font><span
                        class="text-danger"><font style="vertical-align: inherit;"><font
                                style="vertical-align: inherit;">*</font></font></span>
            </td>
            <td class="col-sm-8">
                <?= $form->field($model, 'state_id')->widget(Select2Default::class, [
                    'data' => ArrayHelper::map(\common\models\State::find()->all(), 'id', 'name'),
                    'options' => ['placeholder' => 'Select a state ...'],
                    'pluginOptions' => [
                        'allowClear' => true
                    ],
                ])->label('Davlat'); ?>
                <?= $form->field($model, 'province_id')->textInput()->label('Viloyat'); ?>
                <?= $form->field($model, 'region_id')->textInput()->label('Tuman'); ?>
                <?= $form->field($model,'address')->textInput()->label('Manzil')?>
                <span class="field-validation-valid text-danger" data-valmsg-for="citizenship_id"
                      data-valmsg-replace="true"></span>
            </td>
        </tr>

        <tr>
            <td class="col-sm-4 text-right">
                <font style="vertical-align: inherit;"><font
                            style="vertical-align: inherit;">Elektron
                        pochta manzili </font></font>
                <span class="text-danger"><font
                            style="vertical-align: inherit;"><font
                                style="vertical-align: inherit;">*</font></font></span>
            </td>
            <td class="col-sm-8">
                <?= $form->field($model, 'email')->widget(MaskedInput::class, [
                    'clientOptions' => [
                        'alias' => 'email'
                    ],
                ]) ?>
                <span class="field-validation-valid text-danger" data-valmsg-for="PersonalDetails.email"
                      data-valmsg-replace="true"></span>
            </td>
        </tr>
        <tr>
            <td class="col-sm-4 text-right"><font style="vertical-align: inherit;"><font
                            style="vertical-align: inherit;">Tug'ilgan
                        Sana </font></font><span class="text-danger"><font style="vertical-align: inherit;"><font
                                style="vertical-align: inherit;">*</font></font></span>
            </td>
            <td class="col-sm-8">
                <?= $form->field($model, 'date_birth')->textInput(['type' => 'date']) ?>
                <span class="field-validation-valid text-danger" data-valmsg-for="PersonalDetails.email"
                      data-valmsg-replace="true"></span>
            </td>
        </tr>

        <tr>
            <td class="col-sm-4 text-right"><font style="vertical-align: inherit;"><font
                            style="vertical-align: inherit;">Tel. </font><font
                            style="vertical-align: inherit;">raqami </font></font><span class="text-danger"><font
                            style="vertical-align: inherit;"><font
                                style="vertical-align: inherit;">*</font></font></span>
            </td>
            <td class="col-sm-8">
                <?= $form->field($model, 'phone_1')->widget(MaskedInput::class, [
                    'mask' => '+99999-999-99-99',
                ]) ?>

                <?= $form->field($model, 'phone_2')->widget(MaskedInput::class, [
                    'mask' => '+99999-999-99-99',
                ]) ?>
                <span class="field-validation-valid text-danger" data-valmsg-for="PersonalDetails.phone"
                      data-valmsg-replace="true"></span>
            </td>
        </tr>

        <tr>
            <td><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">Jinsi </font></font><span
                        class="text-danger"><font
                            style="vertical-align: inherit;"><font
                                style="vertical-align: inherit;">*</font></font></span>
            </td>
            <td>
                <?= $form->field($model, 'gender_id')->radioList(ArrayHelper::map(Gender::find()->all(), 'id', 'name'))->label(' ') ?>
                <span class="field-validation-valid text-danger" data-valmsg-for="currentlyInUzbekistan"
                      data-valmsg-replace="true"></span>
            </td>
        </tr>

        <tr>
            <td><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">Passport
                        Ma'lumotlari</font>
                </font>
                <span class="text-danger"><font style="vertical-align: inherit;"><font
                                style="vertical-align: inherit;">*</font></font>
            </span>
            </td>
            <td>
                <div class="row">
                    <div class="col-md-8">
                        <div class="row">
                            <div class="col-md-4 maxlength='2'">
                                <?= $form->field($model, 'pass_seria')->textInput(['min'=>0,'max' => 2])->label('Passport Seriasi') ?>
                            </div>
                            <div class="col-md-8">
                                <?= $form->field($model, 'pass_num')->widget(MaskedInput::className(), [
                                    'mask' => '9999999'
                                ])
                                    ->label('Passport Raqami') ?>
                            </div>
                        </div>
                    </div>
                </div>
                <span class="field-validation-valid text-danger" data-valmsg-for="haveConvicted"
                      data-valmsg-replace="true"></span>
            </td>
        </tr>
        </tbody>
    </table>

    <div class="sectionHeader"><font style="vertical-align: inherit;"><font
                    style="vertical-align: inherit;font-size: 20px;">
                Fayllaringizni quyida yuklang:</font></font>
    </div>
    <table class="table">
        <tbody>
        <tr>
            <td><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">Passport elektronni
                        shakli </font></font>
                <span class="text-danger"><font
                            style="vertical-align: inherit;"><font
                                style="vertical-align: inherit;">*</font></font></span>
            </td>
            <td>
                <?= $form->field($model, 'pass_file')->fileInput(['required'=>true])->label(' ') ?>
                <span class="field-validation-valid text-danger" data-valmsg-for="coverLetterFiles"
                      data-valmsg-replace="true"></span>
            </td>
        </tr>
        <tr>
            <td><font style="vertical-align: inherit;"><font
                            style="vertical-align: inherit;">Oʼzbekistonda yashash guvohnomasi nusxasi (vid na jitelstvo) - agar mavjud boʼlsa;</font></font>
                <span class="text-danger"><font
                            style="vertical-align: inherit;"><font
                                style="vertical-align: inherit;"></font></font></span>
            </td>
            <td>
                <?= $form->field($model, 'vaqtinchalik_pasport')->fileInput(['required'=>true])->label(' ') ?>
            </td>
        </tr>
        <tr>
            <td><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">Image </font></font>
                <span class="text-danger"><font
                            style="vertical-align: inherit;"><font
                                style="vertical-align: inherit;">*</font></font></span>
            </td>
            <td>
                <?= $form->field($model, 'image')->fileInput(['required'=>true])->label(' ') ?>
                <span class="field-validation-valid text-danger" data-valmsg-for="cvFiles"
                      data-valmsg-replace="true"></span>
            </td>
        </tr>

        <tr>
            <td><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">Diplom yoki shaxodatnoma</font></font>
                <span class="text-danger"><font
                            style="vertical-align: inherit;"><font
                                style="vertical-align: inherit;">*</font></font></span>
            </td>
            <td>
                <?= $form->field($model, 'diplom')->fileInput(['required'=>true])->label(' ') ?>
            </td>
        </tr>

        <tr>
            <td><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">Tibbiy maʼlumotnoma (086 shakli)</font></font>
            </td>
            <td>
                <?= $form->field($model, 'medsertifikat')->fileInput()->label(' ') ?>
            </td>
        </tr>
        <tr>
            <td>
                <font style="vertical-align: inherit">Ariza</font>
            </td>
            <td>
                <?= $form->field($model, 'ariza')->fileInput()->label('') ?>
            </td>
        </tr>>
        </tbody>
    </table>

    <br>
    <div class="form-group">
        <?= Html::submitButton(Yii::t('app', 'Save'), ['class' => 'btn btn-success']) ?>
    </div>

    <?php ActiveForm::end(); ?>
</div>

