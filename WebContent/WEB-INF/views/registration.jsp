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

	<div class="container">
		<div class="row">
			<div class="col-md-4 col-md-offset-4">
				<div class="login-panel panel panel-default">
					<div class="panel-heading">
						<h3 class="panel-title">Please Register</h3>
					</div>
					<div class="panel-body">
						<form role="form">
							<fieldset>
								<div class="form-group">
									<label>Username</label> 
									<input class="form-control"
										placeholder="Username" name="username" type="text">
								</div>
								<div class="form-group">
									<label>Password</label> 
									<input class="form-control"
										placeholder="Password" name="password" type="password"
										value="">
								</div>
								<div class="form-group">
									<label>Age</label> 
									<select class="form-control">
										<c:forEach begin="1" end="99" var="i">
											<option>
												<c:out value="${i}"></c:out>
											</option>
										</c:forEach>
										<option>99+</option>
									</select>
								</div>
								<div class="form-group">
									<label>City</label> 
									<input class="form-control"
										placeholder="City" name="city" type="text">
								</div>

								<!-- Change this to a button or input when using this as a form -->
								<button class="btn btn-lg btn-primary btn-block" type="submit">Register</button>
							</fieldset>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- jQuery -->
	<script src="../bower_components/jquery/dist/jquery.min.js"></script>

	<!-- Bootstrap Core JavaScript -->
	<script src="../bower_components/bootstrap/dist/js/bootstrap.min.js"></script>

	<!-- Metis Menu Plugin JavaScript -->
	<script src="../bower_components/metisMenu/dist/metisMenu.min.js"></script>

	<!-- Custom Theme JavaScript -->
	<script src="../dist/js/sb-admin-2.js"></script>

</body>
</html>