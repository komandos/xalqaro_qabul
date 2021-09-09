<?php

namespace common\models\constant;

use Yii;


class GeneralStatus
{
    const STATUS_NOT_ACTIVE = 0;
    const STATUS_ACTIVE = 1;

    public static function getString($num)
    {
        switch ($num) {
            case self::STATUS_NOT_ACTIVE:
                return '<p style="color: red">Ogohlantirilmagan</p>';
            case self::STATUS_ACTIVE:
                return '<p style="color: green">Ogohlantirilgan</p>';
        }
    }

    public static function getList()
    {
        return [
            self::STATUS_ACTIVE => 'Ogohlantirilgan',
            self::STATUS_NOT_ACTIVE => 'Ogohlantirilmagan',
        ];
    }

    public static function getArray()
    {
        $statuses[self::STATUS_ACTIVE] = Yii::t('app', 'Ogohlantirilgan');
        $statuses[self::STATUS_NOT_ACTIVE] = Yii::t('app', 'Ogohlantirilmagan');

        return $statuses;
    }

    public static function getProposalString($status)
    {
        switch ($status) {
            case self::STATUS_NOT_ACTIVE:
                return Yii::t('app', 'Declined');
            case self::STATUS_ACTIVE:
                return Yii::t('app', 'Accepted');
        }
    }
}