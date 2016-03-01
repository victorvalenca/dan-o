<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Organization - My pLace</title>
<%@ include file="../Shared/scripts.jsp"%>
</head>
<body>
	<%@ include file="../Shared/header.jsp"%>
	<br />
	<div class="container text-center">
		<div class="col-sm-12">
			<div class="jumbotron hero">
				<p>Some Company Profile</p>
				<img src="/dan-o/assets/img/city_bg.jpg" class="img-circle" height="65" width="65" alt="logo">
			</div>
			
			<div class="row">
				<div class="col-sm-12">
					<div class="panel panel-default text-left">
						<div class="panel-body">
							<p>Organization Info</p>
							<button type="button" class="btn btn-default btn-sm">
								<span class="glyphicon glyphicon-thumbs-up"></span> Follow
							</button>
						</div>
					</div>
				</div>
			</div>

			<div class="row">
				<div class="col-sm-6 col-md-4">
					<div class="thumbnail">
						<img src="/dan-o/assets/img/city_bg.jpg" alt="...">
						<div class="caption">
							<h3>Event 1</h3>
							<p>Just Forgot that I had to mention something about someone
								to someone about how I forgot something, but now I forgot it.
								Ahh, forget it! Or wait. I remember.... no I don't.</p>
							<p>
								<a href="#" class="btn btn-primary" role="button">Details</a> 
								<a href="#" class="btn btn-default" role="button">Follow</a>
							</p>
						</div>
					</div>
				</div>
				<div class="col-sm-6 col-md-4">
					<div class="thumbnail">
						<img src="/dan-o/assets/img/city_bg.jpg" alt="...">
						<div class="caption">
							<h3>Event 2</h3>
							<p>Just Forgot that I had to mention something about someone
								to someone about how I forgot something, but now I forgot it.
								Ahh, forget it! Or wait. I remember.... no I don't.</p>
							<p>
								<a href="#" class="btn btn-primary" role="button">Details</a> 
								<a href="#" class="btn btn-default" role="button">Follow</a>
							</p>
						</div>
					</div>
				</div>
				<div class="col-sm-6 col-md-4">					
					<div class="thumbnail">
						<img src="/dan-o/assets/img/city_bg.jpg" alt="...">
						<div class="caption">
							<h3>Event 3</h3>
							<p>Just Forgot that I had to mention something about someone
								to someone about how I forgot something, but now I forgot it.
								Ahh, forget it! Or wait. I remember.... no I don't.</p>
							<p>
								<a href="#" class="btn btn-primary" role="button">Details</a> 
								<a href="#" class="btn btn-default" role="button">Follow</a>
							</p>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<%@ include file="../Shared/footer.jsp"%>
</body>
</html>