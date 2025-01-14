


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
	tr:nth-child(even) {
		background-color: #dddddd;
	}
	.dataTables_filter{
		float: right;
	}
	.dataTables_paginate{
		float: right;
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

		<div class="col-md-5">
			<div class="box box-success">
				<div class="box-header with-border"><h4 class="box-title">Add New Category</h4></div>
				<div class="box-body">
					
					<form class="form-horizontal" action="<?php echo e(url('/category/create')); ?>" method="post" enctype="multipart/form-data">
						<input type="hidden" name="_token" value="<?php echo e(csrf_token()); ?>">

						<div class="form-group">
							<label class="col-sm-3 control-label">Category Title</label>
							<div class="col-sm-9">
								<input type="text" name="category_name" class="form-control" placeholder="Category Title" required="required">
							</div>
						</div>
						<div class="box-footer">
							<button type="submit" class="btn btn-primary pull-right">Save Category !</button>
						</div>
					</form>

				</div>
			</div>
		</div>

		<!-- category list -->
		<div class="col-md-7">
			<div class="box box-success">
				<div class="box-header with-border"><h4 class="box-title">Category List</h4></div>
				<div class="box-body">
					
					<table class="table table-bordered table-hover table-text-center" id="category-dataTable">
						<thead>
							<tr>
								<th>SL</th>
								<th>Category Title</th>
								<th>Crt. Date</th>
								<th>Crt. By</th>
								<th>Status</th>
								<th>Action</th>
							</tr>
						</thead>
						<tbody>
							<?php if(!empty($category_list) && (count($category_list)>0)): ?>
							<?php foreach($category_list as $key => $list): ?>
							<tr>
								<td><?php echo e($key+1); ?></td>
								<td><?php echo e($list->name); ?></td>
								<td><?php echo e(date("d-M-y", strtotime($list->created_at))); ?></td>
								<td><b><?php echo e($list->creator_name); ?></b></td>
								<td>
									<?php if(isset($list->status) && ($list->status==1)): ?>
									<button type="button" data-id="<?php echo e($list->id); ?>" data-status="0" class="btn btn-default btn-xs changeStatus"><i class="fa fa-check"></i></button>
									<?php else: ?>
									<button type="button" data-id="<?php echo e($list->id); ?>" data-status="1" class="btn btn-danger btn-xs changeStatus"><i class="fa fa-times"></i></button>
									<?php endif; ?>
								</td>
								<td>
									<button type="button" class="btn btn-info btn-xs openEditModal" data-toggle="modal" data-target="#editCategory" data-id="<?php echo e($list->id); ?>" data-category="<?php echo e($list->name); ?>"><i class="fa fa-edit"></i></button>

									<button type="button " data-confirm-url="<?php echo e(url('/category/delete',$list->id)); ?>"  class="btn btn-danger btn-xs confirm_box"><i class="fa fa-trash"></i></button>
								</td>
							</tr>
							<?php endforeach; ?>
							<?php else: ?>
							<?php endif; ?>
						</tbody>
					</table>

				</div>
			</div>
		</div>
		<!-- end category list -->


	</div>
</section>
<!-- /.content -->

<!-- edit modal -->
<div class="modal fade" id="editCategory" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
				<h4 class="modal-title" id="exampleModalLabel">Update Category</h4>
			</div>
			<form class="form-horizontal" action="<?php echo e(url('/category/update')); ?>" method="post" enctype="multipart/form-data">
				<input type="hidden" name="_token" value="<?php echo e(csrf_token()); ?>">
				<div class="modal-body">
					<div class="form-group">
						<label class="col-sm-3 control-label">Category Title</label>
						<div class="col-sm-9">
							<input type="text" name="category_name" id="category_name" class="form-control" required="required">
							<input type="hidden" name="category_id" id="id">
						</div>
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
					<button type="submit" class="btn btn-primary">Update Category !</button>
				</div>
			</form>
		</div>
	</div>
</div>
<!-- end edit modal -->

<?php $__env->stopSection(); ?>

<?php $__env->startPush('page-scripts'); ?>

<script type="text/javascript">

	/*#############################
    ## Edit Category
    #############################*/
    $(document).on("click", ".openEditModal", function () {
    	var id = $(this).data('id');
    	var category_name = $(this).data('category');
    	$(".modal-body #id").val( id );
    	$(".modal-body #category_name").val( category_name );
    });

    /*###########################
	# Confirm Box
	#############################
	*/ 
	jQuery(function(){
		jQuery('.confirm_box').click(function(){
			var confirm_url=jQuery(this).data('confirm-url');
			if (confirm("Do You Want To Delete ?") == true) {
				window.location.href=confirm_url;
			}
		});
	});

	/*##########################################
	# change status
	############################################
	*/

	jQuery(function(){
		jQuery('.changeStatus').click(function(){

			var id = jQuery(this).data('id');
			var status = jQuery(this).data('status');
			var site_url = jQuery('.site_url').val();
			var request_url = site_url+'/ajax/category/change-status/'+id+'/'+status;

			jQuery.ajax({
				url: request_url,
				type: "get",
				success:function(data){
					location.reload();
				}
			});
		});
	});


	// data tables
	$(document).ready(function() {
		$('#category-dataTable').DataTable();
	} );

</script>
<?php $__env->stopPush(); ?>
<?php echo $__env->make('layouts.app', array_except(get_defined_vars(), array('__data', '__path')))->render(); ?>