

<?php $__env->startSection('content'); ?>

<!-- messages -->
<section class="content-header">
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


<section class="content">
	<div class="row">
	    <div class="col-md-1"></div>
        <div class="col-md-10">
			<!-- About Me Box -->
			<div class="box box-primary">
				<div class="box-header with-border">
					<h3 class="box-title">E-Information</h3>
				</div>
				<!-- /.box-header -->
				<div class="box-body">
					<form action="<?php echo e(url('/up_details')); ?>" method="post" enctype="multipart/form-data">
						<input type="hidden" name="_token" value="<?php echo e(csrf_token()); ?>">

						<strong><i class="fa fa-globe"></i> Online version</strong>

						<p class="text-muted">
							<textarea name="online"class="form-control"><?php echo e($user_info->online); ?></textarea>
						</p>

						<hr>

						<strong><i class="fa fa-image"></i> Logo</strong>

						<p class="text-muted"><input type="file" name="logo" value="<?php echo e($user_info->logo); ?>" class="form-control"></p>
						<img src="<?php echo e(url('/assets/images/logo/')); ?>/<?php echo e($user_info->logo); ?>" width="30%">
		
						<hr>

						<strong><i class="fa fa-level-down"></i> Footer Text</strong>

						<p>
							<textarea name="footer" class="form-control"><?php echo e($user_info->footer); ?></textarea>
						</p>

						<hr>

						<strong><i class="fa fa-level-down"></i> Copy ritht</strong>

						<p>
							<textarea name="copyright" class="form-control"> <?php echo e($user_info->copyright); ?></textarea>
						</p>

						<hr>
						<button type="submit" class="btn btn-primary pull-right">Save</button>

					</form>
				</div>
				<!-- /.box-body -->
			</div>
			<!-- /.box -->
		</div>
		<div class="col-md-1"></div>
	</div>
</section>



<?php $__env->stopSection(); ?>
<?php echo $__env->make('layouts.app', array_except(get_defined_vars(), array('__data', '__path')))->render(); ?>