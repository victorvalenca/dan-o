<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<% if(request.getSession().getAttribute("name")!=null){ response.sendRedirect("/dan-o/User/profile.jsp?ID="+request.getSession().getAttribute("UserID")); }%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>User Main - My pLace</title>
<%@ include file="../Shared/scripts.jsp"%>
</head>
<body>
	<%@ include file="../Shared/preAuthUserHeader.jsp"%>
	<div class="jumbotron hero">
		<div class="container">
			<div class="row">
				<div class="col-md-6"></div>
				<div class="col-md-6">
					<h2 style="color:white;">
						<strong>${infoLn4}</strong>
					</h2>
					<p style="color:white;">${infoLn5}</p>
				</div>
			</div>
			<div class="row">
				<div class="col-md-6">
					<div class="row">
						<div class="col-md-12">
							<h3 style="color:white;">
								<strong> ${infoLnT}</strong>
							</h3>
							<p style="color:white;">
								<span class="glyphicon glyphicon-eye-open"></span> ${infoLn1}
							</p >
							<p style="color:white;">
								<span class="glyphicon glyphicon-user"></span> ${infoLn2}
							</p>
							<p style="color:white;">
								<span class="glyphicon glyphicon-list-alt"></span> ${infoLn3}
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
										placeholder="${txtFN}">
								</div>
							</div>
							<div class="col-md-6">
								<div class="form-group">
									<input class="form-control" type="text" placeholder="${txtLN}">
								</div>
							</div>
						</div>
						<div class="row">
							<div class="col-md-12">
								<div class="form-group">
									<input class="form-control" type="text" placeholder="${txtEmail}">
								</div>
							</div>
						</div>
						<div class="row">
							<div class="col-md-12">
								<div class="form-group">
									<input class="form-control" type="text"
										placeholder="${txtREmail}">
								</div>
							</div>
						</div>
						<div class="row">
							<div class="col-md-12">
								<div class="form-group">
									<input class="form-control" type="text"
										placeholder="${txtPassword}">
								</div>
								<div class="row">
									<div class="col-md-12">
										<button class="btn btn-default" type="button"> ${btnSignIn} </button>
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