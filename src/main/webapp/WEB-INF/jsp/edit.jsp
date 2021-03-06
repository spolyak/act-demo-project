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
						<div class="navbar">
							<div class="navbar-inner">
								<ul class="nav">
									<li class="active"><a href="${baseu}/web/edit">Objectives</a></li>
									<li><a href="${baseu}/web/editSkills">Skills</a></li>
								</ul>
							</div>
						</div>
						<form:form method="post" action="add" commandName="objective"
							class="form-vertical">

							<form:label path="objective">New Objective</form:label>
							<form:input path="objective" />

							<form:label path="objective">Parent</form:label>
							<form:select path="parentLearningObjectiveString">
								<option value="" />
								<c:forEach items="${parentList}" var="lo">
									<option value="${lo.id}" label="${lo.objective}">
								</c:forEach>
							</form:select>

							<input type="submit" value="Add Objective" class="btn" />
						</form:form>


						<c:if test="${!empty standardsList}">
							<h3>Objectives</h3>
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
											<td><c:if test="${not empty learningObjective.parent}">
											${learningObjective.parent.objective} : 
											</c:if> ${learningObjective.objective}</td>
											<td><form action="delete/${learningObjective.id}"
													method="post">
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