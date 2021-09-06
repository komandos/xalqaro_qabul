<?php

namespace common\models;

use Yii;
use yii\behaviors\BlameableBehavior;
use yii\behaviors\TimestampBehavior;

/**
 * This is the model class for table "departments".
 *
 * @property int $id
 * @property string|null $code
 * @property string|null $name
 * @property int|null $structure_type
 * @property int|null $parent
 * @property int|null $position
 * @property int|null $status
 * @property int|null $created_at
 * @property int|null $updated_at
 * @property int|null $created_by
 * @property int|null $updated_by
 *
 * @property Admin $createdBy
 * @property Departments[] $departments
 * @property Departments $parent0
 * @property Admin $updatedBy
 * @property Vakancy[] $vakancies
 * @property Vakancy[] $vakancies0
 */
class Departments extends \yii\db\ActiveRecord
{
    public function behaviors()
    {
        return [
            TimestampBehavior::class,
            BlameableBehavior::class,

        ];
    }

    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'departments';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['structure_type', 'parent', 'position', 'status', 'created_at', 'updated_at', 'created_by', 'updated_by'], 'integer'],
            [['code'], 'string', 'max' => 64],
            ['status', 'default', 'value' => 1],
            [['code', 'name'], 'filter', 'filter' => 'trim', 'skipOnArray' => true],
            [['name'], 'string', 'max' => 256],
            [['parent'], 'exist', 'skipOnError' => true, 'targetClass' => Departments::class, 'targetAttribute' => ['parent' => 'id']],
            [['created_by'], 'exist', 'skipOnError' => true, 'targetClass' => Admin::class, 'targetAttribute' => ['created_by' => 'id']],
            [['updated_by'], 'exist', 'skipOnError' => true, 'targetClass' => Admin::class, 'targetAttribute' => ['updated_by' => 'id']],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'id' => Yii::t('app', 'ID'),
            'code' => Yii::t('app', 'Code'),
            'name' => Yii::t('app', 'Name'),
            'structure_type' => Yii::t('app', 'Structure Type'),
            'parent' => Yii::t('app', 'Parent'),
            'position' => Yii::t('app', 'Position'),
            'status' => Yii::t('app', 'Status'),
            'created_at' => Yii::t('app', 'Created At'),
            'updated_at' => Yii::t('app', 'Updated At'),
            'created_by' => Yii::t('app', 'Created By'),
            'updated_by' => Yii::t('app', 'Updated By'),
        ];
    }

    /**
     * Gets query for [[CreatedBy]].
     *
     * @return \yii\db\ActiveQuery|\common\models\query\AdminQuery
     */
    public function getCreatedBy()
    {
        return $this->hasOne(Admin::className(), ['id' => 'created_by']);
    }

    /**
     * Gets query for [[Departments]].
     *
     * @return \yii\db\ActiveQuery|\common\models\query\DepartmentsQuery
     */
    public function getDepartments()
    {
        return $this->hasMany(Departments::className(), ['parent' => 'id']);
    }

    /**
     * Gets query for [[Parent0]].
     *
     * @return \yii\db\ActiveQuery|\common\models\query\DepartmentsQuery
     */
    public function getParent0()
    {
        return $this->hasOne(Departments::className(), ['id' => 'parent']);
    }

    /**
     * Gets query for [[UpdatedBy]].
     *
     * @return \yii\db\ActiveQuery|\common\models\query\AdminQuery
     */
    public function getUpdatedBy()
    {
        return $this->hasOne(Admin::className(), ['id' => 'updated_by']);
    }

    /**
     * Gets query for [[Vakancies]].
     *
     * @return \yii\db\ActiveQuery|\common\models\query\VakancyQuery
     */
    public function getVakancies()
    {
        return $this->hasMany(Vakancy::className(), ['faculty' => 'id']);
    }

    /**
     * Gets query for [[Vakancies0]].
     *
     * @return \yii\db\ActiveQuery|\common\models\query\VakancyQuery
     */
    public function getVakancies0()
    {
        return $this->hasMany(Vakancy::className(), ['department' => 'id']);
    }

    /**
     * {@inheritdoc}
     * @return \common\models\query\DepartmentsQuery the active query used by this AR class.
     */
    public static function find()
    {
        return new \common\models\query\DepartmentsQuery(get_called_class());
    }
}
