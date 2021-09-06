<?php

namespace common\models;

use Yii;

/**
 * This is the model class for table "state".
 *
 * @property int $id
 * @property string|null $name
 * @property int|null $status
 * @property string|null $created_at
 * @property string|null $updated_at
 *
 * @property Province[] $provinces
 * @property Students[] $students
 */
class State extends \yii\db\ActiveRecord
{

    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'state';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['status'], 'integer'],
            [['created_at', 'updated_at'], 'safe'],
            [['name'], 'string', 'max' => 100],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'id' => Yii::t('app', 'ID'),
            'name' => Yii::t('app', 'Name'),
            'status' => Yii::t('app', 'Status'),
            'created_at' => Yii::t('app', 'Created At'),
            'updated_at' => Yii::t('app', 'Updated At'),
        ];
    }

    /**
     * Gets query for [[Provinces]].
     *
     * @return \yii\db\ActiveQuery|\common\models\query\ProvinceQuery
     */
    public function getProvinces()
    {
        return $this->hasMany(Province::className(), ['state_id' => 'id']);
    }

    /**
     * Gets query for [[Students]].
     *
     * @return \yii\db\ActiveQuery|\common\models\query\StudentsQuery
     */
    public function getStudents()
    {
        return $this->hasMany(Students::className(), ['state_id' => 'id']);
    }

    /**
     * {@inheritdoc}
     * @return \common\models\query\StateQuery the active query used by this AR class.
     */
    public static function find()
    {
        return new \common\models\query\StateQuery(get_called_class());
    }
    public function getProfiles()
    {
        return $this->hasMany(Profile::className(), ['state_id' => 'id']);
    }
}
