<?php

namespace common\models;

use Yii;

/**
 * This is the model class for table "section".
 *
 * @property int $id
 * @property string|null $code
 * @property string|null $direction
 * @property string|null $university
 * @property int|null $quota
 * @property string|null $form_education
 * @property string|null $edu_lang
 * @property string|null $duration
 * @property string|null $type
 * @property int|null $created_at
 * @property int|null $updated_at
 */
class Section extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'section';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['quota', 'created_at', 'updated_at'], 'integer'],
            [['type'], 'string'],
            [['code'], 'string', 'max' => 150],
            [['direction', 'university'], 'string', 'max' => 255],
            [['form_education', 'edu_lang', 'duration'], 'string', 'max' => 100],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'code' => 'Code',
            'direction' => 'Direction',
            'university' => 'University',
            'quota' => 'Quota',
            'form_education' => 'Form Education',
            'edu_lang' => 'Edu Lang',
            'duration' => 'Duration',
            'type' => 'Type',
            'created_at' => 'Created At',
            'updated_at' => 'Updated At',
        ];
    }

    /**
     * {@inheritdoc}
     * @return \common\models\query\SectionQuery the active query used by this AR class.
     */
    public static function find()
    {
        return new \common\models\query\SectionQuery(get_called_class());
    }
    public function getProfiles()
    {
        return $this->hasMany(Profile::className(), ['section_id' => 'id']);
    }
}
