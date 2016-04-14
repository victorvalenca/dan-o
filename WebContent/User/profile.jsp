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
	<sql:setDataSource var="snapshot" driver="com.mysql.jdbc.Driver"
		url="jdbc:mysql://localhost:3307/myplace_data" user="root"
		password="Woodpecker99" />
	<sql:query dataSource="${snapshot}" var="result"> SELECT * from User Where ID = ?; <sql:param
			value='<%=request.getParameter("ID")%>' />
	</sql:query>
	<%@ include file="../Shared/authUserHeader.jsp"%>
	<c:forEach var="row" items="${result.rows}">
		<sql:query dataSource="${snapshot}" var="result1"> SELECT Name from UserPrivilege Where ID = ?; <sql:param
				value="${row.UserPrivilege_ID}" />
		</sql:query>
		<sql:query dataSource="${snapshot}" var="countA"> select count(*) from UserInterest where User_ID = ? And InterestLevel_ID = 2; <sql:param
				value="${row.ID}" />
		</sql:query>
		<sql:query dataSource="${snapshot}" var="countI"> select count(*) from UserInterest where User_ID = ? And InterestLevel_ID = 3; <sql:param
				value="${row.ID}" />
		</sql:query>
		<sql:query dataSource="${snapshot}" var="countAt"> select count(*) from UserInterest where User_ID = ? And InterestLevel_ID = 1; <sql:param
				value="${row.ID}" />
		</sql:query>

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
		<div class="container">
			<div class="row">
				<div class="col-md-3">
					<div class="row">
						<div class="col-md-12">
							<div class="row">
								<div class="col-md-12">
									<div class="panel panel-default">
										<div class="panel-heading">
											<h3 class="panel-title">${information}</h3>
										</div>
										<div class="panel-body">
											<p>
												<c:out value="${row.Email}" />
											</p>
											<p>
												<c:out value="${result1.rowsByIndex[0][0]}" />
												User
											</p>
											<form action="${pageContext.request.contextPath}/ProfileEditServlet">
												<input class="btn btn-link btn-xs" type="submit"
													value="${einformation}"></input>
												<input type="hidden" name="ID"
															value="${row.ID}" /> 
												<!-- Can merge this into button above and place these options in Edit Page -->
												<br /> <a class="btn btn-link btn-xs" role="button" href="#">${proPic}</a>
												<br /> <a class="btn btn-link btn-xs" role="button" href="#">${bacPic}</a>
											</form>
										</div>
									</div>
									<div class="panel panel-default">
										<div class="panel-heading">
											<h3 class="panel-title">
												<i class="fa fa-facebook"></i>Facebook
											</h3>
										</div>
										<div class="panel-body">
											<span>${facebook}</span>
										</div>
									</div>
									<div class="panel panel-default">
										<div class="panel-heading">
											<h3 class="panel-title">
												<i class="fa fa-twitter"></i>Twitter
											</h3>
										</div>
										<div class="panel-body">
											<span>${twitter}</span>
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
									<h3 class="panel-title">
										${attending}
										<c:out value='${countA.rowsByIndex[0][0]}' />
										${event}(s):
									</h3>
								</div>
								<div class="panel-body">
									<sql:query dataSource="${snapshot}" var="result0"> select Event_ID from UserInterest where User_ID = ? And InterestLevel_ID = 2; <sql:param
											value="${row.ID}" />
									</sql:query>
									<form
										action="${pageContext.request.contextPath}/eventDetailsServlet">
										<c:forEach var="row1" items="${result0.rows}">
											<sql:query dataSource="${snapshot}" var="result1"> select ID, Organization_ID, Name, DateOfEvent from Event where ID = ?; <sql:param
													value="${row1.Event_ID}" />
											</sql:query>
											<sql:query dataSource="${snapshot}" var="result2"> SELECT Name from Organization where ID = ?; <sql:param
													value="${result1.rowsByIndex[0][1]}" />
											</sql:query>
											<div class="thumbnail col-md-4">
												<img
													src="${pageContext.request.contextPath}/assets/img/city_bg.jpg"
													alt="...">
												<div class="caption">
													<h3>
														<input class="btn btn-link" type="submit"
															value="${result1.rowsByIndex[0][2]}" /> <input
															type="hidden" name="param_no"
															value="${result1.rowsByIndex[0][0]}" />
													</h3>
													<p>
														${hosted} :
														<c:out value='${result2.rowsByIndex[0][0]}' />
													</p>
													<p>
														${date}:
														<fmt:formatDate type="date" dateStyle="long"
															value="${result1.rowsByIndex[0][3]}" />
													</p>
												</div>
											</div>
										</c:forEach>
									</form>
								</div>
							</div>
							<div class="panel panel-default">
								<div class="panel-heading">
									<h3 class="panel-title">
										${interested}
										<c:out value='${countI.rowsByIndex[0][0]}' />
										${event}(s):
									</h3>
								</div>
								<div class="panel-body">
									<sql:query dataSource="${snapshot}" var="result0"> select Event_ID from UserInterest where User_ID = ? And InterestLevel_ID = 3; <sql:param
											value="${row.ID}" />
									</sql:query>
									<form
										action="${pageContext.request.contextPath}/eventDetailsServlet">
										<c:forEach var="row1" items="${result0.rows}">
											<sql:query dataSource="${snapshot}" var="result1"> select ID, Organization_ID, Name, DateOfEvent from Event where ID = ?; <sql:param
													value="${row1.Event_ID}" />
											</sql:query>
											<sql:query dataSource="${snapshot}" var="result2"> SELECT Name from Organization where ID = ?; <sql:param
													value="${result1.rowsByIndex[0][1]}" />
											</sql:query>
											<div class="thumbnail col-md-4">
												<img
													src="${pageContext.request.contextPath}/assets/img/city_bg.jpg"
													alt="...">
												<div class="caption">
													<h3>
														<input class="btn btn-link" type="submit"
															value="${result1.rowsByIndex[0][2]}" /> <input
															type="hidden" name="param_no"
															value="${result1.rowsByIndex[0][0]}" />
													</h3>
													<p>
														${hosted}:
														<c:out value='${result2.rowsByIndex[0][0]}' />
													</p>
													<p>
														${date}:
														<fmt:formatDate type="date" dateStyle="long"
															value="${result1.rowsByIndex[0][3]}" />
													</p>
												</div>
											</div>
										</c:forEach>
									</form>
								</div>
							</div>
							<div class="panel panel-default">
								<div class="panel-heading">
									<h3 class="panel-title">
										${attended}
										<c:out value="${countAt.rowsByIndex[0][0]}" />
										${event}(s):
									</h3>
								</div>
								<div class="panel-body">
									<sql:query dataSource="${snapshot}" var="result0"> select Event_ID from UserInterest where User_ID = ? And InterestLevel_ID = 1; <sql:param
											value="${row.ID}" />
									</sql:query>
									<form
										action="${pageContext.request.contextPath}/eventDetailsServlet">
										<c:forEach var="row2" items="${result0.rows}">
											<sql:query dataSource="${snapshot}" var="result1"> select ID, Organization_ID, Name, DateOfEvent from Event where ID = ?; <sql:param
													value="${row2.Event_ID}" />
											</sql:query>
											<sql:query dataSource="${snapshot}" var="result2"> SELECT Name from Organization where ID = ?; <sql:param
													value="${result1.rowsByIndex[0][1]}" />
											</sql:query>
											<div class="thumbnail col-md-4">
												<img
													src="${pageContext.request.contextPath}/assets/img/city_bg.jpg"
													alt="...">
												<div class="caption">
													<h3>
														<input class="btn btn-link" type="submit"
															value="${result1.rowsByIndex[0][2]}" /> <input type="hidden"
															name="param_no" value="${result1.rowsByIndex[0][0]}" />
													</h3>
													<p>
														${hosted}:
														<c:out value='${result2.rowsByIndex[0][0]}' />
													</p>
													<p>
														${date}:
														<fmt:formatDate type="date" dateStyle="long"
															value="${result1.rowsByIndex[0][3]}" />
													</p>
												</div>
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