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
		
	
				
		
			<div class="col-lg-4 col-lg-offset-2">
				<div class="login-panel panel panel-default">
					<div class="panel-heading">
						<h3 class="panel-title">Edit User</h3>
					</div>
					<div class="panel-body">
						<form class="form-horizontal" method="post" action="editUser">
							<fieldset>
								<div class="form-group">
									<label>Name</label> 
									<input class="form-control" value="${userobject.name}"name="name" type="text">
								</div>
								
								<div class="form-group">
									<label>Age</label> 
									<input class="form-control" value="${userobject.age}"name="age" type="text">
								</div>
								<div class="form-group">
									<label>City</label> 
									<input class="form-control"
										value="${userobject.city}" name="city" type="text">
										
								</div>
								<input type="hidden" name="${_csrf.parameterName}"
								value="${_csrf.token}" />

								<!-- Change this to a button or input when using this as a form -->
								<button class="btn btn-lg btn-primary btn-block" type="submit">Change</button>
							</fieldset>
						</form>
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