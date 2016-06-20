<%@ page isErrorPage="true" language="java"
	contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
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

</head>
<body>

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
					<li><a href="#">Settings</a> <a href="#">Sign out</a></li>
				</ul></li>
		</ul>
	</div>
	</nav>
	<div class="container-fluid">
		<div class="col-lg-8">
			<h1>Error</h1>
			Message:
			<%=exception.getMessage()%><br> <br> Exception:
			${requestScope["javax.servlet.error.exception"]} <br> Message:
			${requestScope["javax.servlet.error.message"]} <br> Status Code:
			${requestScope["javax.servlet.error.status_code"]} <br>
			Request-URI:  ${requestScope["javax.servlet.error.request_uri"]} <br>
			Servlet Name: ${requestScope["javax.servlet.error.servlet_name"]} <br>
			<br> Exception: ${pageContext.exception} <br> Message:
			${pageContext.exception.message} <br> <br> Exception: 
			${pageContext.errorData.throwable} <br> Message:
			${pageContext.errorData.throwable.message} <br> Status Code: 
			${pageContext.errorData.statusCode} <br> Request-URI: 
			${pageContext.errorData.requestURI} <br> Servlet
			Name: ${pageContext.errorData.servletName} <br> <br> 
			<input class="btn btn-round btn-success" type="button" value="Back" onclick="history.go(-1);"/>
		</div>
	</div>

	<!-- jQuery -->
	<script src="js/jquery.js"></script>

	<!-- Bootstrap Core JavaScript -->
	<script src="js/bootstrap.min.js"></script>
</body>
</html>