<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
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

<!-- Custom CSS -->
<%@include file="includes/simple-sidebar.css"%>

</head>
<body>
	<div id="wrapper">
		<!-- Navigation -->
		<nav class="navbar navbar-static-top" role="navigation">
		<div class="container-fluid">
			<div class="navbar-header">
				<a href="index.jsp" class="navbar-brand">M E E T .</a>
			</div>
			<ul class="nav navbar-nav navbar-right">
				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown">User <span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li><a href="#">Settings</a> <a href="#">Sign out</a></li>
					</ul></li>
			</ul>
		</div>
		</nav>
		<!-- /#navigation -->

		<!-- SIDEBAR MENU -->
		<div class="container-fluid">
			<div class="col-lg-2">
				<div class="profile-usermenu">
					<ul class="nav">
						<li><a href="addActivity"><button type="button"
									class="btn btn-success">Add activity</button></a></li>

						<li>
							<p>Subcategories</p>
							<form action="find">
								<c:forEach items="${subcategories}" var="subcategory">
									<li><a> <input type="checkbox" name="subcategory"
											value="${subcategory.name}">${subcategory.name}<br>
									</a>
									<li>
								</c:forEach>
							</form>

							<button type="submit" class="btn btn-primary">Suchen</button>
						</li>
						<p>Search for Activities
						<p>
							<input type="text" name="activity">
						<li class="active"><a href="#"> <i
								class="glyphicon glyphicon-home"></i> Overview
						</a></li>
						<li><a href="#"> <i class="glyphicon glyphicon-user"></i>
								Account Settings
						</a></li>
						<li><a href="#" target="_blank"> <i
								class="glyphicon glyphicon-ok"></i> Tasks
						</a></li>
						<li><a href="#" target="_blank"> <i
								class="glyphicon glyphicon-ok"></i> Niti
						</a></li>
						<li><a href="#"> <i class="glyphicon glyphicon-flag"></i>
								Help
						</a></li>

					</ul>
				</div>
			</div>

			<!-- END MENU -->
			<div class="col-lg-8">
				<fieldset>
					<c:forEach items="${activities}" var="activity">
						<hr>
						<div class="row">
							<div class="col-sm-4">
								<a href="#" class=""><img src="http://placehold.it/1280X720"
									class="img-responsive"></a>
							</div>
							<div class="col-sm-8">

								<h3 class="title">${activity.title}</h3>
								<p class="text-muted">
									<span class="glyphicon glyphicon-lock"></span> Available
									Exclusively for Premium Members
								</p>
								<p>${activity.text}</p>
								
								<p>${activity.subcategory.name}</p>

								<p class="text-muted">
									Created by <a href="#">Granit Hocha</a>
								</p>
							</div>
						</div>
					</c:forEach>
				</fieldset>
			</div>
		</div>
		<!-- /#wrapper -->

		<!-- jQuery -->
		<script src="js/jquery.js"></script>

		<!-- Bootstrap Core JavaScript -->
		<script src="js/bootstrap.min.js"></script>
</body>
</html>