<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<html lang="en">

<head>

<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">

<title>Login - My pLace</title>

<!-- Bootstrap Core CSS -->
<link href="/dan-o/assets-s/css/bootstrap.min.css" rel="stylesheet">

<!-- Custom CSS -->
<link href="/dan-o/assets-s/css/stylish-portfolio.css" rel="stylesheet">

<!-- Custom Fonts -->
<link href="/dan-o/assets-s/font-awesome/css/font-awesome.min.css"
	rel="stylesheet" type="text/css">
<link
	href="http://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,700,300italic,400italic,700italic"
	rel="stylesheet" type="text/css">

</head>

<body>
	<header id="top" class="header">
		<div class="text-vertical-center">
			<div class="container">
				<div class="row">
					<div class="col-md-4 col-md-push-7 phone-preview">
						<div class="iphone-mockup"></div>
					</div>
					<div class="col-md-6 col-md-offset-2 col-md-pull-3 get-it">
						<h1>My pLace Entertainment</h1>
						<form class="form-horizontal">
							<div class="form-group">
								<div class="col-sm-4">
									<label class="control-label" for="txtEmail"><strong>Email:
									</strong></label>
								</div>
								<div class="col-sm-8">
									<input class="form-control" type="email" name="txtEmail"
										required placeholder="Email/Username" autofocus
										autocomplete="off" inputmode="email" />
								</div>
							</div>
							<div class="form-group">
								<div class="col-md-4">
									<label class="control-label">Password: </label>
								</div>
								<div class="col-md-8">
									<input class="form-control" type="password" name="txtPassword"
										required placeholder="Password" autofocus />
								</div>
							</div>
							<div class="form-group">
							<!-- TODO: Configure links for buttons -->
								<button class="btn btn-default" type="button">Login</button>
								<button class="btn btn-default" type="button">Register </button>
								<button class="btn btn-default" type="button">Continue as Guest</button>
							</div>
						</form>
					</div>
				</div>
			</div>

		</div>
	</header>


	<!-- jQuery -->
	<script src="/dan-o/assets-s/js/jquery.js"></script>

	<!-- Bootstrap Core JavaScript -->
	<script src="/dan-o/assets-s/js/bootstrap.min.js"></script>

</body>

</html>