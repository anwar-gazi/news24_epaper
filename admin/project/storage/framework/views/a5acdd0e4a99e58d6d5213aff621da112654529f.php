


<?php $__env->startPush('page-css'); ?>
<link rel="stylesheet" href="<?php echo e(asset('assets/plugins/datepicker/datepicker3.css')); ?>">
<style type="text/css">
	a{
		text-decoration: none;
	}
	.table-text-center th{
		text-align: center;
		vertical-align: middle;
	}
	.table-text-center td{
		text-align: center;
	}

	.border_bottom{
		border-bottom: 3px solid #00a65a;
	}
	.required_field{
		color: red;
		font-size: 15px;
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

		<!-- date wise search -->
		<div class="col-md-12">
			<div class="box box-success border_bottom">
				<form class="form-horizontal">
					<div class="box-header with-border" >
						<label class="col-sm-3 control-label">Pick A Date</label>
						<div class="col-sm-4">
							<div class="input-group date">
								<input type="text" name="date" class="form-control search_date" id="datepicker" placeholder="Pick Date" value="<?php echo e(isset($_GET['date']) ? $_GET['date'] : date('d-m-Y')); ?>">
								<div class="input-group-addon">
									<i class="fa fa-calendar"></i>
								</div>
							</div>
						</div>
						<div class="col-sm-2">
							<button type="button" class="btn btn-info btn-block page_search" style="border-radius: 0">Search !</button>
						</div>

						<?php if(isset($_GET['date']) && !empty($_GET['date'])): ?>
						<div class="col-sm-3">
							<a href="<?php echo e(url('/publish-pages/'.$_GET['date'])); ?>" class="btn btn-success btn-block page_search" style="border-radius: 0">Publish Now</a>
						</div>
						<?php endif; ?>
					</div>
				</form>
			</div>
		</div>
		<!-- end date wise search -->


		<?php if(isset($_GET['date']) && !empty($_GET['date'])): ?>
		<?php if((date('Y-m', strtotime($_GET['date'])) == date('Y-m') || date('Y-m', strtotime($_GET['date'])) <= date('Y-m', strtotime('+1 month', strtotime(date('Y-m-d'))))  )): ?>
		<!-- page list -->
		<div class="col-md-12">
			<div class="box box-success">
				<div class="box-header with-border"><h4 class="box-title">Page List On Date: <strong><?php echo e(date("d-M-Y",strtotime($_GET['date']))); ?></strong> </h4></div>
				<div class="box-body">
					<table class="table table-bordered table-hover table-text-center">
						<thead>
							<tr>
								<th>SL</th>
								<th>Page</th>
								<th>Edition</th>
								<th>Category</th>
								<th>Page Number</th>
								<th>Publish Date</th>
								<th>Action</th>
							</tr>
						</thead>
						<tbody>
							<?php if(!empty($page_list) && (count($page_list)>0)): ?>
							<?php foreach($page_list as $key => $list): ?>
							<tr>
								<td style="vertical-align: middle;"><?php echo e($key+1); ?></td>
								<td style="vertical-align: middle;">
									<center>
										<img src="<?php echo e($up_dir.$uploads_path.date('Y',strtotime($list->publish_date)).'/'.date('m',strtotime($list->publish_date)).'/'.date('d',strtotime($list->publish_date)).'/thumb/'.$list->image); ?>" class="img image-responsive thumbnail" style="height: 100px;width: 80px;padding:0;margin: 0">
									</center>
								</td>
								<td style="vertical-align: middle;">
									<?php  $editions=\App\Page::PageEdition($list->publish_date, $list->id);  ?>
									<?php if(!empty($editions) && (count($editions)>0)): ?>
									<?php foreach($editions as $key => $page_edition): ?>
									<p><?php echo e($page_edition->name); ?></p>
									<?php endforeach; ?>
									<?php endif; ?>
								</td>
								<td style="vertical-align: middle;"><?php echo e($list->category_name); ?></td>
								<td style="vertical-align: middle;"><?php echo e(str_pad($list->page_number, 2, "0", STR_PAD_LEFT)); ?></td>
								<td style="vertical-align: middle;"><?php echo e(date("d-M-Y",strtotime($list->publish_date))); ?></td>
								<td style="vertical-align: middle;">
									<button type="button" data-confirm-url="<?php echo e(url('/page/delete/'.$list->id.'/'.$list->image.'/'.$list->publish_date)); ?>" class="btn btn-danger btn-xs confirm_box" data-toggletip="tooltip" data-placement="top" title="Delete"><i class="fa fa-trash"></i></button>
								</td>
							</tr>
							<?php endforeach; ?>
							<?php else: ?>
							<tr>
								<td colspan="7"><div class="alert alert-info text-center" style="margin: 0;">No Page Found !</div></td>
							</tr>
							<?php endif; ?>
						</tbody>
					</table>

				</div>
			</div>
		</div>
		<!-- end page list -->

		<?php else: ?>
		<div class="col-md-12">
			<div class="col-md-12 alert alert-danger text-center">Please select a valid date !</div>
		</div>
		<?php endif; ?>
		<?php endif; ?>


	</div>
</section>
<!-- /.content -->



<!-- edit page modal -->
<div class="modal fade" id="editPage" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="ajax_edit_page_view"></div>
		</div>
	</div>
</div>
<!-- end edit page modal -->

<?php $__env->stopSection(); ?>

<?php $__env->startPush('page-scripts'); ?>
<script src="<?php echo e(asset('assets/plugins/datepicker/bootstrap-datepicker.js')); ?>"></script>
<script type="text/javascript">

	// Confirm Box
	jQuery(function(){
		jQuery('.confirm_box').click(function(){
			var confirm_url=jQuery(this).data('confirm-url');
			if (confirm("Delete This Page Permanently !\nDo You Want To Proceed ?") == true) {
				window.location.href=confirm_url;
			}
		});
	});

	//Date picker
	$('#datepicker').datepicker({
		format: 'dd-mm-yyyy',
		autoclose: true
	});

	// edition get
	jQuery(function(){
		jQuery('.edition_get').change(function(){
			var x= $('#values').val();
			var editions = x;
			$("#editions_value").val( editions );
		});
	});

	// tooltip
	$(function () {
		$('[data-toggletip="tooltip"]').tooltip();
	});

	$('.page_search').click(function(){
		var search_date = $('.search_date').val();
		var site_url = $('.site_url').val();
		var request_url = site_url+'/publish-pages?&date='+search_date;
		window.location = request_url;
	});
</script>
<?php $__env->stopPush(); ?>

<?php echo $__env->make('layouts.app', array_except(get_defined_vars(), array('__data', '__path')))->render(); ?>