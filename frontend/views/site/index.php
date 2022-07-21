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
    <h4 style="margin-top: 3rem;" class="text-center">
        <?= Yii::t('app', "Urganch davlat universitetining 
2022-2023-o'quv yili uchun xorijiy fuqarolar qabuli
") ?> </h4>
    <p style="margin-top: 2rem;"><span style="text-align: right;font-family:times new roman,times,serif"><strong><span style="font-size:16px">1 . Pasport va xalqaro&nbsp;pasport;<br />
2. Oʼzbekistonda yashash guvohnomasi nusxasi (vid na jitelstvo) - agar mavjud boʼlsa;<br />
3. Xorijiy fuqaroning oʼrta yoki oʼrta maxsus, kasb-hunar maʼlumotini tasdiqlovchi shahodatnoma/diplom/ sertifikatning oʼzbek yoki rus tiliga tarjima qilingan va notarius tomonidan tasdiqlangan hujjat;<br />
4. Tibbiy  maʼlumotnoma (086 shakli) <br />
5. Fotosurat (3,5-4,5); (alohida elektron shakli)<br />
Talab etiladigan hujjatlarning elektoron shakli(PDF shaklida, koʼrsatilgan hujjatlar tartibi raqami saqlangan 1 fayl boʼlgan holda) quyidagi Ariza tugmasi orqali Ariza qoldirishingiz mumkin</span></strong></span></p>


    <div class="text-center">
    <a href="<?= Url::to(['site/resume-send'])?>" class = "btn btn-info">Ariza</a>
    </div>
</div>

