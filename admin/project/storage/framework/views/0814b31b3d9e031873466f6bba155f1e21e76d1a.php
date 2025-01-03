

<aside class="main-sidebar">
	<!-- sidebar: style can be found in sidebar.less -->
	<section class="sidebar">
		<!-- Sidebar user panel -->
		<div class="user-panel">
			<div class="pull-left image">
				<?php if(!empty(\Auth::user()->user_image)): ?>
				<img src="<?php echo e(asset('assets/images/avatars/'.\Auth::user()->user_image)); ?>" class="img-circle" alt="User Image">
				<?php else: ?>
				<img src="<?php echo e(asset('assets/images/avatars/default_avatar.png')); ?>" class="img-circle" alt="User Image">
				<?php endif; ?>
			</div>
			<div class="pull-left info">
				<p><?php echo e(\Auth::user()->name); ?></p>
				<a href="#"><i class="fa fa-circle text-success"></i> Online</a>
			</div>
		</div>
		
		<!-- sidebar menu: : style can be found in sidebar.less -->
		<ul class="sidebar-menu">
			
			<li class="header">ePaper Operator Controls</li>
			<li class="<?php echo e(Request::is('home') ? 'active' : ''); ?>">
				<a href="<?php echo e(url('/home')); ?>">
					<i class="fa fa-dashboard"></i> <span>Dashboard</span>
				</a>
			</li>

			<li class="<?php echo e(Request::is('manage-category') ? 'active' : ''); ?>">
				<a href="<?php echo e(url('/manage-category')); ?>">
					<i class="fa fa-list"></i> <span>Manage Categories</span>
				</a>
			</li>

			<!-- <li class="<?php echo e(Request::is('manage-edition') ? 'active' : ''); ?>">
				<a href="<?php echo e(url('/manage-edition')); ?>">
					<i class="fa fa-adjust"></i> <span>Manage Editions</span>
				</a>
			</li> -->

			<li class="<?php echo e(Request::is('manage-pages') || (Route::currentRouteName()=='Image Mapping') ? 'active' : ''); ?>">
				<a href="<?php echo e(url('/manage-pages')); ?>">
					<i class="fa fa-picture-o"></i> <span>Manage Pages </span>
				</a>
			</li>

			<li class="<?php echo e(Request::is('publish-pages') ? 'active' : ''); ?>">
				<a href="<?php echo e(url('/publish-pages')); ?>">
					<i class="fa fa-eye"></i> <span>Publish Pages </span>
				</a>
			</li>


			<?php if(Auth::user()->role == 'admin'): ?>
			<li class="header">ePaper Admin Controls</li>

			<li class="<?php echo e(Request::is('manage-advertisements') ? 'active' : ''); ?>">
				<a href="<?php echo e(url('/manage-advertisements')); ?>">
					<i class="fa fa-bullhorn"></i> <span>Manage Advertisements </span>
				</a>
			</li>

			<li class="<?php echo e(Request::is('manage-users') ? 'active' : ''); ?>">
				<a href="<?php echo e(url('/manage-users')); ?>">
					<i class="fa fa-users"></i> <span>Manage Users </span>
				</a>
			</li>
				<li class="<?php echo e(Request::is('details') ? 'active' : ''); ?>">
				<a href="<?php echo e(url('/details')); ?>">
					<i class="fa fa-edit"></i> <span>E-information</span>
				</a>
			</li>
			<?php endif; ?>


		</ul>
	</section>
	<!-- /.sidebar -->
</aside>