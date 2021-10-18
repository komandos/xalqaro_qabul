<?php


namespace console\controllers;

use backend\models\MStudent;
use backend\models\MStudentMeta;
use common\models\AbiturentBall;
use common\models\Admin;
use common\models\Application1;
use common\models\Departments;
use common\models\Gender;
use common\models\hemis\EStudent;
use common\models\hemis\EStudentMeta;
use common\models\Profile;
use common\models\Province;
use common\models\Regions;
use common\models\Section;
use common\models\State;
use common\models\Status;
use Yii;
use yii\console\Controller;
use yii\console\ExitCode;
use yii\db\Connection;
use yii\db\Exception;
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

//    public function actionImport()
//    {
//        echo date("Y-m-d H:i:s", time()) . PHP_EOL;
//        $file = Yii::getAlias('@backend/runtime/') . '1-kurs.csv';
//        $pnfl = [];
//        $ball = [];
//        $Aid = [];
//        if (($handle = fopen($file, "r")) !== FALSE) {
//            while (($data = fgetcsv($handle, 1000, ";")) !== FALSE) {
//                if (count($data) === 3) {
//                    $pnfl[] = $data[2];
//                    $ball[$data[2]] = $data[1];
//                    $Aid[$data[2]] = $data[0];
//                }
//            }
//            fclose($handle);
//        }
//        $model = EStudent::find()->where(['year_of_enter' => 2021, 'passport_pin' => $pnfl])->all();
//        $values = [];
//        $t = 0;
//        foreach ($model as $item) {
//            $values[] = [$item->id, $Aid[$item->passport_pin], $ball[$item->passport_pin]];
//            $t++;
//        }
//        echo $t . PHP_EOL;
//        try {
//            $db = Yii::$app->db;
//            $fields = ['student_id', 'abiturent_id', 'ball'];
//            $sql = $db->queryBuilder->batchInsert('abiturent_ball', $fields, $values);
//            $count = $db->createCommand($sql . ' ON DUPLICATE KEY UPDATE ' .
//                implode(', ',
//                    array_map(function ($field) {
//                        return $field . ' = VALUES(' . $field . ')';
//                    }, $fields)
//                )
//            )->execute();
//        } catch (Exception $ex) {
//            print_r($ex->getMessage());
//        } catch (Throwable $exc) {
//            print_r($exc->getMessage());
//        }
//
//        echo date("Y-m-d H:i:s", time()) . PHP_EOL;
//        return ExitCode::OK;
//    }

    public function actionRestore()
    {
        echo date("Y-m-d H:i:s", time()) . PHP_EOL;

//        $fields = ['code', 'name' , 'structure_type', 'parent','position','status','created_at','updated_at','created_by','updated_by'];
//        $this->dbRestore($fields, Departments::class);
//        $fields = ['username', 'auth_key', 'password_hash', 'password_reset_token', 'verification_token', 'email', 'role', 'status', 'created_at', 'updated_at'];
//        $this->dbRestore($fields, Admin::class);
//        $fields = ['first_name', 'last_name', 'patronymic', 'state_id', 'province_id', 'region_id', 'address', 'phone_1', 'phone_2',
//            'date_birth', 'email', 'gender_id', 'created_at', 'updated_at', 'image', 'status','diplom','transkriptlar','year_of_graduation','sertifikat',
//            'pass_seria','pass_num','pass_file','section_id'];
//        $this->dbRestore($fields, Profile::class);
//        $fields = ['name', 'status', 'created_at','updated_at'];
//        $this->dbRestore($fields, Gender::class);
//        $fields = ['name', 'status','state_id', 'created_at','updated_at'];
//        $this->dbRestore($fields, Province::class);
//        $fields = ['name', 'status','province_id', 'created_at','updated_at'];
//        $this->dbRestore($fields, Regions::class);
//        $fields = ['name', 'status', 'created_at','updated_at'];
//        $this->dbRestore($fields, State::class);
        $fields = ['code', 'direction', 'university','quota','form_education','edu_lang','duration','type','created_at','updated_at'];
        $this->dbRestore($fields, Section::class);


        echo date("Y-m-d H:i:s", time()) . PHP_EOL;
        return ExitCode::OK;
    }

    private function dbRestore(array $fields, $class)
    {
        /**
         * @var Connection $db1
         */
        $db1 = Yii::$app->get('xalqaro');
        $model1 = $class::find()->all();
        $values = [];
        foreach ($model1 as $item) {
            $f = [];
            foreach ($fields as $field) {
                $f[] = $item->$field;
            }
            $values[] = $f;
        }
        try {
            $db1->createCommand()->batchInsert('public.' . $class::tableName(), $fields, $values)->execute();
        } catch (Exception $ex) {
            print_r($ex->getMessage());
        }
    }


    public function actionIjtimoiy()
    {
        echo date("Y-m-d H:i:s", time()) . PHP_EOL;
        $this->dbRestore1(EStudent::class, MStudent::class, 1);
        $this->dbRestore1(EStudentMeta::class, MStudentMeta::class, 2);
        echo date("Y-m-d H:i:s", time()) . PHP_EOL;
        return ExitCode::OK;
    }

    private function dbRestore1($class1, $class2, int $type = 1)
    {
        /**
         * @var Connection $db1
         */
        $db1 = Yii::$app->get('ijtimoiy');
        if ($type == 1)
            $model1 = $class1::find()->where(['id' => Application1::find()->select(['student_id'])->column()])->all();
        else
            $model1 = $class1::find()->where(['id' => Application1::find()->select(['meta_id'])->column()])->all();

        $values = [];
        echo count($model1).PHP_EOL;
        $model = new $class2();
        foreach ($model1 as $item) {
            $f = [];
            foreach ($model->attributes as $key => $field) {
                $f[] = $item->$key;
            }
            $values[] = $f;
        }
        try {
            $db1->createCommand()->batchInsert($class2::tableName(), array_keys($model->attributes), $values)->execute();
        } catch (Exception $ex) {
            print_r($ex->getMessage());
        }
    }
}