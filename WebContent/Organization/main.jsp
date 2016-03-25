<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
						<strong>Manage Organizations</strong>
					</h2>
					<p style="color: white;">It's easy and always will be.</p>
				</div>
			</div>
			<div class="row">
				<div class="col-md-6">
					<div class="row">
						<div class="col-md-12">
							<h3 style="color: white;">
								<strong>Connect your business events with consumers
									around you! </strong>
							</h3>
							<p style="color: white;">
								<span class="glyphicon glyphicon-plus"></span> Create Events and
								provide Updates
							</p>
							<p style="color: white;">
								<span class="glyphicon glyphicon-user"></span> Share Events on
								your profile
							</p>
							<p style="color: white;">
								<span class="glyphicon glyphicon-list-alt"></span> Set Guest
								List and receive RSVP
							</p>
						</div>
					</div>
				</div>
				<sql:query dataSource="${snapshot}" var="result"> SELECT Organization_ID from User_Has_Organization Where User_ID = ?; <sql:param
						value="3" />
				</sql:query>
				<div class="col-md-6">
					<c:forEach var="row" items="${result.rows}">
						<sql:query dataSource="${snapshot}" var="result2"> SELECT Name from Organization where ID = ?; <sql:param
								value="9" />
						</sql:query>
						<div class="container text-center">
							<img src="/dan-o/assets/img/city_bg.jpg" class="img-circle"
								height="100" width="100" alt="logo">
							<p>
								<a
									href="/dan-o/Organization/profile.jsp?ID=${row.Organization_ID}"
									style="color: white"><c:out
										value="${result2.rowsByIndex[0][0]}" /></a>
							</p>
						</div>
					</c:forEach>
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