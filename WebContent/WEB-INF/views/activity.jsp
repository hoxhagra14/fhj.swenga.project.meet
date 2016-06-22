<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Insert title here</title>

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
						<li><a href="#">Settings</a> <a href="#">Sign out</a></li>
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
											<td>${activity.subcategory }</td>
										</tr>
										<tr>
											<td><span class="glyphicon glyphicon-user">Attendane:</span></td>
											<td>${activity.restriction }</td>
										</tr>
										<tr>
											<td>Email</td>
											<td><a href="mailto:info@support.com">info@support.com</a></td>
										</tr>
										<td>Description:</td>
										<td>${activity.text }</td>

										</tr>

									</tbody>
								</table>

								<a href="#" class="btn btn-success">Join Activity</a>

								<a href="delete?id=${activity.id}">
									<button type="button" class="btn btn-danger">
										<span class="glyphicon glyphicon-trash" aria-hidden="true"></span>
										Delete
									</button>
								</a>

							</div>
						</div>
					</div>
					<div class="panel-footer">
						<a data-original-title="Broadcast Message" data-toggle="tooltip"
							type="button" class="btn btn-sm btn-primary"><i
							class="glyphicon glyphicon-envelope"></i></a> <span
							class="pull-right"> <a href="edit.html"
							data-original-title="Edit this user" data-toggle="tooltip"
							type="button" class="btn btn-sm btn-warning"><i
								class="glyphicon glyphicon-edit"></i></a> <a
							data-original-title="Remove this user" data-toggle="tooltip"
							type="button" class="btn btn-sm btn-danger"><i
								class="glyphicon glyphicon-remove"></i></a>
						</span>
					</div>

				</div>
			</div>
		</div>
	</div>


</body>
</html>