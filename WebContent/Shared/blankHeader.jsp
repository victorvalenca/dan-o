<nav class="navbar navbar-default">
	<div class="container">
		<div class="navbar-header">
			<a class="navbar-brand navbar-link"
				href="${pageContext.request.contextPath}/index.jsp"><span
				class="glyphicon glyphicon-home"></span> My pLace</a>
			<button class="navbar-toggle collapsed" data-toggle="collapse"
				data-target="#navcol-1">
				<span class="sr-only">Toggle navigation</span><span class="icon-bar"></span><span
					class="icon-bar"></span><span class="icon-bar"></span>
			</button>
		</div>
		<div class="collapse navbar-collapse" id="navcol-1">
			<form action="loginServlet" method="post" class="navbar-form navbar-right">
				<div class="form-group">
					<div class="row">
						<div class="col-md-12">
							<label class="control-label">Email</label>
						</div>
					</div>
					<div class="row">
						<div class="col-md-12">
							<input class="form-control input-sm" name="lEmail" type="email" required="required">
						</div>
					</div>
				</div>
				<div class="form-group">
					<div class="row">
						<div class="col-md-12">
							<label class="control-label"> Password </label>
						</div>
					</div>
					<div class="row">
						<div class="col-md-12">
							<input class="form-control input-sm" name="lPassword" type="password" required="required">
							<input type="submit" value="Login" class="btn btn-default btn-xs" />
						</div>
					</div>
				</div>
			</form>
			
		</div>
	</div>
</nav>