<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Profile - My pLace</title>
<%@ include file="../Shared/scripts.jsp"%>
</head>
<body>
	<sql:setDataSource var="snapshot" driver="com.mysql.jdbc.Driver"
		url="jdbc:mysql://localhost:3307/myplace_data" user="root"
		password="Woodpecker99" />
	<sql:query dataSource="${snapshot}" var="result"> SELECT * from Organization Where ID = ?; <sql:param
			value="10" />
	</sql:query>
	<%@ include file="../Shared/authUserHeader.jsp"%>
	<c:forEach var="row" items="${result.rows}">
		<div class="container text-center">
			<div class="jumbotron hero">
				<img src="/dan-o/assets/img/city_bg.jpg" class="img-circle"
					height="100" width="100" alt="logo">
				<p style="color: white;">
					<c:out value="${row.Name}" />
				</p>
			</div>
		</div>
		<div class="container">
			<div class="panel panel-default">
				<div class="panel-heading">
					<div class="row">
						<div class="col-md-5">
							<h3 class="panel-title">Organization Information</h3>
						</div>
						<div class="col-md-7">
							<div class="btn-group" role="group">
								<button class="btn btn-default btn-xs" type="button">Edit
									Information</button>
								<button class="btn btn-default btn-xs" type="button">Change
									Profile Picture</button>
								<button class="btn btn-default btn-xs" type="button">Change
									Background Picture</button>
							</div>
						</div>
					</div>
				</div>
				<div class="panel-body">
					<br />
					<p>
						<c:out value="${row.Address1}" />
						<c:out value="${row.Address2}" />
						,
						<c:out value="${row.City}" />
						,
						<c:out value="${row.Province}" />
						,
						<c:out value="${row.PostalCode}" />
						,
						<c:out value="${row.Country}" />
					</p>
					<br />
					<p>
						<c:out value="${row.WebsiteURL}" />
					</p>
				</div>
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
									<div class="row">
										<div class="col-md-10">
											<h3 class="panel-title">Our Events</h3>
										</div>
										<div class="col-md-2">
											<button class="btn btn-success btn-xs" type="button">Create
												Event</button>
										</div>
									</div>
								</div>
								<div class="panel-body">
									<br />
									<sql:query dataSource="${snapshot}" var="result"> SELECT * from Event where Organization_ID = ?; <sql:param
											value="${row.ID}" />
									</sql:query>
									<c:forEach var="row1" items="${result.rows}">
										<sql:query dataSource="${snapshot}" var="countA"> select count(*) from UserInterest where Event_ID = ? And InterestLevel_ID = 2; <sql:param
												value="${row1.ID}" />
										</sql:query>
										<sql:query dataSource="${snapshot}" var="countI"> select count(*) from UserInterest where Event_ID = ? And InterestLevel_ID = 3; <sql:param
												value="${row1.ID}" />
										</sql:query>
										<sql:query dataSource="${snapshot}" var="countN"> select count(*) from UserInterest where Event_ID = ? And InterestLevel_ID = 4; <sql:param
												value="${row1.ID}" />
										</sql:query>
										<div class="thumbnail col-md-4">
											<img src="/dan-o/assets/img/city_bg.jpg" alt="...">
											<div class="caption">
												<h3>
													<a href="/dan-o/Event/details.jsp?ID=${row1.ID}"><c:out
															value="${row1.Name}" /></a>
												</h3>
												<p>
													Hosted By:
													<c:out value='${row.Name}' />
												</p>
												<p>
													Event Date:
													<fmt:formatDate type="date" dateStyle="long"
														value="${row1.DateOfEvent}" />
												</p>

												<span class="label label-success">Going: <c:out
														value='${countA.rowsByIndex[0][0]}' /></span> <span
													class="label label-info">Interested: <c:out
														value='${countI.rowsByIndex[0][0]}' /></span> <span
													class="label label-danger">Not Going: <c:out
														value='${countN.rowsByIndex[0][0]}' /></span>
											</div>
										</div>
									</c:forEach>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</c:forEach>
	<%@ include file="../Shared/footer.jsp"%>
</body>
</html>