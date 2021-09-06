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
            [['state_id', 'province_id', 'region_id', 'gender_id'], 'required'],
            [['state_id', 'province_id', 'region_id', 'gender_id', 'status'], 'integer'],
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
        $image = UploadedFile::getInstance($this, 'image');
        $diplom = UploadedFile::getInstance($this, 'diplom');
        $sertifikat = UploadedFile::getInstance($this, 'sertifikat');
        $transkript = UploadedFile::getInstance($this, 'transkriptlar');
        $passport = UploadedFile::getInstance($this, 'pass_file');

        $image_url = uniqid() . '.' . $image->extension;
        $diplom_url = uniqid() . '.' . $diplom->extension;
        $sertifikat_url = uniqid() . '.' . $sertifikat->extension;
        $transkript_url = uniqid() . '.' . $transkript->extension;
        $passport_url = uniqid() . '.' . $passport->extension;

        $path_up = Yii::getAlias('@uploads/') . date('Y-M');
        $path_diplom = Yii::getAlias('@diplom/') . date('Y-M');
        $path_sertifikat = Yii::getAlias('@sertifikat/') . date('Y-M');
        $path_transkript = Yii::getAlias('@transript/') . date('Y-M');
        $path_passport = Yii::getAlias('@passport/') . date('Y-M');


        if (FileHelper::createDirectory($path_transkript) > strtotime(date('Y-M'))) {
            return false;
        }
        if (FileHelper::createDirectory($path_sertifikat) > strtotime(date('Y-M'))) {
            return false;
        }
        if (FileHelper::createDirectory($path_up) > strtotime(date('Y-M'))) {
            return false;
        }
        if (FileHelper::createDirectory($path_diplom) > strtotime(date('Y-M'))) {
            return false;
        }
        if (FileHelper::createDirectory($path_passport) > strtotime(date('Y-M'))) {
            return false;
        }

        if ($transkript === null || !$transkript->saveAs($path_transkript . '/' . $transkript_url)) {
            return false;
        }
        $this->transkriptlar = $transkript_url;

        if ($sertifikat === null || !$sertifikat->saveAs($path_sertifikat . '/' . $sertifikat_url)) {
            return false;
        }
        $this->sertifikat = $sertifikat_url;

        if ($diplom === null || !$diplom->saveAs($path_diplom . '/' . $diplom_url)) {
            return false;
        }
        $this->diplom = $diplom_url;

        if ($passport === null || !$passport->saveAs($path_passport . '/' . $passport_url)) {
            return false;
        }
        $this->pass_file = $passport_url;

        return true;
    }
}
