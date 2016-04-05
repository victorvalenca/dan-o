<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<% if(request.getSession().getAttribute("name")==null){ response.sendRedirect("/dan-o/User/main.jsp"); }%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Main - My pLace</title>
<%@ include file="../Shared/scripts.jsp"%>
</head>
<body>
	<%@ include file="../Shared/authUserHeader.jsp"%>
	<sql:setDataSource var="snapshot" driver="com.mysql.jdbc.Driver"
		url="jdbc:mysql://localhost:3307/myplace_data" user="root"
		password="Woodpecker99" />
	<div class="jumbotron hero">
		<div class="container">
			<div class="row">
				<div class="col-md-6"></div>
				<div class="col-md-6">
					<!-- IF TO DETERMINE IF RECORDS PRESENT AND AUTHENTICATED -->
					<h2 style="color: white;">
						<strong>${infoLn4}</strong>
					</h2>
					<p style="color: white;">${infoLn5}</p>
				</div>
			</div>
			<div class="row">
				<div class="col-md-6">
					<div class="row">
						<div class="col-md-12">
							<h3 style="color: white;">
								<strong>${infoLnT} </strong>
							</h3>
							<p style="color: white;">
								<span class="glyphicon glyphicon-plus"></span> ${infoLn1}
							</p>
							<p style="color: white;">
								<span class="glyphicon glyphicon-user"></span> ${infoLn2}
							</p>
							<p style="color: white;">
								<span class="glyphicon glyphicon-list-alt"></span> ${infoLn3}
							</p>
						</div>
					</div>
				</div>
				<sql:query dataSource="${snapshot}" var="result"> SELECT Organization_ID from User_Has_Organization Where User_ID = ?; <sql:param
						value="3" />
				</sql:query>

				<div class="col-md-6">
					<form
						action="${pageContext.request.contextPath}/orgProfileServlet">
						<c:forEach var="row" items="${result.rows}">
							<sql:query dataSource="${snapshot}" var="result2"> SELECT Name from Organization where ID = ?; <sql:param
									value="9" />
							</sql:query>
							<div class="container text-center">
								<img
									src="${pageContext.request.contextPath}/assets/img/city_bg.jpg"
									class="img-circle" height="100" width="100" alt="logo">
								<p>
									<input class="btn btn-link" type="submit"
										value="${result2.rowsByIndex[0][0]}" /> <input type="hidden"
										name="param_no" value="${row.Organization_ID}" /> 
								</p>
							</div>
						</c:forEach>
					</form>
				</div>

				<!--<div class="col-md-6">
					 <form>
						<div class="row">
							<div class="col-md-12">
								<div class="form-group">
									<input class="form-control" type="text"
										placeholder="Company Name">
								</div>
							</div>
						</div>
						<div class="row">
							<div class="col-md-12">
								<div class="form-group">
									<input class="form-control" type="text" placeholder="Address 1">
								</div>
							</div>
						</div>
						<div class="row">
							<div class="col-md-12">
								<div class="form-group">
									<input class="form-control" type="text" placeholder="Address 2">
								</div>
							</div>
						</div>
						<div class="row">
							<div class="col-md-6">
								<div class="form-group">
									<input class="form-control" type="text" placeholder="City">
								</div>
							</div>
							<div class="col-md-6">
								<div class="form-group">
									<input class="form-control" type="text" placeholder="Province">
								</div>
							</div>
						</div>
						<div class="row">
							<div class="col-md-6">
								<div class="form-group">
									<input class="form-control" type="text"
										placeholder="Postal Code">
								</div>
							</div>
							<div class="col-md-6">
								<div class="form-group">
									<input class="form-control" type="text" placeholder="Country">
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
				</div>-->

			</div>
		</div>
	</div>
	<%@ include file="../Shared/footer.jsp"%>
</body>
</html>