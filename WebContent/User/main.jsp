<%@page import="beans.SessionState"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>User Main - My pLace</title>
<%@ include file="../Shared/scripts.jsp"%>
</head>
<body>

	<%
		if(request.getSession(false) != null && SessionState.getEmail() != null) 
			response.sendRedirect("main.jsp"); 
	%>
	
	<%@ include file="../Shared/preAuthUserHeader.jsp"%>
	<div class="jumbotron hero">
		<div class="container">
			<div class="row">
				<div class="col-md-6"></div>
				<div class="col-md-6">
					<h2 style="color:white;">
						<strong>User Sign Up</strong>
					</h2>
					<p style="color:white;">It's easy and always will be.</p>
				</div>
			</div>
			<div class="row">
				<div class="col-md-6">
					<div class="row">
						<div class="col-md-12">
							<h3 style="color:white;">
								<strong>Connect yourself and friends to events around
									you!</strong>
							</h3>
							<p style="color:white;">
								<span class="glyphicon glyphicon-eye-open"></span> See Upcoming Events and Get
								Updates
							</p >
							<p style="color:white;">
								<span class="glyphicon glyphicon-user"></span> Share Events on your profile
							</p>
							<p style="color:white;">
								<span class="glyphicon glyphicon-list-alt"></span> Beat the Guest list
							</p>
						</div>
					</div>
				</div>
				<div class="col-md-6">
					<form>
						<div class="row">
							<div class="col-md-6">
								<div class="form-group">
									<input class="form-control" type="text"
										placeholder="First name">
								</div>
							</div>
							<div class="col-md-6">
								<div class="form-group">
									<input class="form-control" type="text" placeholder="Last name">
								</div>
							</div>
						</div>
						<div class="row">
							<div class="col-md-12">
								<div class="form-group">
									<input class="form-control" type="text" placeholder="Email">
								</div>
							</div>
						</div>
						<div class="row">
							<div class="col-md-12">
								<div class="form-group">
									<input class="form-control" type="text"
										placeholder="Re-Enter email">
								</div>
							</div>
						</div>
						<div class="row">
							<div class="col-md-12">
								<div class="form-group">
									<input class="form-control" type="text"
										placeholder="New Password">
								</div>
								<div class="row">
									<div class="col-md-12">
										<button class="btn btn-default" type="button">Sign Up</button>
									</div>
								</div>
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
	<%@ include file="../Shared/footer.jsp"%>
</body>
</html>