<nav class="navbar navbar-default">
	<div class="container">
		<div class="navbar-header">
			<form action="${pageContext.request.contextPath}/userProfileServlet">
				<input class="btn btn-link glyphicon glyphicon-home" type="submit"
					value="My pLace" />
			</form>
			<button class="navbar-toggle collapsed" data-toggle="collapse"
				data-target="#navcol-1">
				<span class="sr-only">Toggle navigation</span><span class="icon-bar"></span><span
					class="icon-bar"></span><span class="icon-bar"></span>
			</button>
		</div>
		<div class="collapse navbar-collapse" id="navcol-1">
			<ul class="nav navbar-nav">
				<li role="presentation"><form
						action="${pageContext.request.contextPath}/aboutServlet">
						<input class="btn btn-link" type="submit" value="${about}" />
					</form>
				<li role="presentation"><form
						action="${pageContext.request.contextPath}/orgMainServlet">
						<input class="btn btn-link" type="submit" value="${organization}" />
					</form></li>
				<li role="presentation"><form
						action="${pageContext.request.contextPath}/eventServlet">
						<input class="btn btn-link" type="submit" value="${event}" />
					</form></li>
				<li role="presentation"><form
						action="${pageContext.request.contextPath}/accountServlet">
						<input class="btn btn-link" type="submit" value="${settings}" />
					</form></li>
			</ul>
			<ul class="nav navbar-nav navbar-right">
				<li role="presentation"><form
						action="${pageContext.request.contextPath}/userProfileServlet"
						method="post">
						<img class="img-circle"
							src="${pageContext.request.contextPath}/assets/img/city_bg.jpg"
							width="25" height="25"> <input class="btn btn-link"
							type="submit" value="<%=session.getAttribute("name")%>" /></i>
					</form></li>
				<li role="presentation"><form
						action="${pageContext.request.contextPath}/logoutServlet"
						method="post">
						<input class="btn btn-link" type="submit" value="${logout}" /><i
							class="glyphicon glyphicon-log-out"></i>
					</form></li>
			</ul>
		</div>
	</div>
</nav>