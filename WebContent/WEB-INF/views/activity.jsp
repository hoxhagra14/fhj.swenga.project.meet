<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>meet.</title>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- Latest compiled and minified CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css"
	integrity="sha384-1q8mTJOASx8j1Au+a5WDVnPi2lkFfwwEAa8hDDdjZlpLegxhjVME1fgjWPGmkzs7"
	crossorigin="anonymous">

<!-- Optional theme -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap-theme.min.css"
	integrity="sha384-fLW2N01lMqjakBkx3l/M9EahuwpSfeNvV63J5ezn3uZzapT0u7EYsXMjQV+0En5r"
	crossorigin="anonymous">

<!-- Latest compiled and minified JavaScript -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.2/jquery.min.js"></script>
<script
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
	
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.3/css/font-awesome.min.css"/>
<link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/metisMenu/2.5.2/metisMenu.min.css">
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/metisMenu/2.5.2/metisMenu.min.js"></script>

<!-- Custom CSS -->
<%@include file="includes/simple-sidebar.css"%>

<%@include file="includes/bootstrapCss.css"%>

</head>
<body>
	<div id="wrapper">
		<!-- Navigation -->
		<nav class="navbar navbar-static-top" role="navigation">
		<div class="container-fluid">
			<div class="navbar-header">
				<a href="./" class="navbar-brand">M E E T .</a>
			</div>
			<ul class="nav navbar-nav navbar-right margin-user">
				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown">${currentUser}<span class="caret"></span></a>
				<ul class="dropdown-menu">
						<li><a href="user">User Profile</a></li>
						<c:url value="/logout" var="logoutUrl" />
						<li role="separator" class="divider"></li>
						<li><form action="${logoutUrl}" method="post">
								<input type="hidden" name="${_csrf.parameterName}"
									value="${_csrf.token}" /> 
								<input class="btn btn-link"
									type="submit" value="Logout" />
							</form></li>
					</ul></li>
			</ul>
		</div>
		</nav>
		<!-- /#navigation -->
		<!-- TODO: In foreach ändern -->
		<!-- SIDEBAR MENU -->
		<div class="container-fluid">
			<div class="col-lg-2">
				<div class="profile-usermenu">
				
				<ul class="nav MetisMenu" id="menu">
				<li>
					<a area-expanded="false">
						<i class="fa fa-futbol-o"></i> 
						Sport
					</a>
					<ul area-expanded="false">
						<li><a href="listActivities?category=Sport">Aktivitäten</a></li>
						<li><a href="addActivity?category=Sport">neue Aktivität erstellen</a></li>
					</ul>
				</li>
				<li>
					<a area-expanded="false">
						<i class="fa fa-gamepad"></i>
						Gaming
					</a>
					<ul area-expanded="false">
						<li><a href="listActivities?category=Games">Aktivitäten</a></li>
						<li><a href="addActivity?category=Games">neue Aktivität erstellen</a></li>
					</ul>
				</li>
				<li>
					<a area-expanded="false">
						<i class="glyphicon glyphicon-glass"></i>
						Party
					</a>
					<ul area-expanded="false">
						<li><a href="listActivities?category=party">Aktivitäten</a></li>
						<li><a href="addActivity?category=party">neue Aktivität erstellen</a></li>
					</ul>
				</li>
				<li>
					<a area-expanded="false">
						<i class="glyphicon glyphicon-book"></i>
						Learning
					</a>
					<ul area-expanded="false">
						<li><a href="listActivities?category=learning">Aktivitäten</a></li>
						<li><a href="addActivity?category=learning">neue Aktivität erstellen</a></li>
					</ul>
				</li>
				</ul>
				
				</div>
				</div>

			<div class="col-lg-8">
				<div class="panel panel-info">
					<div class="panel-heading">
						<h3 class="panel-title">Activity</h3>
					</div>
					<div class="panel-body">
						<div class="row">
							<div class="col-md-3 col-lg-3 " align="center">
								<img alt="User Pic" src="http://placehold.it/1280X720"
									class="img-circle img-responsive">
							</div>

							<div class=" col-md-9 col-lg-9 ">
								<table class="table table-user-information">
									<tbody>
										<tr>
											<td><strong>Title:</strong></td>
											<td>${activity.title}</td>
										</tr>
										<tr>
											<td>Date:</td>
											<td>${activity.date }</td>
										</tr>
										<tr>
											<td><span class="glyphicon glyphicon-map-marker">Location:</span></td>
											<td>${activity.location }</td>
										</tr>

										<tr>
										<tr>
											<td>Subcategory</td>
											<td>${activity.subcategory}</td>
										</tr>
										<tr>
											<td><span class="glyphicon glyphicon-user">Attendane:</span></td>
											<td>${activity.restriction}</td>
										</tr>
										<td>Description:</td>
										<td>${activity.text }</td>

										</tr>

									</tbody>
								</table>
								<!--   
								<c:if test="${activity.owner.username ne currentUser}">
									<a href="#" class="btn btn-success">Join Activity</a>
								</c:if> -->

								<c:if test="${activity.owner.username eq currentUser}">
									<a href="delete?id=${activity.id}">
										<button type="button" class="btn btn-danger">
											<span class="glyphicon glyphicon-trash" aria-hidden="true"></span>
											Delete
										</button>
									</a>
								</c:if>
								<!--  
								<c:if test="${activity.owner.username eq currentUser}">
									<a href="addActivity?id=${activity.id}" class="btn btn-sm btn-warning">Edit Activity</a>
								</c:if> -->

							</div>
						</div>
					</div>

				</div>
			</div>
		</div>
	</div>

<script> $(function() {

	      $('#menu').metisMenu();
	});</script>
	
</body>
</html>