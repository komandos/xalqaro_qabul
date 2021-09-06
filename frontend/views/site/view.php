<?php


/* @var $this \yii\web\View */

/* @var $model \common\models\Vakancy */

use backend\widgets\Select2Default;
use common\models\DrivingLicense;
use common\models\Family;
use common\models\Fields;
use common\models\Gender;
use common\models\MilitaryRank;
use common\models\Nations;
use common\models\Partys;
use common\models\Province;
use common\models\Specializations;
use kartik\depdrop\DepDrop;
use yii\bootstrap4\ActiveForm;
use yii\helpers\ArrayHelper;
use yii\helpers\Html;
use yii\helpers\Url;
use yii\widgets\DetailView;
use yii\widgets\MaskedInput;

?>
<!--<div class="site-view">-->
<!--    <a href="--><?//= Url::to(['site/send-resume', 'id' => $model->id]) ?><!--" class="btn btn-info" target="_blank">Send</a>-->
<!--    --><?//= DetailView::widget([
//        'model' => $model,
//    ]) ?>
<!--</div>-->
<div class="panel" style="border: 0.2px solid rgba(0,0,0,0.32);padding: 6%">
    <div class="row">
        <div class="col-md-9">
            <h3 class="heading-diag color-default no-margin"><span style="font-size: 24px">Ish</span></h3>
            <p><?= $model->name_uz ?></p>
            <div class="panel">
                <div class="panel-heading">
                    <table style="width:100%">
                        <tbody>
                        <tr>
                            <td><span style="font-weight: 600">Fakultet</span></td>
                            <td><span style="font-weight: 600">Kafedra</span></td>
                        </tr>
                        <tr>
                            <td><span style="font-weight: 400">
                        <p style="text-transform: uppercase;"><?=$model->department0->name?></p>
                        </span>
                            </td>
                            <td><span style="font-weight: 400"><?=$model->faculty0->name?></span>
                            </td>
                        </tr>
                        </tbody>
                    </table>
                </div>
                <div class="panel-footer">
                    <span><b>Malumot:</b></span>
                    <p> <?=$model->desc_uz?></p>
                </div>
                <div class="panel-body">
                    <h6><b>Маош</b></h6>
                    <p><?=$model->price?> сўм</p>
                    <h6><b>Ставка</b></h6>
                    <p><?=$model->stavka?></p>
                    <h6><b>Иш малакаси</b></h6>
                    <p>1 - 3 йил</p>
                    <h6><b>Иш ўринлари сони:</b></h6>
                    <p><?=$model->staff_count?> та</p>

                    <h6><b>Elon qilingan vaxt</b></h6>
                    <p><?=date('Y-m-d',$model->created_at)?></p>
                </div>

            </div>
        </div>
        <div class="col-md-3">
            <div style="margin-top: 95px/*118px*/">

                <!-- <p>
      <a href="/site/login" class="btn btn-info" style="padding: 15px 70px"  alt="Шахсий маълумотларни ўзгартириш">
        Йулланма олиш                </a>
    </p>
    <hr> -->
                <p>
                    <a href="<?= Url::to(['site/send-resume', 'id' => $model->id]) ?>" class="btn btn-info" style="padding: 15px 55px"><i class="fa fa-paper-plane-o" aria-hidden="true"></i>&nbsp;&nbsp;&nbsp;<span>Резюме юбориш</span></a>
                </p>
                <hr>
            </div>
        </div>
    </div>
</div>
