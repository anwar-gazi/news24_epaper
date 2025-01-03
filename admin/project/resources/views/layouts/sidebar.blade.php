

<aside class="main-sidebar">
	<!-- sidebar: style can be found in sidebar.less -->
	<section class="sidebar">
		<!-- Sidebar user panel -->
		<div class="user-panel">
			<div class="pull-left image">
				@if(!empty(\Auth::user()->user_image))
				<img src="{{asset('assets/images/avatars/'.\Auth::user()->user_image)}}" class="img-circle" alt="User Image">
				@else
				<img src="{{asset('assets/images/avatars/default_avatar.png')}}" class="img-circle" alt="User Image">
				@endif
			</div>
			<div class="pull-left info">
				<p>{{\Auth::user()->name}}</p>
				<a href="#"><i class="fa fa-circle text-success"></i> Online</a>
			</div>
		</div>
		
		<!-- sidebar menu: : style can be found in sidebar.less -->
		<ul class="sidebar-menu">
			
			<li class="header">ePaper Operator Controls</li>
			<li class="{{ Request::is('home') ? 'active' : '' }}">
				<a href="{{url('/home')}}">
					<i class="fa fa-dashboard"></i> <span>Dashboard</span>
				</a>
			</li>

			<li class="{{ Request::is('manage-category') ? 'active' : '' }}">
				<a href="{{url('/manage-category')}}">
					<i class="fa fa-list"></i> <span>Manage Categories</span>
				</a>
			</li>

			<!-- <li class="{{ Request::is('manage-edition') ? 'active' : '' }}">
				<a href="{{url('/manage-edition')}}">
					<i class="fa fa-adjust"></i> <span>Manage Editions</span>
				</a>
			</li> -->

			<li class="{{ Request::is('manage-pages') || (Route::currentRouteName()=='Image Mapping') ? 'active' : '' }}">
				<a href="{{url('/manage-pages')}}">
					<i class="fa fa-picture-o"></i> <span>Manage Pages </span>
				</a>
			</li>

			<li class="{{ Request::is('publish-pages') ? 'active' : '' }}">
				<a href="{{url('/publish-pages')}}">
					<i class="fa fa-eye"></i> <span>Publish Pages </span>
				</a>
			</li>


			@if(Auth::user()->role == 'admin')
			<li class="header">ePaper Admin Controls</li>

			<li class="{{ Request::is('manage-advertisements') ? 'active' : '' }}">
				<a href="{{url('/manage-advertisements')}}">
					<i class="fa fa-bullhorn"></i> <span>Manage Advertisements </span>
				</a>
			</li>

			<li class="{{ Request::is('manage-users') ? 'active' : '' }}">
				<a href="{{url('/manage-users')}}">
					<i class="fa fa-users"></i> <span>Manage Users </span>
				</a>
			</li>
				<li class="{{ Request::is('details') ? 'active' : '' }}">
				<a href="{{url('/details')}}">
					<i class="fa fa-edit"></i> <span>E-information</span>
				</a>
			</li>
			@endif


		</ul>
	</section>
	<!-- /.sidebar -->
</aside>