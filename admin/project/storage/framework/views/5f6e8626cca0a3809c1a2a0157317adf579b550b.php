


<?php $__env->startPush('page-css'); ?>
<style type="text/css">

	.table-text-center th{
		text-align: center;
	}
	.table-text-center td{
		text-align: center;
	}
	/*tr:nth-child(even) {
		background-color: #dddddd;
	}*/
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
				<div class="box-header with-border"><h4 class="box-title">User Management</h4> <button type="button" data-toggle="modal" data-target="#addNewUser" class="btn btn-primary btn-xs pull-right"><i class="fa fa-plus"></i> Add New</button></div>
				<div class="box-body">

					<table class="table table-bordered table-hover table-text-center" id="user-dataTable">
						<thead>
							<tr>
								<th>SL</th>
								<th>Photo</th>
								<th>Name</th>
								<th>Role</th>
								<th>Email</th>
								<th>Status</th>
								<th>Action</th>
							</tr>
						</thead>

						<tbody>
							<?php if(!empty($users_info) && (count($users_info)>0)): ?>
							<?php foreach($users_info as $key => $list): ?>
							<?php if($list->name != 'system'): ?>
							<tr>
								<td style="vertical-align: middle;"><?php echo e($key+1); ?></td>
								<td style="vertical-align: middle;">
									<?php if(!empty($list->user_image)): ?>
									<img src="<?php echo e(asset('assets/images/avatars/'.$list->user_image)); ?>" style="height: 40px;width: 40px;border-radius: 100%">
									<?php else: ?>
									<img src="<?php echo e(asset('assets/images/avatars/default_avatar.png')); ?>" style="height: 40px;width: 40px;border-radius: 100%">
									<?php endif; ?>
								</td>
								<td style="vertical-align: middle;"><?php echo e($list->name); ?></td>
								<td style="vertical-align: middle;"><?php echo e($list->role); ?></td>
								<td style="vertical-align: middle;"><?php echo e($list->email); ?></td>
								<td style="vertical-align: middle;">
									<?php if($list->user_status=='1'): ?>
									<button type="button" class="btn btn-success btn-xs">Active</button>
									<?php else: ?>
									<button type="button" class="btn btn-danger btn-xs">Blocked</button>
									<?php endif; ?>
								</td>
								<td style="vertical-align: middle;">
									<button type="button" data-toggle="modal" data-target="#updateUser" class="btn btn-info btn-xs openEditModal" data-id="<?php echo e($list->id); ?>" data-name="<?php echo e($list->name); ?>" data-role="<?php echo e($list->role); ?>" data-email="<?php echo e($list->email); ?>" data-status="<?php echo e($list->user_status); ?>"><i class="fa fa-edit"></i></button>
								</td>
							</tr>
							<?php endif; ?>
							<?php endforeach; ?>
							<?php endif; ?>
						</tbody>
					</table>

				</div>
			</div>
		</div>
	</div>
</section>
<!-- End Main content -->


<!-- add new user modal -->
<div class="modal fade" id="addNewUser" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
				<h4 class="modal-title" id="exampleModalLabel">Add New User</h4>
			</div>

			<form class="form-horizontal" action="<?php echo e(url('/user/create')); ?>" method="post" enctype="multipart/form-data">
				<input type="hidden" name="_token" value="<?php echo e(csrf_token()); ?>">

				<div class="modal-body">
					<div class="form-group">
						<label class="col-sm-3 control-label">Name</label>
						<div class="col-sm-9">
							<input type="text" name="name" class="form-control" placeholder="Full Name" required="required">
						</div>
					</div>

					<div class="form-group">
						<label class="col-sm-3 control-label">Role</label>
						<div class="col-sm-9">
							<select class="form-control" name="role" required="required">
								<option value="operator">Operator</option>
								<option value="admin">Admin</option>
							</select>
						</div>
					</div>

					<div class="form-group">
						<label class="col-sm-3 control-label">Email</label>
						<div class="col-sm-9">
							<input type="email" name="email" class="form-control" placeholder="Email" required="required">
						</div>
					</div>

					<div class="form-group">
						<label class="col-sm-3 control-label">Password</label>
						<div class="col-sm-9">
							<input type="password" name="password" class="form-control" required="required" autocomplete="off">
						</div>
					</div>

					<div class="form-group">
						<label class="col-sm-3 control-label">Photo</label>
						<div class="col-sm-9">
							<input type="file" name="user_image" class="form-control">
						</div>
					</div>

				</div>

				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
					<button type="submit" class="btn btn-primary">Save New User !</button>
				</div>
			</form>
		</div>
	</div>
</div>
<!-- end add new user modal -->


<!-- edit user modal -->
<div class="modal fade" id="updateUser" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
				<h4 class="modal-title" id="exampleModalLabel">Update User Information</h4>
			</div>

			<form class="form-horizontal" action="<?php echo e(url('/user/update')); ?>" method="post" enctype="multipart/form-data">
				<input type="hidden" name="_token" value="<?php echo e(csrf_token()); ?>">
				<input type="hidden" name="user_id" id="id" value="">

				<div class="modal-body">
					<div class="form-group">
						<label class="col-sm-3 control-label">Name</label>
						<div class="col-sm-9">
							<input type="text" name="name" id="name" class="form-control" placeholder="Full Name" required="required">
						</div>
					</div>

					<div class="form-group">
						<label class="col-sm-3 control-label">Role</label>
						<div class="col-sm-9">
							<select class="form-control" name="role" id="role" required="required">
								<option value="operator">Operator</option>
								<option value="admin">Admin</option>
							</select>
						</div>
					</div>

					<div class="form-group">
						<label class="col-sm-3 control-label">Email</label>
						<div class="col-sm-9">
							<input type="email" name="email" id="email" class="form-control" placeholder="Email" required="required">
						</div>
					</div>

					<div class="form-group">
						<label class="col-sm-3 control-label">Password</label>
						<div class="col-sm-9">
							<input type="text" name="password" class="form-control" autocomplete="off">
						</div>
					</div>

					<div class="form-group">
						<label class="col-sm-3 control-label">Status</label>
						<div class="col-sm-9">
						<select class="form-control" name="user_status" id="status" required="required">
								<option value="1">Active</option>
								<option value="0">Blocked</option>
							</select>
						</div>
					</div>

				</div>

				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
					<button type="submit" class="btn btn-primary">Update User !</button>
				</div>
			</form>
		</div>
	</div>
</div>
<!-- end edit user modal -->

<?php $__env->stopSection(); ?>

<?php $__env->startPush('page-scripts'); ?>
<script type="text/javascript">
	/*#############################
    ## Edit User
    #############################*/
    $(document).on("click", ".openEditModal", function () {
    	var id = $(this).data('id');
    	var name = $(this).data('name');
    	var role = $(this).data('role');
    	var email = $(this).data('email');
    	var status = $(this).data('status');
    	$(".modal-content #id").val( id );
    	$(".modal-content #name").val( name );
    	$(".modal-content #role").val( role );
    	$(".modal-content #email").val( email );
    	$(".modal-content #status").val( status );
    });

    // data tables
	$(document).ready(function() {
		$('#user-dataTable').DataTable();
	} );
</script>
<?php $__env->stopPush(); ?>
<?php echo $__env->make('layouts.app', array_except(get_defined_vars(), array('__data', '__path')))->render(); ?>