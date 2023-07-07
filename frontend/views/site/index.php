<?php

/* @var $this yii\web\View */
/* @var $model Section */

/* @var $dataProvider \yii\data\ActiveDataProvider */

use backend\widgets\Select2Default;
use common\models\Gender;
use common\models\Province;
use common\models\Section;
use kartik\depdrop\DepDrop;
use yii\bootstrap4\ActiveForm;
use yii\grid\GridView;
use yii\grid\SerialColumn;
use yii\helpers\ArrayHelper;
use yii\helpers\Html;
use yii\helpers\Url;
use yii\widgets\MaskedInput;

$this->title = Yii::t('app', 'UrSU Xalqaro qabul');
?>
    <div class="site-index">
        <div class="text-center">
            <a href="<?= Url::to('https://urdu.uz/uz/site/active?id=244')?>" class = "btn btn-info">Ta'lim yo'nalishi va mutaxasisliklar</a>
        </div>
        <h4 style="margin-top: 3rem;" class="text-center">

            <?= Yii::t('app', "Urganch davlat universitetining 
2023-2024-o'quv yili uchun xorijiy fuqarolar qabuli") ?> </h4>
        <p style="margin-top: 2rem;"><span style="text-align: right;font-family:times new roman,times,serif"><strong><span style="font-size:16px">
                    1 . Pasport va xalqaro&nbsp;pasport;<br />
                    2. Oʼzbekistonda yashash guvohnomasi nusxasi (vid na jitelstvo) - agar mavjud boʼlsa;<br />
                    3. Xorijiy fuqaroning oʼrta yoki oʼrta maxsus, kasb-hunar maʼlumotini tasdiqlovchi shahodatnoma/diplom/ sertifikatning oʼzbek yoki rus tiliga tarjima qilingan va notarius tomonidan tasdiqlangan hujjat;<br />
                    4. Tibbiy  maʼlumotnoma (086 shakli) <br />
                    5. Fotosurat (3,5-4,5); (alohida elektron shakli)<br />
                    Talab etiladigan hujjatlarning elektoron shakli(PDF shaklida, koʼrsatilgan hujjatlar tartibi raqami saqlangan 1 fayl boʼlgan holda) quyidagi Ariza tugmasi orqali Ariza qoldirishingiz mumkin</span></strong></span>
        </p>
        <hr>
        <div class="text-center">
            <a href="<?= Url::to(['site/resume-send'])?>" class = "btn btn-info">Ariza</a>
        </div>




        <h4 style="margin-top: 3rem;" class="text-center">
            <?= Yii::t('app', "Прием иностранных граждан в Ургенчский государственный университет на 2023-2024 учебный год") ?> </h4>
        <p style="margin-top: 2rem;"><span style="text-align: right;font-family:times new roman,times,serif"><strong><span style="font-size:16px">
                    1.	Паспорт и загранпаспорт;<br>
                    2.	Копия справки проживании в Узбекистане (вид на жительство) - при наличии;<br>
                    3.	Аттестат/диплом/сертификат, подтверждающий среднее или среднее специальное образование иностранного гражданина, переведенный на узбекский или русский язык и нотариально заверенный;<br>
                    4.	Медицинская справка (форма 086);<br>
                    5.	Фото (3,5-4,5); (отдельная электронная форма)<br>
                    Электронную форму необходимых документов (в формате PDF, с 1 файлом с порядковым номером указанных документов) можно подать, нажав кнопку Заявка ниже.<br>
        </p>
        <hr>
        <div class="text-center">
            <a href="<?= Url::to(['site/resume-send'])?>" class = "btn btn-info">Заявление</a>
        </div>




        <h4 style="margin-top: 3rem;" class="text-center">
            <?= Yii::t('app', "Admission of international students of Urganch State University for the academic year 2023-2024") ?> </h4>
        <p style="margin-top: 2rem;"><span style="text-align: right;font-family:times new roman,times,serif"><strong><span style="font-size:16px">.
                    1. Passport and international passport;<br>
                    2. Copy of the certificate of residence in Uzbekistan (vid na zhitelstvo) - if available;<br>
                    3. Certificate/diploma of secondary special education or Higher education translated into Uzbek, English or Russian  certified by a notary;<br>
                    4. Medical certificate (form 086)<br>
                    5. Photo (3.5-4.5)<br>
        </p>
        <hr>
        <div class="text-center">
            <a href="<?= Url::to(['site/resume-send'])?>" class = "btn btn-info">Application</a>
        </div>
    </div>

<?php
