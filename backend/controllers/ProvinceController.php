<?php

namespace backend\controllers;

use common\models\Province;
use backend\models\search\ProvinceSearch;
use common\models\Regions;
use PDO;
use PDOException;
use yii\web\Controller;
use yii\web\NotFoundHttpException;
use yii\filters\VerbFilter;

/**
 * ProvinceController implements the CRUD actions for Province model.
 */
class ProvinceController extends Controller
{
    /**
     * @inheritDoc
     */
    public function behaviors()
    {
        return array_merge(
            parent::behaviors(),
            [
                'verbs' => [
                    'class' => VerbFilter::className(),
                    'actions' => [
                        'delete' => ['POST'],
                    ],
                ],
                'access' => [
                    'class' => \yii\filters\AccessControl::class,
                    'only' => ['create', 'update','index','view'],
                    'rules' => [
                        // deny all POST requests
//                        [
//                            'allow' => false,
//                            'verbs' => ['POST']
//                        ],
                        // allow authenticated users
                        [
                            'allow' => true,
                            'roles' => ['@'],
                        ],
                        // everything else is denied
                    ],
                ],
            ]
        );
    }

    /**
     * Lists all Province models.
     * @return mixed
     */
    public function actionIndex()
    {
        $searchModel = new ProvinceSearch();
        $dataProvider = $searchModel->search($this->request->queryParams);

        return $this->render('index', [
            'searchModel' => $searchModel,
            'dataProvider' => $dataProvider,
        ]);
    }

    /**
     * Displays a single Province model.
     * @param integer $id
     * @return mixed
     * @throws NotFoundHttpException if the model cannot be found
     */
    public function actionView($id)
    {
        return $this->render('view', [
            'model' => $this->findModel($id),
        ]);
    }

    /**
     * Creates a new Province model.
     * If creation is successful, the browser will be redirected to the 'view' page.
     * @return mixed
     */
    public function actionCreate()
    {
        $model = new Province();
        $model->status = 10;
        $model->created_at = date('Y-m-d H:i:s');
        $model->updated_at = date('Y-m-d H:i:s');
        if ($this->request->isPost) {
            if ($model->load($this->request->post()) && $model->save()) {
                return $this->redirect(['view', 'id' => $model->id]);
            }
        } else {
            $model->loadDefaultValues();
        }

        return $this->render('create', [
            'model' => $model,
        ]);
    }

    /**
     * Updates an existing Province model.
     * If update is successful, the browser will be redirected to the 'view' page.
     * @param integer $id
     * @return mixed
     * @throws NotFoundHttpException if the model cannot be found
     */
    public function actionUpdate($id)
    {
        $model = $this->findModel($id);
        $model->status = 10;
        $model->created_at = date('Y-m-d H:i:s');
        $model->updated_at = date('Y-m-d H:i:s');
        if ($this->request->isPost && $model->load($this->request->post()) && $model->save()) {
            return $this->redirect(['view', 'id' => $model->id]);
        }

        return $this->render('update', [
            'model' => $model,
        ]);
    }

    /**
     * Deletes an existing Province model.
     * If deletion is successful, the browser will be redirected to the 'index' page.
     * @param integer $id
     * @return mixed
     * @throws NotFoundHttpException if the model cannot be found
     */
    public function actionDelete($id)
    {
        $this->findModel($id)->delete();

        return $this->redirect(['index']);
    }

    /**
     * Finds the Province model based on its primary key value.
     * If the model is not found, a 404 HTTP exception will be thrown.
     * @param integer $id
     * @return Province the loaded model
     * @throws NotFoundHttpException if the model cannot be found
     */
    protected function findModel($id)
    {
        if (($model = Province::findOne($id)) !== null) {
            return $model;
        }

        throw new NotFoundHttpException(Yii::t('app', 'The requested page does not exist.'));
    }
//
//    public function actionProvinceImport()
//    {
//        define('DBHOST', 'localhost');
//        define('DBNAME', 'yii2advanced');
//        define('DBUSER', 'root');
//        define('DBPWD', '');
//        define('DBPREFIX', 'hw_');
//        define('DBCHARSET', 'utf8');
//        define('CONN', '');
//        define('TIMEZONE', 'Asia/Shanghai');
//
//        try {
//            $db = new PDO('mysql:host=' . DBHOST . ';dbname=' . DBNAME, DBUSER, DBPWD);
//            $db->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
//            $db->query('SET NAMES utf8;');
//        } catch (PDOException  $e) {
//            echo '{"result":"failed", "msg":"连接数据库失败！"}';
//            exit;
//        }
//        $reader = \PhpOffice\PhpSpreadsheet\IOFactory::createReader('Xlsx');
//        $reader->setReadDataOnly(TRUE);
//        $spreadsheet = $reader->load('viloyatlar.xlsx'); //Load the excel form
//
//        $worksheet = $spreadsheet->getActiveSheet();
//        $highestRow = $worksheet->getHighestRow(); // total number of rows
//        $highestColumn = $worksheet->getHighestColumn(); // total number of columns
//        $highestColumnIndex = \PhpOffice\PhpSpreadsheet\Cell\Coordinate::columnIndexFromString($highestColumn); // e.g. 5
//
//        $lines = $highestRow - 2;
//        if ($lines <= 0) {
//            exit ('There is no data in the Excel table');
//        }
//
//        $sql = "INSERT INTO `province` (`id`, `name`, `state_id`,`status`) VALUES ";
//
//        for ($row = 3; $row <= $highestRow; ++$row) {
//            $id = $worksheet->getCellByColumnAndRow(1, $row)->getValue(); //Name
//            $name = $worksheet->getCellByColumnAndRow(2, $row)->getValue(); //Language
//            $state_id = $worksheet->getCellByColumnAndRow(3, $row)->getValue(); //Mathematics
//            $status = $worksheet->getCellByColumnAndRow(4, $row)->getValue(); //Mathematics
//
//            $sql .= "('$id','$name','$state_id','$status'),";
//        }
//        $sql = rtrim($sql, ","); //Remove the last one,
//        try {
//            $db->query($sql);
//            echo 'OK';
//        } catch (Exception $e) {
//            echo $e->getMessage();
//
//        }
//    }

    public function actionProvinceImport2()
    {
        $file = fopen("data.csv", "r");

        $result = [];
        while (!feof($file)) {
            $result[] = fgetcsv($file, 0, ';');
        }
        $district = [];
        foreach ($result as $key => $item) {
            if ($key > 0) {
                if ($item[3] == $item[0]) {
                    $district[(int)$item[0]]['name'] = $item[1];
                    $district[(int)$item[0]]['tumanlar'] = [];
                } else {
                    $district[(int)$item[3]]['tumanlar'][] = $item[1];
                }
            }
        }
        foreach ($district as $key => $item) {
            if ($key > 0) {
                $model = new Province();
                $model->status = 1;
                $model->name = $item['name'];
                $model->state_id = 1;
//                dd(date('Y-m-d H:i:s'));
                $model->created_at = date('Y-m-d H:i:s');
                $model->updated_at = date('Y-m-d H:i:s');
                if ($model->save()) {
                    foreach ($item['tumanlar'] as $value) {
                        $modelTuman = new Regions();
                        $modelTuman->province_id = $model->id;
                        $modelTuman->status = 1;
                        $modelTuman->name = $value;
                        $modelTuman->created_at = date('Y-m-d H:i:s');
                        $modelTuman->updated_at = date('Y-m-d H:i:s');
                        $modelTuman->save();
                    }
                }
            }
        }
        fclose($file);

    }
}
