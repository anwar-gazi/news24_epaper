<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>ePaper | <?php echo e(Route::currentRouteName() ? Route::currentRouteName() :'Admin Panel'); ?></title>
  <link rel="icon" type="image/png" href="<?php echo e(asset('assets/images/32x32.png')); ?>">
  <!-- Tell the browser to be responsive to screen width -->
  <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
  <!-- Bootstrap 3.3.6 -->
  <link rel="stylesheet" href="<?php echo e(asset('assets/bootstrap/css/bootstrap.min.css')); ?>">
  <!-- Font Awesome -->
  <link rel="stylesheet" href="<?php echo e(asset('assets/font-awesome/css/font-awesome.min.css')); ?>">
  <!-- custom -->
  <link rel="stylesheet" href="<?php echo e(asset('assets/css/custom.css')); ?>">
  <!-- Theme style -->
  <link rel="stylesheet" href="<?php echo e(asset('assets/css/AdminLTE.css')); ?>">
  <link rel="stylesheet" href="<?php echo e(asset('assets/css/skins/_all-skins.min.css')); ?>">

  <?php echo $__env->yieldPushContent('page-css'); ?>

</head>
<body class="hold-transition skin-blue sidebar-mini" >
  <!-- Site wrapper -->
  <div class="wrapper" >
    <?php  $epaper = \App\Epaper::Get_();  ?>
    <header class="main-header">
      <a href="<?php echo e(url('/home')); ?>" class="logo" style="text-align: -webkit-center;background-color: white">
        <span class="logo-mini"><img src="<?php echo e(asset('assets/images/32x32.png')); ?>" style="width: 100%" class="img-responsive" /></span>
        <span class="logo-lg" style="margin-top: 10px"><img src="<?php echo e(asset('/assets/images/logo/')); ?>/<?php echo $epaper->logo; ?>" class="img-responsive" style="width: 130px" /></span>
      </a>
      <!-- Header Navbar: style can be found in header.less -->
      <nav class="navbar navbar-static-top">
        <!-- Sidebar toggle button-->
        <a href="#" class="sidebar-toggle" data-toggle="offcanvas" role="button">
          <span class="sr-only">Toggle navigation</span>
          <span class="icon-bar"></span>
          <span class="icon-bar"></span>
          <span class="icon-bar"></span>
        </a>

        <div class="navbar-custom-menu">
          <ul class="nav navbar-nav">

            <!-- User Account: style can be found in dropdown.less -->
            <li class="dropdown user user-menu">
              <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                <?php if(!empty(\Auth::user()->user_image)): ?>
                <img src="<?php echo e(asset('assets/images/avatars/'.\Auth::user()->user_image)); ?>" class="user-image" alt="User Image">
                <?php else: ?>
                <img src="<?php echo e(asset('assets/images/avatars/default_avatar.png')); ?>" class="user-image" alt="User Image">
                <?php endif; ?>
                <span class="hidden-xs"><?php echo e(\Auth::user()->name); ?></span>
              </a>
              <ul class="dropdown-menu">
                <!-- User image -->
                <li class="user-header">
                  <?php if(!empty(\Auth::user()->user_image)): ?>
                  <img src="<?php echo e(asset('assets/images/avatars/'.\Auth::user()->user_image)); ?>" class="img-circle" alt="User Image">
                  <?php else: ?>
                  <img src="<?php echo e(asset('assets/images/avatars/default_avatar.png')); ?>" class="img-circle" alt="User Image">
                  <?php endif; ?>
                  <p>
                    <?php echo e(\Auth::user()->name); ?> - ePaper
                    <small>Member since <?php echo e(date('d M Y',strtotime(\Auth::user()->created_at))); ?></small>
                  </p>
                </li>

                <!-- Menu Footer-->
                <li class="user-footer">
                  <div class="pull-left">
                    <a href="<?php echo e(url('/profile')); ?>" class="btn btn-default btn-flat">Profile</a>
                  </div>
                  <div class="pull-right">
                    <a href="<?php echo e(url('/logout')); ?>" class="btn btn-default btn-flat">Sign out</a>
                  </div>
                </li>
              </ul>
            </li>

          </ul>
        </div>
      </nav>
    </header>

    <!-- =============================================== -->

    <!-- Left side column. contains the sidebar -->
    <?php echo $__env->make('layouts.sidebar', array_except(get_defined_vars(), array('__data', '__path')))->render(); ?>

    <!-- =============================================== -->

    <!-- Content Wrapper. Contains page content -->
    <div class="content-wrapper" style="overflow-y: auto;height: 500px;">
      <?php echo $__env->yieldContent('content'); ?>
    </div>
    <!-- /.content-wrapper -->

    <footer class="main-footer">
    Technial Support by  <a href="https://doptor.com.bd/" target="_blank" title="https://doptor.com.bd/"> Doptor IT </a>
    </footer>

    <!-- Control Sidebar -->

    <!-- /.control-sidebar -->
  <!-- Add the sidebar's background. This div must be placed
  immediately after the control sidebar -->
  <div class="control-sidebar-bg"></div>
</div>
<!-- ./wrapper -->

<!-- jQuery 2.2.3 -->
<script src="<?php echo e(asset('assets/plugins/jQuery/jquery-2.2.3.min.js')); ?>"></script>
<!-- Bootstrap 3.3.6 -->
<script src="<?php echo e(asset('assets/bootstrap/js/bootstrap.min.js')); ?>"></script>
<!-- SlimScroll -->
<script src="<?php echo e(asset('assets/plugins/slimScroll/jquery.slimscroll.min.js')); ?>"></script>
<!-- FastClick -->
<script src="<?php echo e(asset('assets/plugins/fastclick/fastclick.js')); ?>"></script>
<!-- AdminLTE App -->
<script src="<?php echo e(asset('assets/js/app.min.js')); ?>"></script>
<!-- AdminLTE for demo purposes -->
<script src="<?php echo e(asset('assets/js/demo.js')); ?>"></script>


<script type="text/javascript" src="<?php echo e(asset('assets/js/datatables.js')); ?>"></script>
<script type="text/javascript" src="<?php echo e(asset('assets/js/datatables.bootstrap.js')); ?>"></script>

<?php echo $__env->yieldPushContent('page-scripts'); ?>
</body>

<input type="hidden" name="site_url" class="site_url" value="<?php echo e(url('/')); ?>">
</html>
