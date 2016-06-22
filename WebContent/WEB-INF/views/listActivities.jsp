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
				<a href="./" class="navbar-brand">M E E T .</a>
			</div>
			<ul class="nav navbar-nav navbar-right">
				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown">User <span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li><button class="btn btn-link" onclick="location.href='#'">Settings</button> 
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

		<!-- SIDEBAR MENU -->
		<div class="container-fluid">
			<div class="col-lg-2">
				<div class="sidebar-nav navbar-collapse">
					<ul class="nav" id="side-menu">
						<li><a href="addActivity"> <i
								class="glyphicon glyphicon-plus"></i> Add Activity
						</a></li>
						<li class="sidebar-search">
							<form action="find" method="post">
								<input type="hidden" name="${_csrf.parameterName}"
									value="${_csrf.token}" /> Search for Activities </br>
								<div class="input-group custom-search-form">
									<input type="hidden" name="type" value="findTitle"> <input
										class="form-control" placeholder="Suchen..." type="text"
										name="searchString"> <span class="input-group-btn" />
									<button class="btn btn-default" type="submit">
										<i class="glyphicon glyphicon-search"></i>
									</button>
									</span>
								</div>
							</form>
						</li>
						<br />
						<li>
							<p>Subcategories</p>
							<form action="find" method="post">
								<input type="hidden" name="${_csrf.parameterName}"
									value="${_csrf.token}" /> <input type="hidden" name="type"
									value="findSubcategory">
								<c:forEach items="${subcategories}" var="subcategory">
									<li><a> <input type="checkbox" name="searchString"
											value="${subcategory.name}">${subcategory.name}<br>
									</a>
									<li>
								</c:forEach>
								<button type="submit" class="btn btn-primary">Suchen</button>
							</form>

						</li>
						<br />
						<li>
							<form action="find">
								<input type="hidden" name="${_csrf.parameterName}"
									value="${_csrf.token}" /> <input type="hidden" name="type"
									value="findState"> <a> <input type="checkbox"
									name="searchString" value="Burgenland">Burgenland<br>
								</a> <a> <input type="checkbox" name="searchString"
									value="Kärnten">Kärnten<br>
								</a> <a> <input type="checkbox" name="searchString"
									value="Niederösterreich">Niederösterreich<br>
								</a> <a> <input type="checkbox" name="searchString"
									value="Oberösterreich">Oberösterreich<br>
								</a> <a> <input type="checkbox" name="searchString"
									value="Salzburg">Salzburg<br>
								</a> <a> <input type="checkbox" name="searchString"
									value="Steiermark">Steiermark<br>
								</a> <a> <input type="checkbox" name="searchString"
									value="Tirol">Tirol<br>
								</a> <a> <input type="checkbox" name="searchString"
									value="Vorarlberg">Vorarlberg<br>
								</a> <a> <input type="checkbox" name="searchString" value="Wien">Wien<br>
								</a>
								<button type="submit" class="btn btn-primary">Suchen</button>
							</form>

						</li>
						<br />
						<li>
							<form action="find" method="post">
								<input type="hidden" name="${_csrf.parameterName}"
									value="${_csrf.token}" /> Ortsuche </br>
								<div class="input-group custom-search-form">
									<input type="hidden" name="type" value="findLocation">
									<input class="form-control" placeholder="Suchen..." type="text"
										name="searchString"> <span class="input-group-btn">
										<button class="btn btn-default" type="submit">
											<i class="glyphicon glyphicon-search"></i>
										</button>
									</span>
								</div>
							</form>
				</div>
				</li>
				</ul>
			</div>


			<!-- END MENU -->
			<div class="col-lg-8">
				<!--  Error message ----------------------------------------------------------- -->
				<c:if test="${not empty errorMessage}">
					<div class="alert alert-danger" role="alert">${errorMessage}</div>
				</c:if>
				<!--  Error message ----------------------------------------------------------- -->

				<!--  Warning message ----------------------------------------------------------- -->
				<c:if test="${not empty warningMessage}">
					<div class="alert alert-warning" role="warning">
						${warningMessage}</div>
				</c:if>
				<!--  Warning message ----------------------------------------------------------- -->

				<!--   message ----------------------------------------------------------- -->
				<c:if test="${not empty message}">
					<div class="alert alert-success" role="warning">${message}</div>
				</c:if>
				<!--   message ----------------------------------------------------------- -->


				<fieldset>
					<c:forEach items="${activities}" var="activity">
						<hr>
						<div class="row">
							<div class="col-sm-4">
								<a href="fullActivity?id=${activity.id}" class=""><img
									src="http://placehold.it/1280X720" class="img-responsive"></a>
							</div>
							<div class="col-sm-8">

								<h3 class="title">${activity.title}</h3>
								<p class="text-muted">
									<span class="glyphicon glyphicon-calendar"></span>
									<fmt:formatDate value="${activity.date }" pattern="yyyy-MM-dd" />
								</p>
								<p>${activity.text}</p>
								<p>${activity.subcategory.name}</p>

								<p class="text-muted">
									Created by <a href="#">Granit Hoxha</a>
								</p>
							</div>
						</div>
					</c:forEach>
				</fieldset>
			</div>
		</div>
	</div>


	</div>
	<!-- /#wrapper -->

	<!-- jQuery -->
	<script src="js/jquery.js"></script>

	<!-- Bootstrap Core JavaScript -->
	<script src="js/bootstrap.min.js"></script>
</body>
</html>