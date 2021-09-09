<?php

use common\models\Admin;
use hail812\adminlte\widgets\Menu;

/**
 * @var Admin   $user
 */
$user = Yii::$app->getUser()->getIdentity();
?>
<aside class="main-sidebar sidebar-dark-primary elevation-4">
    <!-- Brand Logo -->
    <a href="index3.html" class="brand-link">
        <img src="<?=$assetDir?>/img/AdminLTELogo.png" alt="AdminLTE Logo" class="brand-image img-circle elevation-3" style="opacity: .8">
        <span class="brand-text font-weight-light">Employees</span>
    </a>

    <!-- Sidebar -->
    <div class="sidebar">
        <!-- Sidebar user panel (optional) -->
        <div class="user-panel mt-3 pb-3 mb-3 d-flex">
            <div class="image">
                <img src="<?=$assetDir?>/img/user2-160x160.jpg" class="img-circle elevation-2" alt="User Image">
            </div>
            <div class="info">
                <a href="#" class="d-block"><?=Yii::$app->user->identity->username?></a>
            </div>
        </div>

        <!-- SidebarSearch Form -->
        <!-- href be escaped -->
        <!-- <div class="form-inline">
            <div class="input-group" data-widget="sidebar-search">
                <input class="form-control form-control-sidebar" type="search" placeholder="Search" aria-label="Search">
                <div class="input-group-append">
                    <button class="btn btn-sidebar">
                        <i class="fas fa-search fa-fw"></i>
                    </button>
                </div>
            </div>
        </div> -->

        <!-- Sidebar Menu -->
        <nav class="mt-2">

            <?php
            $menuItems = [];
            if ($user->isAdmin() || $user->isXalqaro()) {
                $menuItems[] = ['label' => 'Profile', 'icon' => '	fas fa-user-circle', 'url' => ['/profile/index']];

                $menuItems[] = ['label' => 'Section', 'icon' => 'fa fa-questions', 'url' => ['/section/index']];
            }
            if ($user->isAdmin()){
                $menuItems[] = ['label' => 'Administrator', 'icon' => '	fas fa-user-circle', 'url' => ['/admin/index']];
                $menuItems[] = ['label' => 'States', 'icon' => 'fa fa-questions', 'url' => ['/state/index']];
                $menuItems[] = ['label' => 'Province', 'icon' => 'fa fa-questions', 'url' => ['/province/index']];
                $menuItems[] = ['label' => 'Region', 'icon' => 'fa fa-questions', 'url' => ['/regions/index']];
                $menuItems[] = ['label' => 'Gender', 'icon' => 'fa fa-questions', 'url' => ['/gender/index']];
            }
            echo Menu::widget([
                'items' => $menuItems,
            ]);
            ?>
        </nav>
        <!-- /.sidebar-menu -->
    </div>
    <!-- /.sidebar -->
</aside>