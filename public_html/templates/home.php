<section class="welcome">
	<div class="jumbotron text-center home">
			<div class="container-fluid">
			<h1>Welcome to Growify!</h1>
			<p class="lead">This is an app for supplying growing information for home gardeners!</p>
			<!--<a routerLink="/weather">Weather</a>-->
		</div>
		<div>
			<button type="button" class="btn btn-primary center-block" data-toggle="modal" data-target="#login-modal">Login</button>
			<button type="button" class="btn btn-primary center-block" data-toggle="modal" data-target="#signup-modal">Sign Up</button>
		</div>

	</div>
	<login-component></login-component>
	<signup-component></signup-component>
	<signout-component></signout-component>
</section>

