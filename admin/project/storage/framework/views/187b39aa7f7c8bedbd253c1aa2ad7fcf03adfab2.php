


<?php $__env->startPush('page-css'); ?>
<style type="text/css">
	a{
		text-decoration: none;
	}
	.table-text-center th{
		text-align: center;
	}
	.table-text-center td{
		text-align: center;
	}

</style>
<?php $__env->stopPush(); ?>

<?php $__env->startSection('content'); ?>

<!-- messages -->
<section class="content-header" style="margin-top: 0px">
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
		<div class="col-md-12">
			<div class="box box-success">
				<div class="box-header with-border"><h4 class="box-title">Manage Advertisements</h4></div>
				<div class="box-body">

					<table class="table table-bordered table-hover table-text-center" id="ad-dataTable">
						<thead>
							<tr>
								<th>SL</th>
								<th>Position</th>
								<th>Size</th>
								<th>Status</th>
								<th>Active From</th>
								<th>Last Active</th>
								<th>Action</th>
							</tr>
						</thead>

						<tbody>
							<?php if(!empty($advertisements) && (count($advertisements)>0)): ?>
							<?php foreach($advertisements as $key => $advertisement): ?>
							<tr>
								<td ><?php echo e($key+1); ?></td>
								<td ><?php echo e($advertisement->ad_position); ?></td>
								<td ><?php echo e($advertisement->ad_size); ?></td>
								<td >
									<?php if($advertisement->ad_status == 1): ?>
									<button type="button" class="btn btn-success btn-xs" style="width: 60px">Active</button>
									<?php else: ?>
									<button type="button" class="btn btn-danger btn-xs" style="width: 60px">Inactive</button>
									<?php endif; ?>

								</td>
								<td >
									<?php echo e($advertisement->active_from); ?>

								</td>
								<td >
									<?php echo e($advertisement->active_upto); ?>

								</td>
								<td><a data-toggle="modal" data-code="<?php echo e($advertisement->ad_code); ?>" data-status="<?php echo e($advertisement->ad_status); ?>" data-id="<?php echo e($advertisement->id); ?>" class="btn btn-info btn-xs open-editAdModal" href="#editAdModal"><i class="fa fa-edit"></i></a></td>
							</tr>
							<?php endforeach; ?>
							<?php endif; ?>
						</tbody>
					</table>
					
				</div>
			</div>
		</div>
	</div>
</section>
<!-- /.content -->



<!-- Edit Modal -->
<div id="editAdModal" class="modal fade" role="dialog">
	<div class="modal-dialog">
		<!-- Modal content-->
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">&times;</button>
				<h4 class="modal-title">Update Advertisement</h4>
			</div>
			<div class="modal-body">
				<form role="form" class="form-horizontal" method="post" action="<?php echo e(url('/advertisement/update')); ?>" enctype="multipart/form-data">

					<input type="hidden" name="_token" value="<?php echo e(csrf_token()); ?>"/>
					<input type="hidden" name="ad_id" id="ad" value=""/>

					<div class="form-group">
						<div class="col-sm-offset-1 col-sm-4">
							<label class="control-label"><b>Advertisement Status</b></label>
						</div>
						<div class="col-sm-6">
							<select class="form-control" name="ad_status" id="ad_status" required >
								<option value="1" selected>Publish</option>
								<option value="0">Unpublish</option>
							</select>
						</div>
					</div>


					<div class="form-group">
						<div class="col-sm-offset-1 col-sm-4">
							<label class="control-label"><b>Advertisement Code</b></label>
						</div>
						<div class="col-sm-6">
							<textarea class="form-control" rows="3" name="ad_code" id="ad_code" required></textarea>
						</div>
					</div>


					<div class="form-group">
						<div class="col-sm-6 col-sm-offset-5">
							<button type="submit" class="btn btn-primary btn-block">Save Advertisement !</button>
						</div>
					</div>
				</form>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
			</div>
		</div>
	</div>
</div>
<!-- End Edit Modal -->

<?php $__env->stopSection(); ?>

<?php $__env->startPush('page-scripts'); ?>

<script type="text/javascript">

	$(document).on("click", ".open-editAdModal", function () {
		var ad_id = $(this).data('id');
		var ad_code = $(this).data('code');
		var ad_status = $(this).data('status');

		$(".modal-body #ad").val( ad_id );
		$(".modal-body #ad_code").val( ad_code );
		$(".modal-body #ad_status").val( ad_status );
	});

	// data tables
	$(document).ready(function() {
		$('#ad-dataTable').DataTable();
	} );

</script>
<?php $__env->stopPush(); ?>
<?php echo $__env->make('layouts.app', array_except(get_defined_vars(), array('__data', '__path')))->render(); ?>