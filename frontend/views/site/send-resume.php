<?php


/* @var $this \yii\web\View */
/* @var $model \common\models\Vakancy */

/* @var $profile \common\models\Profile */

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
<?php $form = ActiveForm::begin(); ?>
<table id="PersonalDetails" class="table table-condensed table-bordered">
    <tbody>
    <tr>
        <td class="col-sm-2 text-right"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">To'liq
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
        <td class="col-sm-4 text-right"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">Grajdanstvo </font></font><span
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
            <?= $form->field($model, 'province_id')->widget(Select2Default::class, [
                'data' => ArrayHelper::map(Province::find()->all(), 'id', 'name'),
                'options' => ['placeholder' => 'Select a province ...', 'id' => 'cat-id'],
                'pluginOptions' => [
                    'allowClear' => true
                ],
            ])->label('Viloyat'); ?>
            <?= $form->field($model, 'region_id')->widget(DepDrop::class, [
//                    'data' => ArrayHelper::map(Regions::find()->all(),'id','name'),
                'options' => ['id' => 'subcat-id'],
                'pluginOptions' => [
                    'depends' => ['cat-id'],
                    'allowClear' => true,
                    'url' => Url::to(['/site/subcat'])
                ],
            ])->label('Tuman'); ?>
            <span class="field-validation-valid text-danger" data-valmsg-for="citizenship_id"
                  data-valmsg-replace="true"></span>
        </td>
    </tr>

    <tr>
        <td class="col-sm-4 text-right"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">Elektron
                    pochta manzili </font></font><span class="text-danger"><font style="vertical-align: inherit;"><font
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
        <td class="col-sm-4 text-right"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">Tug'ilgan
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
        <td class="col-sm-4 text-right"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">Tel. </font><font
                        style="vertical-align: inherit;">raqami </font></font><span class="text-danger"><font
                        style="vertical-align: inherit;"><font style="vertical-align: inherit;">*</font></font></span>
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
        <td class="col-sm-4 text-right"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">Sohalar
                    bo'yicha yo'nalishi</font></font></td>
        <td class="col-sm-8">
            <?= $form->field($model, 'soha_yunalish_id')->widget(Select2Default::class, [
                'data' => ArrayHelper::map(Fields::find()->all(), 'id', 'name'),
                'options' => ['placeholder' => 'Select a Sohalar ...'],
                'pluginOptions' => [
                    'allowClear' => true
                ],
            ])->label('Soha Yo`nalishlar'); ?>

        </td>
    </tr>
    <tr>
        <td class="col-sm-4 text-right"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">Maqul
                    keladigan kasblar </font></font><span class="text-danger"><font
                        style="vertical-align: inherit;"><font style="vertical-align: inherit;"></font></font></span>
        </td>
        <td class="col-sm-8">
            <?= $form->field($model, 'maqul_keladigan_id')->widget(Select2Default::class, [
                'data' => ArrayHelper::map(Specializations::find()->all(), 'id', 'name'),
                'options' => ['placeholder' => 'Select a Maqul keladigan kasblar ...'],
                'pluginOptions' => [
                    'allowClear' => true
                ],
            ])->label('Maqul Keladigan Kasb'); ?>
            <span class="field-validation-valid text-danger" data-valmsg-for="Degrees"
                  data-valmsg-replace="true"></span>
        </td>
    </tr>
    <tr>
        <td class="col-sm-4 text-right"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">Unvoni</font></font><span class="text-danger"><font
                        style="vertical-align: inherit;"><font style="vertical-align: inherit;"></font></font></span>
        </td>
        <td class="col-sm-8">
            <?= $form->field($model, 'rank_id')->dropDownList(ArrayHelper::map(Rank::find()->all(), 'id', 'name'))->label(' ') ?>

            <span class="field-validation-valid text-danger" data-valmsg-for="Degrees"
                  data-valmsg-replace="true"></span>
        </td>
    </tr>
    <tr>
        <td class="col-sm-4 text-right"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">Xabardorligi </font></font><span class="text-danger"><font
                        style="vertical-align: inherit;"><font style="vertical-align: inherit;"></font></font></span>
        </td>
        <td class="col-sm-8">
            <?= $form->field($model, 'awareness')->dropDownList(ArrayHelper::map(\common\models\Awareness::find()->all(), 'id', 'name'))->label(' ') ?>
            <span class="field-validation-valid text-danger" data-valmsg-for="Degrees"
                  data-valmsg-replace="true"></span>
        </td>
    </tr>
    <tr>
        <td class="col-sm-4 text-right"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">Mutaxassisligi </font></font><span
                    class="text-danger"><font style="vertical-align: inherit;"><font
                            style="vertical-align: inherit;"></font></font></span>
        </td>
        <td class="col-sm-8">
            <?= $form->field($model, 'specialization')->textarea(['rows' => 6]) ?>
            <span class="field-validation-valid text-danger" data-valmsg-for="heardAboutVacancyFrom_id"
                  data-valmsg-replace="true"></span>
        </td>
    </tr>
    <tr>
        <td class="col-sm-4 text-right"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">Kampyuter
                    bilan ishlay olish darajasi haqida </font></font><span class="text-danger"><font
                        style="vertical-align: inherit;"><font style="vertical-align: inherit;"></font></font></span>
        </td>
        <td class="col-sm-8">
            <?= $form->field($model, 'computer_skills')->textarea(['rows' => 6]) ?>
            <span class="field-validation-valid text-danger" data-valmsg-for="heardAboutVacancyFrom_id"
                  data-valmsg-replace="true"></span>
        </td>
    </tr>

    <tr>
        <td><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">Millati </font></font><span class="text-danger"><font
                        style="vertical-align: inherit;"><font style="vertical-align: inherit;">*</font></font></span>
        </td>
        <td>
            <?= $form->field($model, 'nation_id')->radioList(ArrayHelper::map(Nations::find()->all(), 'id', 'name'))->label(' '); ?>
            <span class="field-validation-valid text-danger" data-valmsg-for="currentlyInUzbekistan"
                  data-valmsg-replace="true"></span>
        </td>
    </tr>
    <tr>
        <td><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">Jinsi </font></font><span class="text-danger"><font
                        style="vertical-align: inherit;"><font style="vertical-align: inherit;">*</font></font></span>
        </td>
        <td>
            <?= $form->field($model, 'gender_id')->radioList(ArrayHelper::map(Gender::find()->all(), 'id', 'name'))->label(' ') ?>
            <span class="field-validation-valid text-danger" data-valmsg-for="currentlyInUzbekistan"
                  data-valmsg-replace="true"></span>
        </td>
    </tr>
    <tr>
        <td><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">Oilaviy axvoli </font></font><span class="text-danger"><font
                        style="vertical-align: inherit;"><font style="vertical-align: inherit;">*</font></font></span>
        </td>
        <td>
            <?= $form->field($model, 'family_status_id')->radioList(ArrayHelper::map(Family::find()->all(), 'id', 'name'))->label(' ') ?>
            <span class="field-validation-valid text-danger" data-valmsg-for="currentlyInUzbekistan"
                  data-valmsg-replace="true"></span>
        </td>
    </tr>



    <tr>
        <td><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">Ayni damda siz
                    O'zbekistondamisiz? </font></font><span class="text-danger"><font
                        style="vertical-align: inherit;"><font style="vertical-align: inherit;">*</font></font></span>
        </td>
        <td>
            <?= $form->field($model, 'uzbekistondami')->radioList(['0' => 'Xa', '1' => 'Yo`q'])->label(' ') ?>

            <span class="field-validation-valid text-danger" data-valmsg-for="currentlyInUzbekistan"
                  data-valmsg-replace="true"></span>
        </td>
    </tr>

    <tr>
        <td><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">Siz ilgari URDUga biron bir
                    lavozimga hujjat topshirganmisiz? </font></font><span class="text-danger"><font
                        style="vertical-align: inherit;"><font style="vertical-align: inherit;">*</font></font></span>
        </td>
        <td>
            <?= $form->field($model, 'urduga_hujjet_topshirganmi')->radioList(['0' => 'Xa', '1' => 'Yo`q'])->label(' ') ?>
            <span class="field-validation-valid text-danger" data-valmsg-for="appliedBefore" data-valmsg-replace="true"></span>
        </td>
    </tr>
    <tr>
        <td><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">Siz hech qachon URDUda
                    ishlaganmisiz? </font></font><span class="text-danger"><font style="vertical-align: inherit;"><font
                            style="vertical-align: inherit;">*</font></font></span>
        </td>
        <td>
            <?= $form->field($model, 'urduda_ishlaganmi')->radioList(['0' => 'Xa', '1' => 'Yo`q'])->label(' ') ?>

            <span class="field-validation-valid text-danger" data-valmsg-for="workedBefore"
                  data-valmsg-replace="true"></span>


        </td>
    </tr>
    <tr>
        <td><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">Xozirgi kunda URDU da
                    ishlayotgan qarindoshingiz bormi? </font></font><span class="text-danger"><font
                        style="vertical-align: inherit;"><font style="vertical-align: inherit;">*</font></font></span>
        </td>
        <td>
            <?= $form->field($model, 'urduda_qarindosh_bormi')->radioList(['0' => 'Xa', '1' => 'Yo`q'])->label(' ') ?>
            <span class="field-validation-valid text-danger" data-valmsg-for="haveRelatives"
                  data-valmsg-replace="true"></span>
        </td>
    </tr>
    <tr>
        <td><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">Siz hech qachon jinoyat uchun
                    sudlanganmisiz? </font>
            </font>
            <span class="text-danger"><font style="vertical-align: inherit;"><font
                            style="vertical-align: inherit;">*</font></font>
            </span>
        </td>
        <td>
            <?= $form->field($model, 'sudlanganligi')->radioList(['0' => 'Xa', '1' => 'Yo`q'])->label(' ') ?>
            <span class="field-validation-valid text-danger" data-valmsg-for="haveConvicted"
                  data-valmsg-replace="true"></span>
        </td>
    </tr>
    <tr>
        <td><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">Passport Ma'lumotlari</font>
            </font>
            <span class="text-danger"><font style="vertical-align: inherit;"><font
                            style="vertical-align: inherit;">*</font></font>
            </span>
        </td>
        <td>
            <div class="row">
                <div class="col-md-8">
                   <div class="row">
                       <div class="col-md-4">
                           <?= $form->field($model, 'pass_seria')->widget(MaskedInput::className(),[
                                   'mask'=>'AA'
                           ])
                           ->label('Pasport Seriasi') ?>
                       </div>
                       <div class="col-md-8">
                           <?= $form->field($model, 'pass_num')->widget(MaskedInput::className(),[
                                   'mask'=> '9999999'
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

<div class="sectionHeader"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;font-size: 20px;">
            Fayllaringizni quyida yuklang:</font></font><br>
</div>
<table class="table">
    <tbody>
    <tr>
        <td><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">Passport elektronni shakli </font></font></td>
        <td>
            <?= $form->field($model, 'pass_file')->fileInput()->label(' ') ?>
            <span class="field-validation-valid text-danger" data-valmsg-for="coverLetterFiles"
                  data-valmsg-replace="true"></span>
        </td>
    </tr>
    <tr>
        <td><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">Biriktirilgan
                    xat </font></font></td>
        <td>
            <?= $form->field($model, 'biriktirilgan_xat')->fileInput()->label(' ') ?>
            <span class="field-validation-valid text-danger" data-valmsg-for="coverLetterFiles"
                  data-valmsg-replace="true"></span>
        </td>
    </tr>
    <tr>
        <td><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">Rezyume </font></font></td>
        <td>
            <?= $form->field($model, 'resume')->fileInput()->label(' ') ?>
            <span class="field-validation-valid text-danger" data-valmsg-for="cvFiles"
                  data-valmsg-replace="true"></span>
        </td>
    </tr>
    <tr>
        <td><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">Image </font></font></td>
        <td>
            <?= $form->field($model, 'image')->fileInput()->label(' ') ?>
            <span class="field-validation-valid text-danger" data-valmsg-for="cvFiles"
                  data-valmsg-replace="true"></span>
        </td>
    </tr>
    <tr>
        <td><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">Oldingi ish faoliyatini
                    baholash hisobotining skaner qilingan nusxasi </font></font></td>
        <td>
            <?= $form->field($model, 'oldingi_ish_scanneri')->fileInput()->label(' ') ?>
            <span class="field-validation-valid text-danger" data-valmsg-for="previousPerformanceEvaluationReportFiles"
                  data-valmsg-replace="true"></span>
        </td>
    </tr>

    <tr>
        <td>
            <font style="vertical-align: inherit;"><font style="vertical-align: inherit;">
                    O'qitish portfeli </font></font><br>
        </td>
        <td>
            <?= $form->field($model, 'tech_portfolio')->fileInput()->label(' ') ?>
        </td>
    </tr>
    <tr>
        <td><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">
                    Dissertatsiya yoki chop etilgan maqolaning nusxasi </font></font><br>
            <small class="text-success"><i><font style="vertical-align: inherit;"><font
                                style="vertical-align: inherit;">(Xulosa ilova qilinishi
                            mumkin)</font></font></i></small>
        </td>
        <td>
            <?= $form->field($model, 'maqola')->fileInput()->label(' ') ?>

        </td>
    </tr>
    <tr>
        <td><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">Diplomlar</font></font></td>
        <td>
            <?= $form->field($model, 'diplom')->fileInput()->label(' ') ?>
        </td>
    </tr>
    <tr>
        <td><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">Transkriptlar</font></font>
        </td>
        <td>
            <?= $form->field($model, 'transkriptlar')->fileInput()->label(' ') ?>
        </td>
    </tr>
    <tr>
        <td><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">Ingliz tili sertifikati</font></font>
        </td>
        <td>
            <?= $form->field($model, 'sertifikat')->fileInput()->label(' ') ?>
        </td>
    </tr>
    <tr>
        <td><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">
                    Ma'lumotlar ro'yxati </font></font><br>
            <small class="text-success"><i><font style="vertical-align: inherit;"><font
                                style="vertical-align: inherit;">(kamida 2)</font></font></i></small>
        </td>
        <td>
            <?= $form->field($model, 'malumotlar_ruyxati')->fileInput()->label(' ') ?>
        </td>
    </tr>
    </tbody>
</table>
<div class="row">
    <div class="col-sm-12">
        <input type="checkbox" id="agree">
        <label for="agree">Ushbu anketada keltirilgan
            ma'lumotlar to'liq va aniq keltrilgan</label>
    </div>
</div>

<br>
<div class="form-group">
    <?= Html::submitButton(Yii::t('app', 'Save'), ['class' => 'btn btn-success']) ?>
</div>

<?php ActiveForm::end(); ?>

