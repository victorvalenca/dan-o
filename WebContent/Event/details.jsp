<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
			value="1" />
	</sql:query>
	<%@ include file="../Shared/blankHeader.jsp"%>
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
		<div class="container text-center">
			<div class="jumbotron hero">
				<img src="/dan-o/assets/img/city_bg.jpg"
					class="img-circle" height="100" width="100" alt="logo">
				<p style="color: white;">
					<c:out value="${row.Name}" />
				</p>
				<span class="label label-success">Going: <c:out
						value='${countA.rowsByIndex[0][0]}' /></span> <span
					class="label label-info">Maybe: <c:out
						value='${countI.rowsByIndex[0][0]}' /></span> <span
					class="label label-danger">Not Going: <c:out
						value='${countN.rowsByIndex[0][0]}' /></span>
			</div>
		</div>
		<div class="container">
			<div class="panel panel-default">
				<div class="panel-heading">
					<h3 class="panel-title">Event Information</h3>
				</div>
				<div class="panel-body">
					<p>
						<c:out value="${row.Address1}" />
						,
						<c:out value="${row.City}" />
						,
						<c:out value="${row.Province}" />
						,
						<c:out value="${row.PostalCode}" />
						,
						<c:out value="${row.Country}" />
					</p>
				</div>
			</div>
		</div>
	</c:forEach>
	<%@ include file="../Shared/footer.jsp"%>
</body>
</html>