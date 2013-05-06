<div class="navbar navbar-fixed-top">
	<div class="navbar-inner">
		<div class="container">
			<button type="button" class="btn btn-navbar" data-toggle="collapse"
				data-target=".nav-collapse">
				<span class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
			<a class="brand" href="http://www.act.org">ACT "${pageContext.request.contextPath}"</a>
			<div class="nav-collapse collapse">
				<ul class="nav">
					<li><a href="${pageContext.request.contextPath}/web/welcome">Home</a></li>
					<li><a href="${pageContext.request.contextPath}/web/edit">Manage</a></li>
					<li><a href="${pageContext.request.contextPath}/web/view">View</a></li>
					<li class="dropdown"><a href="#" class="dropdown-toggle"
						data-toggle="dropdown">Tools<b class="caret"></b></a>
						<ul class="dropdown-menu">
							<li><a href="${pageContext.request.contextPath}/web/import">Import</a></li>
							<li><a href="${pageContext.request.contextPath}/web/export">Export</a></li>
						</ul></li>
				</ul>
			</div>
		</div>
	</div>
</div>