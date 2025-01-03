<?php $__env->startSection('content'); ?>

<!-- messages -->
<section class="content-header" >
  <div class="row">
    <div class="col-md-12">
      <?php if($errors->count() > 0 ): ?>

      <div class="alert alert-danger">
        <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
        <h6>The following errors have occurred:</h6>
        <ul>
          <?php foreach( $errors->all() as $message ): ?>
          <li><?php echo e($message); ?></li>
          <?php endforeach; ?>
        </ul>
      </div>
      <?php endif; ?>

      <?php if(Session::has('message')): ?>
      <div class="alert alert-info" role="alert">
        <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
        <?php echo e(Session::get('message')); ?>

      </div> 
      <?php endif; ?>

      <?php if(Session::has('errormessage')): ?>
      <div class="alert alert-danger" role="alert">
        <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
        <?php echo e(Session::get('errormessage')); ?>

      </div>
      <?php endif; ?>

    </div>
  </div>
</section>
<!-- end messages -->


<!-- Main content -->
<section class="content">

  <div class="row">
    <div class="col-lg-3 col-xs-6">
      <!-- small box -->
      <div class="small-box bg-aqua">
        <div class="inner">
          <h3><?php echo e(isset($total_pages) ? $total_pages : ''); ?></h3>

          <p>Today's Page</p>
        </div>
        <div class="icon">
          <i class="fa fa-file-text-o"></i>
        </div>
        <a href="#" class="small-box-footer">More info <i class="fa fa-arrow-circle-right"></i></a>
      </div>
    </div>
    <!-- ./col -->
    <div class="col-lg-3 col-xs-6">
      <!-- small box -->
      <div class="small-box bg-green">
        <div class="inner">
          <h3><?php echo e(isset($active_ads) ? $active_ads : ''); ?></h3>

          <p>Active Ads</p>
        </div>
        <div class="icon">
          <i class="fa fa-bullhorn"></i>
        </div>
        <a href="#" class="small-box-footer">More info <i class="fa fa-arrow-circle-right"></i></a>
      </div>
    </div>
    <!-- ./col -->
    <div class="col-lg-3 col-xs-6">
      <!-- small box -->
      <div class="small-box bg-yellow">
        <div class="inner">
          <h3><?php echo e(isset($total_users) ? $total_users - 1 : ''); ?></h3>

          <p>Total User's</p>
        </div>
        <div class="icon">
          <i class="fa fa-users"></i>
        </div>
        <a href="#" class="small-box-footer">More info <i class="fa fa-arrow-circle-right"></i></a>
      </div>
    </div>
    <!-- ./col -->
    <div class="col-lg-3 col-xs-6">
      <!-- small box -->
      <div class="small-box bg-red">
        <div class="inner">
          <h3><?php echo e(isset($total_category) ? $total_category : ''); ?></h3>

          <p>Total Categories</p>
        </div>
        <div class="icon">
          <i class="fa fa-tag"></i>
        </div>
        <a href="#" class="small-box-footer">More info <i class="fa fa-arrow-circle-right"></i></a>
      </div>
    </div>
    <!-- ./col -->
  </div>

  <div class="row">

    <div class="col-md-6">
      <div class="box box-success">
        <div class="box-body">
          <h4>Hello <b><?php echo e(Auth::user()->name); ?></b> ! <br> You are successfully logged in to ePaper Solution.</h4>
          <br>
          <h4>[NB: Please delete "Temporary Folder" after a certain period. ]</h4>
        </div>
      </div>
    </div>

    <div class="col-md-6">
      <div class="box box-success">
        <div class="box-header with-border">
          <h3 class="box-title">Temporery Folder's</h3>

          <div class="box-tools pull-right">

          </div>
        </div>
        <div class="box-body">

          <table class="table table-hover">
            <thead>
              <tr>
                <th>SL</th>
                <th>Folder Title</th>
                <th>Folder Size</th>
                <th>Action</th>
              </tr>
            </thead>

            <tbody>
              <?php if(!empty($folder_info) && (count($folder_info)>0)): ?>
              <?php foreach($folder_info as $key => $folder): ?>
              <tr>
                <td><?php echo e($key+1); ?></td>
                <td><?php echo e($folder['title']); ?></td>
                <td><?php echo e(number_format($folder['size'],2)); ?> MB</td>
                <td><a href="<?php echo e(url('/home/remove-temp-folder/'.$folder['title'])); ?>" class="btn btn-danger btn-xs"><i class="fa fa-trash"></i></a></td>
              </tr>
              <?php endforeach; ?>
              <?php else: ?>
              <tr>
                <th colspan="4">
                  <div class="alert alert-info text-center" style="margin-bottom: 0">Temporery Folder is Empty !</div>
                </th>
              </tr>
              <?php endif; ?>
            </tbody>
          </table>

        </div>
      </div>
    </div>


  </div>

</section>
<!-- /.content -->



<?php $__env->stopSection(); ?>

<?php echo $__env->make('layouts.app', array_except(get_defined_vars(), array('__data', '__path')))->render(); ?>