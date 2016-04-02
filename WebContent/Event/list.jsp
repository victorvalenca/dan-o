<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ page import="java.sql.PreparedStatement"  %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.util.logging.Level" %>
<%@ page import="java.util.logging.Logger" %>

<%
	if (request.getSession().getAttribute("name") == null) response.sendRedirect("/dan-o/User/main.jsp");
%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Event List - My pLace</title>
<%@ include file="../Shared/scripts.jsp"%>
</head>
<body>
	<%@ include file="../Shared/authUserHeader.jsp"%>
	<div class="container">
		<h2>${title}</h2>
		<hr>
		<div class="row">
			<div class="col-md-3">
				<div class="panel panel-default">
					<div class="panel-heading">
						<h3 class="panel-title">${commands}:</h3>
					</div>
					<div class="panel-body">
						<form action="searchServlet" method="post">
							<p>${pagesz}</p>
							<div class="form-group">
								<input type="radio" name="searchType" value="title">
								${lblTitle}<br> <input type="radio" name="searchType"
									value="notes"> ${lblNotes}
							</div>
							<div class="form-group">
								<input class="form-control" type="text" placeholder="${search}">
							</div>
							<div class="form-group">
								<button class="btn btn-default" type="submit" value="Search">${search}</button>
							</div>
						</form>
					</div>
				</div>
			</div>
			<div class="col-md-9">
				<sql:setDataSource var="snapshot" driver="com.mysql.jdbc.Driver"
					url="jdbc:mysql://localhost:3307/myplace_data" user="root"
					password="Woodpecker99" />
					
					<%
						// retrieve page parameter from URL, if exists; page number is in zero-starting value
						String pageNumString = request.getParameter("page");
						int pageNum = pageNumString != null ? Integer.parseInt(pageNumString) - 1 : 0;	
						
						// minimum and maximum values for page indexing
					 	int indexMin = (pageNum * 9)++;
						int indexMax = indexMin + 8;
					%>

				<sql:query dataSource="${snapshot}" var="result"> SELECT * from Event where ID >= <%=indexMin%> and ID <= <%=indexMax%>; </sql:query>
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

					<form
						action="${pageContext.request.contextPath}/eventDetailsServlet">


						<div class="thumbnail col-md-4">
							<img
								src="${pageContext.request.contextPath}/assets/img/city_bg.jpg"
								alt="...">
							<div class="caption">
								<h3>
									<input class="btn btn-link" type="submit" value="${row.Name}" />
									<input type="hidden" name="param_no" value="${row.ID}" />

								</h3>
								<p>
									${hosted}:
									<c:out value='${result1.rowsByIndex[0][0]}' />
								</p>
								<p>
									${date}:
									<fmt:formatDate type="date" dateStyle="long"
										value="${row.DateOfEvent}" />
								</p>

								<span class="label label-success">${going}: <c:out
										value='${countA.rowsByIndex[0][0]}' /></span> <span
									class="label label-info">${interested}: <c:out
										value='${countI.rowsByIndex[0][0]}' /></span> <span
									class="label label-danger">${ngoing}: <c:out
										value='${countN.rowsByIndex[0][0]}' /></span>
							</div>
						</div>
					</form>
					</c:forEach>
				</div>
				
			  <ul class="pagination pagination-lg">
			     <%
			        // total number of entries in SQL tble
			      	int listItems = 0;
			      	
			      	// request the number of values from database
			      	try {
					//SQL parameters
				      	String sqlStat = "SELECT count(*) from Event";
				     	String url = "jdbc:mysql://localhost:3307/myplace_data";
				        String user = "root";
				        String password = "Woodpecker99";
				        
				        // attempt to establish connection
			      		Connection con = DriverManager.getConnection(url, user, password);
			      		Statement st = con.createStatement();
			      		ResultSet rs = st.executeQuery(sqlStat);

			      		// retrieve value
			                listItems = rs.next() ? Integer.parseInt(rs.getString(1)) : 0;
			                
			      	        // closure of SQL connection
			                try {
			                    if (rs != null) rs.close();
			                    if (st != null)  st.close();
			                    if (con != null) con.close();
			            	} 
			            	catch (SQLException se) {}
			        }
			      	catch (Exception e) {}
			      	
			      	// the page limit of the pagination menu
			      	int totalList = listItems / 9;
			      	
			      	// add an extra page for potential leftovers
			      	totalList += listItems %9 != 0 ? 1 : 0;
			      	
			     	// page check to verify if goto first and goto prev makes sense
			      	if(pageNum < 1) {
			      		%> <li class="disabled"><span>&laquo;</span></li>
			      		<li class="disabled"><span>PREV</span></li> <%
			      	}
			      	else {
			      		%> <li><a href="list.jsp?page=1">&laquo;</a></li> 
			      		<li><a href="list.jsp?page=<%=pageNum%>">PREV</a></li> <%
			      	}
			      	
			     	// list of five, numbers below zero are skipped and stops before limit, if necessary
			      	for (int i = pageNum - 2, j = 0; i < totalList && j < 5; i++, j++) {
			      	
			      		if(i < 0) continue;
			      		
			      		// find active button by association of middle button
			      		else if(j != 2) { 
					      %>
					      	<li><a href="list.jsp?page=<%=i+1%>"><%=i+1%></a></li>
					      <%
			      		}
			      		else {
					      %>
						<li class="active"><span><%=i+1%></span></li>
					      <%
			      		}
			      	}
			      	
			      	// page check to verify if goto next and goto last makes sense
			      	if(pageNum >= (totalList - 1)) {
			      		%> <li class="disabled"><span>NEXT</span></li> 
			      		<li class="disabled"><span>&raquo;</span></li> <%
			      	}
			      	else {
			      		%> <li><a href="list.jsp?page=<%=pageNum+2%>">NEXT</a></li> 
			      		<li><a href="list.jsp?page=<%=totalList%>">&raquo;</a></li> <%
			      	}
			      %>
			  </ul>
			</div>
		</div>
		<%@ include file="../Shared/footer.jsp"%>
</body>
</html>
