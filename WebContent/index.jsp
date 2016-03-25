<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Splash - My pLace</title>
<%@ include file="../Shared/scripts.jsp"%>
</head>
<body>
	<%@ include file="../Shared/blankHeader.jsp"%>
	<div class="jumbotron hero">
		<div class="container">
			<div class="row">
				<div class="col-md-4 col-md-push-7 phone-preview">
					<div class="iphone-mockup">
						<div class="screen"></div>
					</div>
				</div>
				<div class="col-md-12 get-it">
					<h1 class="text-center">My pLace Entertainment</h1>
					<p class="text-center">Welcome to My pLace Entertainment! How
						can we help you?</p>
					<p class="text-center">
						<a class="btn btn-primary btn-lg" role="button"
							href="/dan-o/User/main.jsp">Welcome<i
							class="glyphicon glyphicon-chevron-right"></i>
						</a>
						<!--  <a class="btn btn-success btn-lg" role="button"
							href="/dan-o/Organization/main.jsp">I am an
							Organization <i class="glyphicon glyphicon-chevron-right"></i>
						</a>-->
					</p>
				</div>
			</div>
		</div>
	</div>
	<%@ include file="../Shared/footer.jsp"%>
</body>
</html>