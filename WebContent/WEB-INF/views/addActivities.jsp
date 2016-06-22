<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>meet.</title>
<link
	href="http://www.malot.fr/bootstrap-datetimepicker/bootstrap-datetimepicker/css/bootstrap-datetimepicker.css"
	rel="stylesheet">
<!-- Custom CSS -->

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
				<div class="profile-usermenu">
					<ul class="nav">
						<li class="active"><a href="#"> <i
								class="glyphicon glyphicon-home"></i> Overview
						</a></li>
						<li><a href="#"> <i class="glyphicon glyphicon-user"></i>
								Account Settings
						</a></li>
						<li><a href="#" target="_blank"> <i
								class="glyphicon glyphicon-ok"></i> Tasks
						</a></li>
						<li><a href="#"> <i class="glyphicon glyphicon-flag"></i>
								Help
						</a></li>
					</ul>
				</div>
			</div>
			<div class="col-lg-8">
				<form class="form-horizontal" method="post" action="add">
				<input type="hidden" name="${_csrf.parameterName}"  value="${_csrf.token}" />
					<input type="hidden" name="${_csrf.parameterName}"
						value="${_csrf.token}" />
					<fieldset>
						<legend>Add Activity</legend>

						<! ----------------  Titel ---------------- -->
						<div class="form-group">
							<label for="inputName" class="col-md-2 control-label">Title</label>
							<div class="col-md-10">
								<input class="form-control" id="inputName" type="text"
									name="title">
							</div>
						</div>

						<! ----------------  Unterkategorie ---------------- -->
						<div class="form-group">
							<label for="inputSubcategory" class="col-md-2 control-label">Subcategory</label>
							<div class="col-md-10">
								<select name="type">
									<c:forEach items="${subcategories}" var="subcategory">
										<option value="${subcategory.name}" selected="selected">${subcategory.name}</option>
									</c:forEach>
								</select>
							</div>
						</div>

						<! ----------------  Bundesland ---------------- -->
						<div class="form-group">
							<label for="inputState" class="col-md-2 control-label">Bundesland</label>
							<div class="col-md-10">
								<select name="state">
									<option value="Burgenland" selected="selected">Burgenland</option>
									<option value="Kärnten" selected="selected">Kärnten</option>
									<option value="Niederösterreich" selected="selected">Niederösterreich</option>
									<option value="Oberösterreich" selected="selected">Oberösterreich</option>
									<option value="Salzburg" selected="selected">Salzburg</option>
									<option value="Steiermark" selected="selected">Steiermark</option>
									<option value="Tirol" selected="selected">Tirol</option>
									<option value="Vorarlberg" selected="selected">Vorarlberg</option>
									<option value="Wien" selected="selected">Wien</option>
								</select>
							</div>
						</div>

						<! ----------------  Ort ---------------- -->
						<div class="form-group">
							<label for="inputLocation" class="col-md-2 control-label">Location</label>
							<div class="col-md-10">
								<input class="form-control" id="inputLocation" type="text"
									name="location">
							</div>
						</div>

						<! ----------------  Datum ---------------- -->
						<c:set var="now" value="<%=new java.util.Date()%>" />
						<div class="form-group">
							<label for="inputDate" class="col-md-2 control-label">Date</label>
							<div class="col-md-10">
								<input class="form_datetime" id="inputDate" placeholder="Date"
									type="text"
									value="<fmt:formatDate value="${now }" pattern="dd.MM.yyyy"/>"
									name="date">
							</div>
						</div>

						<! ----------------  Inhalt ---------------- -->
						<div class="form-group">
							<label for="inputText" class="col-md-2 control-label">Description</label>
							<div class="col-md-10">
								<textarea rows="4" class="form-control" id="inputText"
									type="text" name="text"> </textarea>
							</div>
						</div>

						<! ----------------  Teilnehmerzahl ---------------- -->
						<div class="form-group">
							<label for="inputRestriction" class="col-md-2 control-label">Restriction</label>
							<div class="col-md-10">
								<input class="form-control" id="inputRestriction" type="text"
									name="restriction">
							</div>
						</div>

						<! ----------------  Offen/Geschlossen ---------------- -->
						<div class="form-group">
							<div class="col-md-10">
							<label for="inputClosed" class="col-md-2 control-label">closed</label>
								<input type="checkbox" name="closed">
							</div>
						</div>

						<! ----------------  buttons ---------------- -->
						<div class="form-group">
							<div class="col-md-10 col-md-offset-2">
								<button type="submit" class="btn btn-primary">Submit</button>
								<a href="listActivities">
									<button type="button" class="btn btn-default">Cancel</button>
								</a>
							</div>
						</div>

					</fieldset>
				</form>
			</div>
		</div>
		<!-- END MENU -->

	</div>
	<!-- /#wrapper -->

	<!-- jQuery -->
	<script src="js/jquery.js"></script>

	<!-- JS for Datetime picker -->

	<script type="text/javascript"
		src="http://www.malot.fr/bootstrap-datetimepicker/bootstrap-datetimepicker/js/bootstrap-datetimepicker.js"></script>

	<script>
		$(function() {

			$(".form_datetime").datetimepicker({
				format : "dd.mm.yyyy",
				autoclose : true,
				todayBtn : true,
				pickerPosition : "bottom-left",
				minView : 2
			});

		});
	</script>



	<!-- Bootstrap Core JavaScript -->
	<script src="js/bootstrap.min.js"></script>

</body>
</html>