<?php

namespace backend\models\search;

use yii\base\Model;
use yii\data\ActiveDataProvider;
use common\models\Profile;

/**
 * ProfileSearch represents the model behind the search form of `common\models\Profile`.
 */
class ProfileSearch extends Profile
{
    public $status;
    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['id', 'state_id', 'province_id', 'region_id', 'gender_id', 'status', 'year_of_graduation'], 'integer'],
            [['first_name', 'last_name', 'patronymic', 'address', 'phone_1', 'phone_2', 'date_birth', 'email', 'image', 'created_at', 'updated_at', 'diplom', 'transkriptlar', 'sertifikat', 'pass_seria', 'pass_num', 'pass_file'], 'safe'],
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
        $query = Profile::find();

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
            'created_at' => $this->created_at,
            'updated_at' => $this->updated_at,
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
}
