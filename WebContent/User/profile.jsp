<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Profile - My pLace</title>
<%@ include file="../Shared/scripts.jsp"%>
</head>
<body>
	<%@ include file="../Shared/authUserHeader.jsp"%>
	<div class="container text-center">
		<div class="jumbotron hero">
			<img src="/MypLaceEntertainmentV2/assets/img/city_bg.jpg"
				class="img-circle" height="100" width="100" alt="logo">
			<p style="color: white;">Account Name</p>
		</div>
	</div>
	<div class="container">
		<div class="row">
			<div class="col-md-3">
				<div class="row">
					<div class="col-md-12">
						<div class="row">
							<div class="col-md-12">
								<div class="panel panel-default">
									<div class="panel-heading">
										<h3 class="panel-title">Information</h3>
									</div>
									<div class="panel-body">
										<span>User Information</span><a class="btn btn-link btn-xs"
											role="button" href="#">Edit Information</a><a
											class="btn btn-link btn-xs" role="button" href="#">Change
											Profile Picture</a><a class="btn btn-link btn-xs" role="button"
											href="#">Change Background Picture</a>
									</div>
								</div>
								<div class="panel panel-default">
									<div class="panel-heading">
										<h3 class="panel-title">
											<i class="fa fa-facebook"></i> Facebook
										</h3>
									</div>
									<div class="panel-body">
										<span>Sign In to Facebook to view Feed</span>
									</div>
								</div>
								<div class="panel panel-default">
									<div class="panel-heading">
										<h3 class="panel-title">
											<i class="fa fa-twitter"></i> Twitter
										</h3>
									</div>
									<div class="panel-body">
										<span>Sign In to Twitter to view Feed</span>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="col-md-9">
				<div class="row">
					<div class="col-md-12">
						<div class="panel panel-default">
							<div class="panel-heading">
								<h3 class="panel-title">I'm Attending:</h3>
							</div>
							<div class="panel-body">
								<span>Attending Event Panels</span>
							</div>
						</div>
						<div class="panel panel-default">
							<div class="panel-heading">
								<h3 class="panel-title">I'm Interested in:</h3>
							</div>
							<div class="panel-body">
								<span>Interested Event Panels</span>
							</div>
						</div>
						<div class="panel panel-default">
							<div class="panel-heading">
								<h3 class="panel-title">Event Review</h3>
							</div>
							<div class="panel-body">
								<span>Event Review Panels</span>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<%@ include file="../Shared/footer.jsp"%>
</body>
</html>