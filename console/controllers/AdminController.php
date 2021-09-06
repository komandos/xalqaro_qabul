<?php


namespace console\controllers;

use common\models\Admin;
use Yii;
use yii\console\Controller;
use yii\helpers\Console;

class AdminController extends Controller
{
    public function actionCreate(){
        $model = new Admin();
        $model->username = 'Admin';
        $model->password_hash = Yii::$app->getSecurity()->generatePasswordHash('password');
        $model->email = 'admin@urdu.uz';
        $model->generateAuthKey();
        $model->generateEmailVerificationToken();
        $model->status = 10;
        $model->save();
    }
}