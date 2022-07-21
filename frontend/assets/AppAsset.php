<?php

namespace frontend\assets;

use yii\web\AssetBundle;
use rmrevin\yii\fontawesome\CdnProAssetBundle;
use yii\bootstrap4\BootstrapAsset;
use yii\web\YiiAsset;

/**
 * Main frontend application asset bundle.
 */
class AppAsset extends AssetBundle
{
    public $basePath = '@webroot';
    public $baseUrl = '@web';
    public $css = [
        'css/site.css',
    ];
    public $js = [
    ];
    public $depends = [
        YiiAsset::class,
        BootstrapAsset::class,
        CdnProAssetBundle::class
    ];
}
