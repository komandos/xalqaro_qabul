<?php

use yii\helpers\VarDumper;

Yii::setAlias('@common', dirname(__DIR__));
Yii::setAlias('@frontend', dirname(__DIR__, 2) . '/frontend');
Yii::setAlias('@backend', dirname(__DIR__, 2) . '/backend');
Yii::setAlias('@console', dirname(__DIR__, 2) . '/console');
Yii::setAlias('@uploads', dirname(__DIR__, 2) . '/asset/uploads/');
Yii::setAlias('@resumes', dirname(__DIR__, 2) . '/asset/resumes/');
Yii::setAlias('@yutuqlari', dirname(__DIR__, 2) . '/asset/yutuqlari/');
Yii::setAlias('@tech_portfolio', dirname(__DIR__, 2) . '/asset/tech_portfolio/');
Yii::setAlias('@biriktrilgan_xat', dirname(__DIR__, 2) . '/asset/biriktrilgan_xat/');
Yii::setAlias('@maqola', dirname(__DIR__, 2) . '/asset/maqola/');
Yii::setAlias('@diplom', dirname(__DIR__, 2) . '/asset/diplom/');
Yii::setAlias('@transript', dirname(__DIR__, 2) . '/asset/transript/');
Yii::setAlias('@sertifikat', dirname(__DIR__, 2) . '/asset/sertifikat/');
Yii::setAlias('@malumotlar', dirname(__DIR__, 2) . '/asset/malumotlar/');
Yii::setAlias('@questions', dirname(__DIR__, 2) . '/asset/questions/');
Yii::setAlias('@passport', dirname(__DIR__, 2) . '/asset/passport/');
Yii::setAlias('@assets', dirname(__DIR__, 2) . '/asset');


function dd(...$varibles)
{
    foreach ($varibles as $varible) {
        VarDumper::dump($varible, 10, true);
    }
    die();
}

function __(string $message, array $params = []): string
{
    return Yii::t('app', $message, $params);
}