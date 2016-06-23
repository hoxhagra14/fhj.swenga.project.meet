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
	
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.3/css/font-awesome.min.css"/>

<link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/metisMenu/2.5.2/metisMenu.min.css">

<!-- Latest compiled and minified JavaScript -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.2/jquery.min.js"></script>
<script
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
	
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
		<div class="col-lg-1"></div>
			
				<div class="col-lg-10">
					<div class="row">
						<div class="col-lg-6">
							<div class="panel panel-success">
								<div class="panel-heading">
								<div class="container-fluid">
									<div class="col-lg-6"><i class="fa fa-futbol-o glyphicon-big"></i></div>
									<div class="col-lg-6"><h1 class="text-right">Sports</h1></div>
								</div>
								</div>
								<a href="listActivities?category=Sport">
									<div class="panel-footer">
										<p class="text-right">Go</p>
									</div>
								</a>
							</div>
						</div>


						<div class="col-lg-6">
							<div class="panel panel-primary">
								<div class="panel-heading">
								<div class="container-fluid">
									<div class="col-lg-6"><i class="fa fa-gamepad glyphicon-big"></i></div>
									<div class="col-lg-6"><h1 class="text-right">Gaming</h1></div>
								</div>
								</div>
								<a href="listActivities?category=Games">
									<div class="panel-footer">
										<p class="text-right">Go</p>
									</div>
								</a>
							</div>
						</div>
					</div>

					<div class="row spacer"></div>

					<div class="row">
						<div class="col-lg-6">
							<div class="panel panel-warning">
								<div class="panel-heading">
								<div class="container-fluid">
									<div class="col-lg-6"><i class="glyphicon glyphicon-glass glyphicon-big"></i></div>
									<div class="col-lg-6"><h1 class="text-right">Party</h1></div>
								</div>
								</div>
								<a href="listActivities?category=party">
									<div class="panel-footer">
										<p class="text-right">Go</p>
									</div>
								</a>
							</div>
						</div>


						<div class="col-lg-6">
							<div class="panel panel-info">
								<div class="panel-heading">
									<div class="container-fluid">
										<div class="col-lg-6"><i class="glyphicon glyphicon-book glyphicon-big"></i></div>
										<div class="col-lg-6"><h1 class="text-right">Learning</h1></div>
									</div>
								</div>
								<a href="listActivities?category=learning">
									<div class="panel-footer">
										<p class="text-right">Go</p>
									</div>
								</a>
							</div>
						</div>
					</div>

				</div>
			<div class="col-lg-1"></div>
		</div>
		<!-- END MENU -->

	</div>
	<!-- /#wrapper -->

	<!-- jQuery -->
	<script src="includes/jquery.js"></script>

	<!-- Bootstrap Core JavaScript -->
	<script src="includes/bootstrap.min.js"></script>
	
	
</body>
</html>