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
            echo \hail812\adminlte\widgets\Menu::widget([
                'items' => [
                    ['label' => 'Profile',  'icon' => '	fas fa-user-circle', 'url' => ['/profile/index']],
                    ['label' => 'Administrators',  'icon' => 'fas fa-user-shield', 'url' => ['/admin/index']],
//                    [
//                        'label' => '',
//                        'items' => [
//                            ['label' => 'Employees List', 'iconStyle' => 'far','url'=>['employees/index']],
////                            [
////                                'label' => 'Level2',
////                                'iconStyle' => 'far',
////                                'items' => [
////                                    ['label' => 'Level3', 'iconStyle' => 'far', 'icon' => 'dot-circle'],
////                                    ['label' => 'Level3', 'iconStyle' => 'far', 'icon' => 'dot-circle'],
////                                    ['label' => 'Level3', 'iconStyle' => 'far', 'icon' => 'dot-circle']
////                                ]
////                            ],
//                            ['label' => 'Employees Type', 'iconStyle' => 'far','url'=>['employee-type/index']],
//                            ['label' => 'Sections', 'iconStyle' => 'far','url'=>['sections/index']],
//                            ['label' => 'Positions', 'iconStyle' => 'far','url' =>['positions/index']]
//                        ]
//                    ],
                    ['label' => 'Departments',  'icon' => 'fa fa-map', 'url' => ['/department/index']],
                    ['label' => 'States',  'icon' => 'fas fa-city', 'url' => ['/state/index']],
                    ['label' => 'Province',  'icon' => 'fa fa-map', 'url' => ['/province/index']],
                    ['label' => 'Regions',  'icon' => 'fas fa-city', 'url' => ['/regions/index']],
                    ['label' => 'Genders',  'icon' => 'fa fa-gender', 'url' => ['/gender/index']],
                    ['label' => 'Section',  'icon' => '', 'url' => ['/section/index']],
//                    ['label' => 'User',  'icon' => 'fas fa-user', 'url' => ['/user/index']],


//                    ['label' => 'Yii2 PROVIDED', 'header' => true],
//                    ['label' => 'Login', 'url' => ['site/login'], 'icon' => 'sign-in-alt', 'visible' => Yii::$app->user->isGuest],
//                    ['label' => 'Gii',  'icon' => 'file-code', 'url' => ['/gii'], 'target' => '_blank'],
//                    ['label' => 'Debug', 'icon' => 'bug', 'url' => ['/debug'], 'target' => '_blank'],
//                    ['label' => 'MULTI LEVEL EXAMPLE', 'header' => true],
//                    ['label' => 'Level1'],
//                    [
//                        'label' => 'Level1',
//                        'items' => [
//                            ['label' => 'Level2', 'iconStyle' => 'far'],
//                            [
//                                'label' => 'Level2',
//                                'iconStyle' => 'far',
//                                'items' => [
//                                    ['label' => 'Level3', 'iconStyle' => 'far', 'icon' => 'dot-circle'],
//                                    ['label' => 'Level3', 'iconStyle' => 'far', 'icon' => 'dot-circle'],
//                                    ['label' => 'Level3', 'iconStyle' => 'far', 'icon' => 'dot-circle']
//                                ]
//                            ],
//                            ['label' => 'Level2', 'iconStyle' => 'far']
//                        ]
//                    ],
//                    ['label' => 'Level1'],
                ],
            ]);
            ?>
        </nav>
        <!-- /.sidebar-menu -->
    </div>
    <!-- /.sidebar -->
</aside>