
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>ePaper | <?php echo e(Route::currentRouteName() ? Route::currentRouteName() :'Admin Panel'); ?></title>
    <?php  $epaper = \App\Epaper::Get_();  ?>
  <link rel="icon" type="image/png" href="<?php echo e(asset('assets/images/32x32.png')); ?>">
  <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
  
  <!-- Bootstrap 3.3.6 -->
  <link rel="stylesheet" href="<?php echo e(asset('assets/bootstrap/css/bootstrap.min.css')); ?>">
  <!-- Font Awesome -->
  <link rel="stylesheet" href="<?php echo e(asset('assets/font-awesome/css/font-awesome.min.css')); ?>">
  <!-- Ionicons -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/ionicons/2.0.1/css/ionicons.min.css">
  <!-- Theme style -->
  <link rel="stylesheet" href="<?php echo e(asset('assets/css/AdminLTE.min.css')); ?>">
  <!-- iCheck -->
  <link rel="stylesheet" href="<?php echo e(asset('assets/plugins/iCheck/square/blue.css')); ?>">

  <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
  <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
  <!--[if lt IE 9]>
  <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
  <![endif]-->
</head>
<body class="hold-transition login-page">
  <div class="login-box">
    <div class="login-box-body">
     <center><a href="<?php echo e(url('/')); ?>"><img src="<?php echo e(asset('/assets/images/logo/')); ?>/<?php echo $epaper->logo; ?>" class="img-responsive" width="200px" /></a></center>
     <hr style="margin-top: 10px">

     <form class="form-login" role="form" method="POST" action="<?php echo e(url('/login')); ?>" autocomplete="off">
      <?php echo e(csrf_field()); ?>

      <div class="form-group has-feedback">
        <input type="email" name="email" class="form-control" value="<?php echo e(old('email')); ?>" placeholder="Email">
        <span class="fa fa-envelope form-control-feedback"></span>
        <?php if($errors->has('email')): ?>
        <span class="help-block">
          <strong><?php echo e($errors->first('email')); ?></strong>
        </span>
        <?php endif; ?>
      </div>
      <div class="form-group has-feedback">
        <input type="password" name="password" class="form-control" placeholder="Password">
        <span class="fa fa-lock form-control-feedback"></span>
        <?php if($errors->has('password')): ?>
        <span class="help-block">
          <strong><?php echo e($errors->first('password')); ?></strong>
        </span>
        <?php endif; ?>
      </div>
      <div class="row">
        <div class="col-xs-12">
          <button type="submit" class="btn btn-primary btn-block btn-flat">Sign In</button>
        </div>

        <div class="col-xs-12" style="margin-top: 10px;text-align: center;">
 Technical Support by  <a href="https://doptor.com.bd/" target="_blank" title="Doptor IT"> Doptor IT </a>
        </div>
        <!-- /.col -->
      </div>
    </form>


  </div>
  <!-- /.login-box-body -->
</div>
<!-- /.login-box -->

<!-- jQuery 2.2.3 -->
<script src="<?php echo e(asset('assets/plugins/jQuery/jquery-2.2.3.min.js')); ?>"></script>
<!-- Bootstrap 3.3.6 -->
<script src="<?php echo e(asset('assets/bootstrap/js/bootstrap.min.js')); ?>"></script>
<!-- iCheck -->
<script src="<?php echo e(asset('assets/plugins/iCheck/icheck.min.js')); ?>"></script>
<script>
  $(function () {
    $('input').iCheck({
      checkboxClass: 'icheckbox_square-blue',
      radioClass: 'iradio_square-blue',
      increaseArea: '20%' // optional
    });
  });
</script>
</body>
</html>
