@extends('layouts.app')

@section('content')

<!-- messages -->
<section class="content-header">
	<div class="row">
		<div class="col-md-12">
			@if($errors->count() > 0 )

			<div class="alert alert-danger">
				<a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
				<h6>The following errors have occurred:</h6>
				<ul>
					@foreach( $errors->all() as $message )
					<li>{{ $message }}</li>
					@endforeach
				</ul>
			</div>
			@endif

			@if(Session::has('message'))
			<div class="alert alert-info" role="alert">
				<a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
				{{ Session::get('message') }}
			</div> 
			@endif

			@if(Session::has('errormessage'))
			<div class="alert alert-danger" role="alert">
				<a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
				{{ Session::get('errormessage') }}
			</div>
			@endif

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
					<form action="{{url('/up_details')}}" method="post" enctype="multipart/form-data">
						<input type="hidden" name="_token" value="{{csrf_token()}}">

						<strong><i class="fa fa-globe"></i>Epaper Name</strong>

						<p class="text-muted">
							<textarea name="epapper_name"class="form-control">{{$user_info->epapper_name}}</textarea>
						</p>
						
						
												<strong><i class="fa fa-globe"></i>Meta Description</strong>

						<p class="text-muted">
							<textarea name="meta_description"class="form-control">{{$user_info->meta_description}}</textarea>
						</p>
						
						
												<strong><i class="fa fa-globe"></i>Meta Tag</strong>

						<p class="text-muted">
							<textarea name="meta_tag"class="form-control">{{$user_info->meta_tag}}</textarea>
						</p>
						
						
																		<strong><i class="fa fa-facebook"></i>Facebook Link</strong>

						<p class="text-muted">
							<textarea name="facebook"class="form-control">{{$user_info->facebook}}</textarea>
						</p>
						
																								<strong><i class="fa fa-twitter"></i>Twitter Link</strong>

						<p class="text-muted">
							<textarea name="twitter"class="form-control">{{$user_info->twitter}}</textarea>
						</p>
						
						
						
										<strong><i class="fa fa-youtube-play"></i>Youtube Link</strong>

						<p class="text-muted">
							<textarea name="youtube"class="form-control">{{$user_info->youtube}}</textarea>
						</p>
						
						
						
												<strong><i class="fa fa-globe"></i> Online version</strong>

						<p class="text-muted">
							<textarea name="online"class="form-control">{{$user_info->online}}</textarea>
						</p>

						<hr>

						<strong><i class="fa fa-image"></i> Logo</strong>

						<p class="text-muted"><input type="file" name="logo" value="{{$user_info->logo}}" class="form-control"></p>
						<img src="{{url('/assets/images/logo/')}}/{{$user_info->logo}}" width="30%">
		
						<hr>

						<strong><i class="fa fa-level-down"></i> Footer Text</strong>

						<p>
							<textarea name="footer" class="form-control">{{$user_info->footer}}</textarea>
						</p>

						<hr>

						<strong><i class="fa fa-level-down"></i> Copy ritht</strong>

						<p>
							<textarea name="copyright" class="form-control"> {{$user_info->copyright}}</textarea>
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



@endsection