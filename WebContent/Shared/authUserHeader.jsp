<nav class="navbar navbar-default">
	<div class="container">
		<div class="navbar-header">
			<a class="navbar-brand navbar-link" href="${pageContext.request.contextPath}/index.jsp"><span
				class="glyphicon glyphicon-home"></span> My pLace</a>
			<button class="navbar-toggle collapsed" data-toggle="collapse"
				data-target="#navcol-1">
				<span class="sr-only">Toggle navigation</span><span class="icon-bar"></span><span
					class="icon-bar"></span><span class="icon-bar"></span>
			</button>
		</div>
		<div class="collapse navbar-collapse" id="navcol-1">
			<ul class="nav navbar-nav">
				<li role="presentation"><a
					href="${pageContext.request.contextPath}/about.jsp">About </a></li>
				<li role="presentation"><a
					href="${pageContext.request.contextPath}/Organization/main.jsp">Organization
				</a></li>
				<li role="presentation"><a
					href="${pageContext.request.contextPath}/Event/list.jsp">Events
				</a></li>
				<li role="presentation"><a
					href="${pageContext.request.contextPath}/account.jsp">Settings
				</a></li>
			</ul>
			<form action="${pageContext.request.contextPath}/logoutServlet"
				method="post">
				<ul class="nav navbar-nav navbar-right">
					<li role="presentation"><a href="${pageContext.request.contextPath}/User/profile.jsp?ID=<%=session.getAttribute("UserID")%>"> <img
							class="img-circle"
							src="${pageContext.request.contextPath}/assets/img/city_bg.jpg"
							width="25" height="25">&nbsp;&nbsp;<%=session.getAttribute("name")%></a>
					</li>
					<li role="presentation"><input
						class="btn btn-link glyphicon glyphicon-log-out" type="submit"
						value="Logout" /><i class="glyphicon glyphicon-log-out"></i></li>
				</ul>
			</form>
		</div>
	</div>
</nav>