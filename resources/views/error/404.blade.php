@extends('layouts.app')
@section('content')

	<section id="main" class="clearfix text-center">
		<div class="container">
			<div class="row">
				<div class="col-md-10 offset-md-1">
					<div class="found-section section">
						<h1>404</h1>
						<h2>Page Not Found</h2>
						<p>We can't seem to find the page you're looking for.</p>
						<a href="{{ route('home') }}" class="btn btn-primary">Go to Home</a>
					</div>					
				</div>
			</div>
		</div><!-- container -->
	</section><!-- main -->


@endsection

@push('custom_footer_script')
   
@endpush