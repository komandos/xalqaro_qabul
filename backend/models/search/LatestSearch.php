<?php

namespace backend\models\search;

use PhpOffice\PhpSpreadsheet\Cell\DataType;
use PhpOffice\PhpSpreadsheet\Spreadsheet;
use PhpOffice\PhpSpreadsheet\Writer\Xlsx;
use Yii;
use yii\base\Model;
use yii\data\ActiveDataProvider;
use common\models\Profile;
use yii\db\QueryInterface;
use yii\helpers\FileHelper;
use yii\helpers\VarDumper;

/**
 * ProfileSearch represents the model behind the search form of `common\models\Profile`.
 */
class LatestSearch extends Profile
{
    public $status;
    public $university;
    public $direction;

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['id', 'state_id', 'province_id', 'region_id', 'gender_id', 'status', 'year_of_graduation'], 'integer'],
            [['university', 'direction', 'first_name', 'last_name', 'patronymic', 'address', 'phone_1', 'phone_2', 'date_birth', 'email', 'image', 'diplom', 'transkriptlar', 'sertifikat', 'pass_seria', 'pass_num', 'pass_file'], 'safe'],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function scenarios()
    {
        // bypass scenarios() implementation in the parent class
        return Model::scenarios();
    }

    /**
     * Creates data provider instance with search query applied
     *
     * @param array $params
     *
     * @return ActiveDataProvider
     */
    public function search($params)
    {

        $query = Profile::find()->where([]);
        // add conditions that should always apply here

        $dataProvider = new ActiveDataProvider([
            'query' => $query,
        ]);

        $this->load($params);

//        if (!$this->validate()) {
//            // uncomment the following line if you do not want to return any records when validation fails
//            // $query->where('0=1');
//            return $dataProvider;
//        }
        $query->innerJoinWith([
            'section'
        ]);
        $dataProvider->sort->attributes['first_name'] = [
            'asc' => [
                'last_name' => SORT_ASC,
                'first_name' => SORT_ASC,
                'patronymic' => SORT_ASC
            ],

            'desc' => [
                'last_name' => SORT_DESC,
                'first_name' => SORT_DESC,
                'patronymic' => SORT_DESC

            ],

        ];
        $dataProvider->sort->attributes['direction'] = [
            'asc' => [
                'section.direction' => SORT_ASC,
            ],
            'desc' => [
                'section.direction' => SORT_DESC,
            ]
        ];
        $dataProvider->sort->attributes['university'] = [
            'asc' => [
                'section.university' => SORT_ASC,
            ],
            'desc' => [
                'section.university' => SORT_DESC,
            ]
        ];
        $dataProvider->sort->attributes['pass_num'] = [
            'asc' => [
                'pass_num' => SORT_ASC,
                'pass_seria' => SORT_ASC,
            ],

            'desc' => [
                'pass_num' => SORT_DESC,
                'pass_seria' => SORT_DESC,
            ],
        ];

        // grid filtering conditions
        $query->andFilterWhere([
            'id' => $this->id,
            'state_id' => $this->state_id,
            'province_id' => $this->province_id,
            'region_id' => $this->region_id,
            'date_birth' => $this->date_birth,
            'gender_id' => $this->gender_id,
            'status' => $this->status,
//            'created_at' => $this->created_at,
//            'updated_at' => $this->updated_at,
            'year_of_graduation' => $this->year_of_graduation,
        ]);

        $query->andFilterWhere(['like', 'address', $this->address])
            ->andFilterWhere(['like', 'phone_1', $this->phone_1])
            ->andFilterWhere(['like', 'phone_2', $this->phone_2])
            ->andFilterWhere(['like', 'email', $this->email])
            ->andFilterWhere(['like', 'image', $this->image])
            ->andFilterWhere(['like', 'diplom', $this->diplom])
            ->andFilterWhere(['like', 'transkriptlar', $this->transkriptlar])
            ->andFilterWhere(['like', 'sertifikat', $this->sertifikat])
            ->andFilterWhere(['like', 'pass_file', $this->pass_file])
            ->orFilterWhere(['like', 'first_name', $this->first_name])
            ->orFilterWhere(['like', 'last_name', $this->first_name])
            ->orFilterWhere(['like', 'patronymic', $this->first_name])
            ->orFilterWhere(['like', 'pass_seria', $this->pass_num])
            ->orFilterWhere(['like', 'pass_num', $this->pass_num]);

        return $dataProvider;
    }
    public function exportToExcel(?QueryInterface $query)
    {
        $speadsheet = new Spreadsheet();
        $sheet = $speadsheet->getActiveSheet();
        $title = "Qo`shma dastur";
        $sheet->setTitle(substr($title, 0, 31));
        $row = 1;
        $col = 1;
        $sheet->setCellValueExplicitByColumnAndRow($col++, $row, "#", DataType::TYPE_STRING);
        $sheet->setCellValueExplicitByColumnAndRow($col++, $row, "Familiyasi", DataType::TYPE_STRING);
        $sheet->setCellValueExplicitByColumnAndRow($col++, $row, "Ismi", DataType::TYPE_STRING);
        $sheet->setCellValueExplicitByColumnAndRow($col++, $row, "Sharifi", DataType::TYPE_STRING);
        $sheet->setCellValueExplicitByColumnAndRow($col++, $row, "Pasport seria", DataType::TYPE_STRING);
        $sheet->setCellValueExplicitByColumnAndRow($col++, $row, "Pasport num", DataType::TYPE_STRING);
        $sheet->setCellValueExplicitByColumnAndRow($col++, $row, "Davlati", DataType::TYPE_STRING);
        $sheet->setCellValueExplicitByColumnAndRow($col++, $row, "Viloyat", DataType::TYPE_STRING);
        $sheet->setCellValueExplicitByColumnAndRow($col++, $row, "Tuman", DataType::TYPE_STRING);
        $sheet->setCellValueExplicitByColumnAndRow($col++, $row, "Manzil", DataType::TYPE_STRING);
        $sheet->setCellValueExplicitByColumnAndRow($col++, $row, "Phone1", DataType::TYPE_STRING);
        $sheet->setCellValueExplicitByColumnAndRow($col++, $row, "Phone2", DataType::TYPE_STRING);
        $sheet->setCellValueExplicitByColumnAndRow($col++, $row, "Date Birth", DataType::TYPE_STRING);
        $sheet->setCellValueExplicitByColumnAndRow($col++, $row, "Email", DataType::TYPE_STRING);
        $sheet->setCellValueExplicitByColumnAndRow($col++, $row, "Gender", DataType::TYPE_STRING);
        $sheet->setCellValueExplicitByColumnAndRow($col++, $row, "O`qishni yakunlagan yil", DataType::TYPE_STRING);
        $sheet->setCellValueExplicitByColumnAndRow($col++, $row, "Yo`nalishi", DataType::TYPE_STRING);
        $key = 0;
        $models = $query->all();
        foreach ($models as $item) {
            /**
             * @var Profile $item
             */
            $row++;
            $col = 1;
            $key++;
            $sheet->setCellValueExplicitByColumnAndRow($col++, $row, $key, DataType::TYPE_NUMERIC);
            $sheet->setCellValueExplicitByColumnAndRow($col++, $row, $item->last_name, DataType::TYPE_STRING);
            $sheet->setCellValueExplicitByColumnAndRow($col++, $row, $item->first_name, DataType::TYPE_STRING);
            $sheet->setCellValueExplicitByColumnAndRow($col++, $row, $item->patronymic, DataType::TYPE_STRING);
            $sheet->setCellValueExplicitByColumnAndRow($col++, $row, $item->pass_seria, DataType::TYPE_STRING);
            $sheet->setCellValueExplicitByColumnAndRow($col++, $row, $item->pass_num, DataType::TYPE_STRING);
            $sheet->setCellValueExplicitByColumnAndRow($col++, $row, $item->state->name, DataType::TYPE_STRING);
            $sheet->setCellValueExplicitByColumnAndRow($col++, $row, $item->province->name, DataType::TYPE_STRING);
            $sheet->setCellValueExplicitByColumnAndRow($col++, $row, $item->region->name, DataType::TYPE_STRING);
            $sheet->setCellValueExplicitByColumnAndRow($col++, $row, $item->address, DataType::TYPE_STRING);
            $sheet->setCellValueExplicitByColumnAndRow($col++, $row, $item->phone_1, DataType::TYPE_STRING);
            $sheet->setCellValueExplicitByColumnAndRow($col++, $row, $item->phone_2, DataType::TYPE_STRING);
            $sheet->setCellValueExplicitByColumnAndRow($col++, $row, $item->date_birth, DataType::TYPE_STRING);
            $sheet->setCellValueExplicitByColumnAndRow($col++, $row, $item->email, DataType::TYPE_STRING);
            $sheet->setCellValueExplicitByColumnAndRow($col++, $row, $item->gender->name, DataType::TYPE_STRING);
            $sheet->setCellValueExplicitByColumnAndRow($col++, $row, $item->year_of_graduation, DataType::TYPE_STRING);
            $sheet->setCellValueExplicitByColumnAndRow($col++, $row, $item->section->direction, DataType::TYPE_STRING);

        }
        $name = 'qtd-' . Yii::$app->formatter->asDatetime(time(), 'php:d_m_Y_h_i_s') . '.xlsx';
        $writer = new Xlsx($speadsheet);
        $dir = Yii::getAlias('@assets/excel_export');
        if (!is_dir($dir)) {
            FileHelper::createDirectory($dir, 0777);
        }

        $fileName = $dir . DIRECTORY_SEPARATOR . $name;
        $writer->save($fileName);
        return Yii::$app->response->sendFile($fileName);
    }

}
