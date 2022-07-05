<?php

namespace common\models\query;

use yii\base\Model;
use yii\data\ActiveDataProvider;
use common\models\TurkmanProfile;

/**
 * TurkmanProfileSearch represents the model behind the search form of `common\models\TurkmanProfile`.
 */
class TurkmanProfileSearch extends TurkmanProfile
{
    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['id', 'state_id', 'gender_id', 'year_of_graduation', 'section_id'], 'integer'],
            [['first_name', 'last_name', 'patronymic', 'province_id', 'region_id', 'address', 'phone_1', 'phone_2', 'date_birth', 'email', 'image', 'created_at', 'updated_at', 'diplom', 'vaqtinchalik_pasport', 'medsertifikat', 'pass_seria', 'pass_num', 'pass_file', 'ariza'], 'safe'],
            [['status'], 'boolean'],
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
        $query = TurkmanProfile::find();

        // add conditions that should always apply here

        $dataProvider = new ActiveDataProvider([
            'query' => $query,
        ]);

        $this->load($params);

        if (!$this->validate()) {
            // uncomment the following line if you do not want to return any records when validation fails
            // $query->where('0=1');
            return $dataProvider;
        }

        // grid filtering conditions
        $query->andFilterWhere([
            'id' => $this->id,
            'state_id' => $this->state_id,
            'date_birth' => $this->date_birth,
            'gender_id' => $this->gender_id,
            'status' => $this->status,
            'created_at' => $this->created_at,
            'updated_at' => $this->updated_at,
            'year_of_graduation' => $this->year_of_graduation,
            'section_id' => $this->section_id,
        ]);

        $query->andFilterWhere(['ilike', 'first_name', $this->first_name])
            ->andFilterWhere(['ilike', 'last_name', $this->last_name])
            ->andFilterWhere(['ilike', 'patronymic', $this->patronymic])
            ->andFilterWhere(['ilike', 'province_id', $this->province_id])
            ->andFilterWhere(['ilike', 'region_id', $this->region_id])
            ->andFilterWhere(['ilike', 'address', $this->address])
            ->andFilterWhere(['ilike', 'phone_1', $this->phone_1])
            ->andFilterWhere(['ilike', 'phone_2', $this->phone_2])
            ->andFilterWhere(['ilike', 'email', $this->email])
            ->andFilterWhere(['ilike', 'image', $this->image])
            ->andFilterWhere(['ilike', 'diplom', $this->diplom])
            ->andFilterWhere(['ilike', 'vaqtinchalik_pasport', $this->vaqtinchalik_pasport])
            ->andFilterWhere(['ilike', 'medsertifikat', $this->medsertifikat])
            ->andFilterWhere(['ilike', 'pass_seria', $this->pass_seria])
            ->andFilterWhere(['ilike', 'pass_num', $this->pass_num])
            ->andFilterWhere(['ilike', 'pass_file', $this->pass_file])
            ->andFilterWhere(['ilike', 'ariza', $this->ariza]);

        return $dataProvider;
    }
}
