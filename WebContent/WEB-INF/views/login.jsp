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

<%@include file="includes/bootstrapCss.css"%>

<!--  Bootstrap Meta -->
<jsp:include page="includes/bootstrapMeta.jsp" />

</head>
<body>
	<div id="wrapper">
		<!-- Navigation -->
		<nav class="navbar navbar-static-top" role="navigation">
		<div class="container-fluid">
			<div class="navbar-header">
				<a href="" class="navbar-brand">M E E T .</a>
			</div>
		</div>
		</nav>
		<!-- /#navigation -->
		
		<div class="container-fluid" role="main">
			<div class="row">
				<div class="col-md-4 col-md-offset-4">
					<c:url value="/login" var="loginUrl" />
					<form action="${loginUrl}" method="post">
						<h2 class="form-signin-heading">Please sign in</h2>
						<c:if test="${SPRING_SECURITY_LAST_EXCEPTION.message != null}">
							<div class="alert alert-danger" role="alert">
								<c:out value="${SPRING_SECURITY_LAST_EXCEPTION.message}" />
							</div>
						</c:if>
						<label for="inputEmail" class="sr-only">Email address</label>
						<input type="text" id="username" class="form-control" 
							placeholder="User" required autofocus name="username">
						<label for="inputPassword" class="sr-only">Password</label>
						<input type="password" id="password" class="form-control" 
							placeholder="Password" required name="password">
						<button class="btn btn-lg btn-primary btn-block" type="submit">Sign in</button>
						<button class="btn btn-lg btn-info btn-block" type="submit">Register</button>
						<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
					</form>
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