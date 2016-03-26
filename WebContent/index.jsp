<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<% if(request.getSession().getAttribute("name")!=null){ response.sendRedirect("/dan-o/User/profile.jsp?ID="+request.getSession().getAttribute("UserID")); }%>
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
					<form action="localeServlet" method="post" class="form-inline text-center">
						<input type="submit" name="submit" value="English"
							class="btn btn-primary btn-lg" /> <input type="submit"
							name="submit" value="Francais" class="btn btn-success btn-lg" />
					</form>
				</div>
			</div>
		</div>
	</div>
	<%@ include file="../Shared/footer.jsp"%>
</body>
</html>