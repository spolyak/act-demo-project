<!DOCTYPE html>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html lang="en">
<head>
<%@include file="header.jsp"%>
</head>

<body>
	<div id="wrap">
		<%@include file="nav.jsp"%>
		<div class="container">
			<div class="container">
				<div class="row">
					<div class="span8 offset2">
						<div class="page-header">
							<h1>Manage Standards</h1>
						</div>
						<form:form method="post" action="add" commandName="objective"
							class="form-vertical">

							<form:label path="objective">Objective</form:label>
							<form:input path="objective" />
							
							<input type="submit" value="Add Learning Objective" class="btn" />
						</form:form>


						<c:if test="${!empty standardsList}">
							<h3>Learning Objective</h3>
							<table class="table table-bordered table-striped">
								<thead>
									<tr>
										<th>Objective</th>
										<th>&nbsp;</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${standardsList}" var="learningObjective">
										<tr>
											<td>${learningObjective.objective}</td>
											<td><form action="delete/${learningObjective.id}" method="post">
													<input type="submit" class="btn btn-danger btn-mini"
														value="Delete" />
												</form></td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</c:if>
					</div>
				</div>
			</div>

		</div>
		<div id="push"></div>
	</div>
	<%@include file="footer.jsp"%>
</body>