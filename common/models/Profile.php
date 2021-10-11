<?php

namespace common\models;

use Yii;
use yii\helpers\FileHelper;
use yii\web\UploadedFile;

/**
 * This is the model class for table "profile".
 *
 * @property int $id
 * @property string|null $first_name
 * @property string|null $last_name
 * @property string|null $patronymic
 * @property int $state_id
 * @property int $province_id
 * @property int $region_id
 * @property string|null $address
 * @property string|null $phone_1
 * @property string|null $phone_2
 * @property string|null $date_birth
 * @property string|null $email
 * @property int $gender_id
 * @property string|null $image
 * @property int|null $status
 * @property string|null $created_at
 * @property string|null $updated_at
 * @property string|null $diplom
 * @property string|null $transkriptlar
 * @property int $year_of_graduation
 * @property string|null $sertifikat
 * @property string|null $pass_seria
 * @property string|null $pass_num
 * @property string|null $pass_file
 *
 * @property Gender $gender
 * @property Province $province
 * @property Regions $region
 */
class Profile extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'profile';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['year_of_graduation', 'state_id', 'province_id', 'region_id', 'gender_id', 'first_name', 'last_name', 'patronymic', 'date_birth', 'phone_1', 'pass_num', 'pass_seria'], 'required'],
            [['state_id', 'province_id', 'region_id', 'gender_id','section_id', 'status'], 'integer'],
            [['address', 'image'], 'string'],
            [['date_birth', 'created_at', 'updated_at'], 'safe'],
            [['first_name', 'last_name', 'patronymic', 'phone_1', 'phone_2', 'email', 'pass_num'], 'string', 'max' => 50],
            [['diplom', 'transkriptlar', 'sertifikat'], 'string', 'max' => 255],
            [['pass_seria'], 'string', 'max' => 10],
            [['pass_file'], 'string', 'max' => 200],
            [['province_id'], 'exist', 'skipOnError' => true, 'targetClass' => Province::className(), 'targetAttribute' => ['province_id' => 'id']],
            [['region_id'], 'exist', 'skipOnError' => true, 'targetClass' => Regions::className(), 'targetAttribute' => ['region_id' => 'id']],
            [['gender_id'], 'exist', 'skipOnError' => true, 'targetClass' => Gender::className(), 'targetAttribute' => ['gender_id' => 'id']],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'first_name' => 'First Name',
            'last_name' => 'Last Name',
            'patronymic' => 'Patronymic',
            'state_id' => 'State ID',
            'province_id' => 'Province ID',
            'region_id' => 'Region ID',
            'address' => 'Address',
            'phone_1' => 'Phone 1',
            'phone_2' => 'Phone 2',
            'date_birth' => 'Date Birth',
            'email' => 'Email',
            'gender_id' => 'Gender ID',
            'image' => 'Image',
            'status' => 'Status',
            'created_at' => 'Created At',
            'updated_at' => 'Updated At',
            'diplom' => 'Diplom',
            'transkriptlar' => 'Transkriptlar',
            'year_of_graduation' => 'Year Of Graduation',
            'sertifikat' => 'Sertifikat',
            'pass_seria' => 'Pass Seria',
            'pass_num' => 'Pass Num',
            'pass_file' => 'Pass File',
        ];
    }

    /**
     * Gets query for [[Gender]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getGender()
    {
        return $this->hasOne(Gender::className(), ['id' => 'gender_id']);
    }
    public function getState()
    {
        return $this->hasOne(State::className(), ['id' => 'state_id']);
    }
    /**
     * Gets query for [[Section]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getSection()
    {
        return $this->hasOne(Section::class, ['id' => 'section_id']);
    }

    /**
     * Gets query for [[Province]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getProvince()
    {
        return $this->hasOne(Province::className(), ['id' => 'province_id']);
    }

    /**
     * Gets query for [[Region]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getRegion()
    {
        return $this->hasOne(Regions::className(), ['id' => 'region_id']);
    }

    public function uploadImages(): bool
    {

        if (!$this->uploadFolder('uploads', 'image')) {
            return false;
        }
        if (!$this->uploadFolder('diplom', 'diplom')) {
            return false;
        }
        if (!$this->uploadFolder('password', 'pass_file')) {
            return false;
        }
        if (!$this->uploadFolder('transript', 'transkriptlar')) {
            return false;
        }
        $this->uploadFolder('sertifikat', 'sertifikat');
        return true;
    }

    public function uploadFolder(string $path, string $attribute)
    {
        $path_up = Yii::getAlias('@assets') . '/' . $path .'/'. date('Y-m');
        $file = UploadedFile::getInstance($this, $attribute);

        if ($file instanceof UploadedFile) {
            $fileUrl = uniqid() . '.' . $file->extension;
            if (FileHelper::createDirectory($path_up) > strtotime(date('Y-m'))) {
                return false;
            }

            if (!$file->saveAs($path_up . '/' . $fileUrl)) {
                return false;
            }
            $this->$attribute = $path.'/'.date('Y-m') . '/' . $fileUrl;
            return true;
        }

        return false;
    }
}
