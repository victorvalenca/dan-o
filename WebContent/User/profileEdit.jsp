<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%
	if (request.getParameter("ID") == null) {
		response.sendRedirect("/dan-o/User/LoginServlet");
	}
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Profile - My pLace</title>
<%@ include file="../Shared/scripts.jsp"%>
</head>
<body>
	<!-- Set up SQL connection -->
	<sql:setDataSource var="snapshot" driver="com.mysql.jdbc.Driver"
		url="jdbc:mysql://localhost:3307/myplace_data" user="root"
		password="Woodpecker99" />
	
	<!-- Fetch Account information -->
	<sql:query dataSource="${snapshot}" var="result"> SELECT ID, FirstName, LastName, Email, ProfilePicture, BackgroundPicture, FacebookID, TwitterID FROM User WHERE ID = ?; 
		<sql:param value='<%=request.getParameter("ID")%>' />
	</sql:query>
	<c:forEach var="row" items="${result.rows}">
		<!-- Header/Navbar -->
		<%@ include file="../Shared/authUserHeader.jsp"%>
		
		<!-- Profile Banner Pane -->
		<div class="container text-center">
			<div class="jumbotron hero">
				<img src="${pageContext.request.contextPath}/assets/img/city_bg.jpg"
					class="img-circle" height="100" width="100" alt="logo">
				<p style="color: white;">
					<c:out value="${row.FirstName}" />
					<c:out value="${row.LastName}" />
				</p>
			</div>
		</div>
		
		<!-- Profile Editing Form -->
		<div class="container">
		<form method='post' action="${pageContext.request.contextPath}/profileEditSubmit">		
				<!--  First/Last name fields -->
				<div class="row"> 
					<div class="col-md-6">
						<div class="form-group">
							<h3 class="panel-title">${txtFN}</h3>
							<input class="form-control" type="text" name="fn"
								value="${row.FirstName}">
						</div>
					</div>
					<div class="col-md-6">
						<div class="form-group">
							<h3 class="panel-title">${txtLN}</h3>
							<input class="form-control" type="text" name="ln"
								value="${row.LastName}">
						</div>
					</div>
					<!-- Email field -->
					<div class="col-md-12">
						<div class="form-group">
							<h3 class="panel-title">${txtEmail}</h3>
							<input class="form-control" type="text" name="email" value="${row.Email}">
						</div>
					</div>
				</div>
				
				<!-- Social Media fields -->
				<div class="row">
					<div class="col-md-6">
						<div class="form-group">
							<input class="form-control" type="text" name="fbID"
							<% 	// Null-check on Facebook/Twitter IDs as they're not mandatory fields during sign-up
								if (session.getAttribute("${row.FacebookID}") == null) {
							%>
								placeholder="Facebook ID">
							<%
								} else {
							%>
								value=${row.FacebookID}>
							<%
								}
							%>
						</div>
					</div>
					<div class="col-md-6">
						<div class="form-group">
							<input class="form-control" type="text" name="twID"
							<% 
								if (session.getAttribute("${row.TwitterID}") == null) {
							%>
								placeholder="Twitter ID">
							<%
								} else {
							%>
								value=${row.TwitterID}>
							<%
								}
							%>
						</div>
					</div>
				</div>
				<!-- Password change-->
				<div class="col-md-6">
					<div class="form-group">
						<h3 class="panel-title">${txtPassword}</h3>
						<input class="form-control" type="password" name="passChange" placeholder="${txtPassword}">
					</div>
				</div>
				<!-- Submit Button -->
				<div class="row">
					<div class="col-md-12">
						<div class="row">
							<div class="col-md-3">
								<input class="btn btn-default" type="submit" value="OK"></input>
								<input type="hidden" name="ID"
									value="${row.ID}" /> 
							</div>
						</div>
					</div>
				</div>
			
			<!-- End Form -->	
		</form>
		</div>
	</c:forEach>
	
	<%@ include file="../Shared/footer.jsp"%>
</body>
</html>