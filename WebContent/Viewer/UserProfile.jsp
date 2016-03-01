<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>User - My pLace</title>
<%@ include file="../Shared/scripts.jsp"%>
</head>
<body>
	<%@ include file="../Shared/header.jsp"%>
	<br />
	<div class="container text-center">
		<div class="col-sm-10">
			<div class="jumbotron hero">
				<p>My Profile</p>
				<img src="/dan-o/assets/img/city_bg.jpg" class="img-circle" height="65" width="65" alt="Avatar">
			</div>

			<div class="row">
				<div class="col-sm-12">
					<div class="panel panel-default text-left">
						<div class="panel-body">
							<p contenteditable="true">Status: Some Text</p>
							<button type="button" class="btn btn-default btn-sm">
								<span class="glyphicon glyphicon-thumbs-up"></span> Like
							</button>
						</div>
					</div>
				</div>
			</div>

			<div class="row">
				<div class="col-sm-3">
					<div class="well">
						<p>John</p>
						<img src="/dan-o/assets/img/city_bg.jpg" class="img-circle" height="55" width="55" alt="Avatar">
					</div>
				</div>
				<div class="col-sm-9">
					<div class="well">
						<p>Just Forgot that I had to mention something about someone
							to someone about how I forgot something, but now I forgot it.
							Ahh, forget it! Or wait. I remember.... no I don't.</p>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-sm-3">
					<div class="well">
						<p>Bo</p>
						<img src="/dan-o/assets/img/city_bg.jpg" class="img-circle" height="55" width="55" alt="Avatar">
					</div>
				</div>
				<div class="col-sm-9">
					<div class="well">
						<p>Just Forgot that I had to mention something about someone
							to someone about how I forgot something, but now I forgot it.
							Ahh, forget it! Or wait. I remember.... no I don't.</p>
					</div>
				</div>
			</div>
		</div>
		<div class="col-sm-2 well">
			<div class="thumbnail">
				<p>Upcoming Events:</p>
				<img src="/dan-o/assets/img/city_bg.jpg" alt="img" width="400" height="300">
				<p>
					<strong>Some Event</strong>
				</p>
				<p>Some Date</p>
				<button class="btn btn-primary">Info</button>
			</div>
			<div class="well">
				<p>Interested in:</p>
			</div>
		</div>
	</div>
	<%@ include file="../Shared/footer.jsp"%>
</body>
</html>