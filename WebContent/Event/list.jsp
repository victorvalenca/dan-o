<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<% if(request.getSession().getAttribute("name")==null){ response.sendRedirect("/dan-o/User/main.jsp"); }%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Event List - My pLace</title>
<%@ include file="../Shared/scripts.jsp"%>
</head>
<body>

	<%@ include file="../Shared/authUserHeader.jsp"%>
	
	<div class="container">
		<h2>Event List</h2>
		<hr>
		<div class="row">
			<div class="col-md-3">
				<div class="panel panel-default">
					<div class="panel-heading">
						<h3 class="panel-title">Commands:</h3>
					</div>
					<div class="panel-body">
						<form action="searchServlet" method="post">
							<p>Page Size</p>
							<div class="form-group">
								<input type="radio" name="searchType" value="title">
								Title<br> <input type="radio" name="searchType"
									value="notes"> Notes
							</div>
							<div class="form-group">
								<input class="form-control" type="text" placeholder="Search">
							</div>
							<div class="form-group">
								<button class="btn btn-default" type="submit" value="Search">Search</button>
							</div>
						</form>
					</div>
				</div>
			</div>
			<div class="col-md-9">
				<sql:setDataSource var="snapshot" driver="com.mysql.jdbc.Driver"
					url="jdbc:mysql://localhost:3307/myplace_data" user="root"
					password="Woodpecker99" />

				<sql:query dataSource="${snapshot}" var="result"> SELECT * from Event; </sql:query>

				<div class="row">
					<%
						int ctr = 0;
					%>
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
						<sql:query dataSource="${snapshot}" var="result1"> SELECT Name from Organization where ID = ?; <sql:param
								value="${row.Organization_ID}" />
						</sql:query>

						<%
							if ((ctr % 3) == 0) {
						%>
					
				</div>
				<div class="row">
					<%
						}
							ctr++;
					%>

					<div class="thumbnail col-md-4">
						<img
							src="${pageContext.request.contextPath}/assets/img/city_bg.jpg"
							alt="...">
						<div class="caption">
							<h3>
								<a href="details.jsp?ID=${row.ID}"><c:out
										value="${row.Name}" /></a>
							</h3>
							<p>
								Hosted By:
								<c:out value='${result1.rowsByIndex[0][0]}' />
							</p>
							<p>
								Event Date:
								<fmt:formatDate type="date" dateStyle="long"
									value="${row.DateOfEvent}" />
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
	<%@ include file="../Shared/footer.jsp"%>
</body>
</html>