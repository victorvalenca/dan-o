<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>


<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Details - My pLace</title>
<%@ include file="../Shared/scripts.jsp"%>
</head>
<body>
	<sql:setDataSource var="snapshot" driver="com.mysql.jdbc.Driver"
		url="jdbc:mysql://localhost:3307/myplace_data" user="root"
		password="Woodpecker99" />
	<sql:query dataSource="${snapshot}" var="result"> SELECT * from Event Where ID = ?; <sql:param
			value='<%=request.getParameter("ID")%>' />
	</sql:query>
	<%@ include file="../Shared/authUserHeader.jsp"%>
	<c:forEach var="row" items="${result.rows}">
		<sql:query dataSource="${snapshot}" var="countA"> select count(*) from UserInterest where Event_ID = ? And InterestLevel_ID = 2; <sql:param
				value="${row.ID}" />
		</sql:query>
		<sql:query dataSource="${snapshot}" var="countI"> select count(*) from UserInterest where Event_ID = ? And InterestLevel_ID = 3; <sql:param
				value="${row.ID}" />
		</sql:query>
		<sql:query dataSource="${snapshot}" var="countN"> select count(*) from UserInterest where Event_ID = ? And InterestLevel_ID = 4; <sql:param
				value="${row.ID}" />
		</sql:query>
		<sql:query dataSource="${snapshot}" var="resultA"> select User_ID from UserInterest where Event_ID = ? And InterestLevel_ID = 2; <sql:param
				value="${row.ID}" />
		</sql:query>
		<sql:query dataSource="${snapshot}" var="resultI"> select User_ID from UserInterest where Event_ID = ? And InterestLevel_ID = 3; <sql:param
				value="${row.ID}" />
		</sql:query>
		<sql:query dataSource="${snapshot}" var="result1"> SELECT Name from Organization where ID = ?; <sql:param
				value="${row.Organization_ID}" />
		</sql:query>
		<sql:query dataSource="${snapshot}" var="result3"> SELECT FirstName, LastName from User where ID = ?; <sql:param
				value="${resultI.rowsByIndex[0][0]}" />
		</sql:query>
		<div class="container text-center">
			<div class="jumbotron hero">
				<img src="${pageContext.request.contextPath}/assets/img/city_bg.jpg"
					class="img-circle" height="100" width="100" alt="logo">
				<p style="color: white;">
					<c:out value="${row.Name}" />
					<br />
					<c:out value="${result1.rowsByIndex[0][0]}" />
				</p>
				<span class="label label-success">${going}: <c:out
						value='${countA.rowsByIndex[0][0]}' /></span> <span
					class="label label-info">${interested}: <c:out
						value='${countI.rowsByIndex[0][0]}' /></span> <span
					class="label label-danger">${ngoing}: <c:out
						value='${countN.rowsByIndex[0][0]}' /></span>
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
											<h3 class="panel-title">${eventInfo}</h3>
										</div>
										<div class="panel-body">
											<p>
												<c:out value="${row.Address1}" />
												<br />
												<c:out value="${row.City}" />
												,
												<c:out value="${row.Province}" />
												<br />
												<c:out value="${row.PostalCode}" />
												<c:out value="${row.Country}" />
											</p>
											<a class="btn btn-link btn-xs" role="button" href="#">${editInfo}</a>
											<a class="btn btn-link btn-xs" role="button" href="#">${evtPic}</a>
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
									<h3 class="panel-title">${eventDetails}:</h3>
								</div>
								<div class="panel-body">
									<div class="row">
										<div class="col-md-12">
											<p>
												${description}:
												<c:out value="${row.Description}" />
											</p>
											<br />
											<p>
												${date}:
												<fmt:formatDate type="both" dateStyle="long"
													value="${row.DateOfEvent}" />
											</p>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-md-12">
							<div class="panel panel-default">
								<div class="panel-heading">
									<h3 class="panel-title">${attending }:</h3>
								</div>
								<div class="panel-body">
									<div class="row">
										<div class="col-md-12">
											<form
												action="${pageContext.request.contextPath}/userProfileServlet">
												<c:forEach var="row" items="${resultA.rows}">
													<sql:query dataSource="${snapshot}" var="result2"> SELECT FirstName from User where ID = ?; <sql:param
															value="${row.User_ID}" />
													</sql:query>
													<div class="col-md-1 text-center">
														<img
															src="${pageContext.request.contextPath}/assets/img/city_bg.jpg"
															class="img-circle" height="50" width="50" alt="logo">
														<p>
															<input class="btn btn-link" type="submit"
																value="${result2.rowsByIndex[0][0]}" /> <input
																type="hidden" name="param_no" value="${row.User_ID}" />
														</p>
													</div>
												</c:forEach>
											</form>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="panel panel-default">
						<div class="panel-heading">
							<h3 class="panel-title">${interestedI}:</h3>
						</div>
						<div class="panel-body">
							<div class="row">
								<div class="col-md-12">
									<form
										action="${pageContext.request.contextPath}/userProfileServlet">
										<c:forEach var="row" items="${resultI.rows}">
											<sql:query dataSource="${snapshot}" var="result3"> SELECT FirstName, LastName from User where ID = ?; <sql:param
													value="${row.User_ID}" />
											</sql:query>
											<div class="col-md-1 text-center">
												<img
													src="${pageContext.request.contextPath}/assets/img/city_bg.jpg"
													class="img-circle" height="50" width="50" alt="logo">
												<p>
													<input class="btn btn-link" type="submit"
														value="${result3.rowsByIndex[0][0]}" /> <input
														type="hidden" name="param_no" value="${row.User_ID}" />
												</p>

											</div>
										</c:forEach>
									</form>
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