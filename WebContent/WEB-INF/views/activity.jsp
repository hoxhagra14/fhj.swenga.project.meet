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
	<div class="container">
		<section id="wrapper">

		<div class="row">
			<div class="col-md-12">
				<div class="masthead well well-sm">
					<h1>
						<span class="light text-primary">Aktivität</span>
					</h1>
				</div>
			</div>
		</div>

		<div class="row">
			<div class="col-md-8">

				<div class="article">
					<h3>${activity.title}</h3>

					<ul class="list-unstyled list-inline">
						<li><i class="fa fa-calendar"></i> ${activity.date }</li>
						<li><i class="fa fa-user"></i> Sergio Rodriguez</li>
						<li><i class="fa fa-comments"></i> <a href="#">24
								Comments</a></li>
					</ul>

					<div class="article-content">

						<p>${activity.text}</p>

					</div>

					<ul class="list-unstyled list-inline blog-tags">
						<li><a href="#"><span class="fa fa-tag"></span> Example
								heading</a></li>
						<li><a href="#"><span class="fa fa-tag"></span> Example
								heading</a></li>
						<li><a href="#"><span class="fa fa-tag"></span> Example
								heading</a></li>
					</ul>

				</div>

			</div>

			<div class="col-md-4">

				<div>

					<div>
						<h4>
							<span class="glyphicon glyphicon-map-marker">Location:</span> <strong>${activity.location}</strong>
						</h4>
					</div>
					<br/>
					<div>
						<h4>
							<span class="glyphicon glyphicon-user">participants:</span>
						</h4>
					</div>

					<div class="list-group" id="list-group">

						<a href="#" class="list-group-item"> <span
							class="fa-stack fa-lg"> <i
								class="fa-stack-2x fa fa-circle "></i> <i
								class="fa-stack-1x text-primary fa fa-envelope "></i>
						</span> <span class="">Email</span>
						</a> <a href="#" class="list-group-item"> <span
							class="fa-stack fa-lg"> <i
								class="fa-stack-2x fa fa-circle "></i> <i
								class="fa-stack-1x text-primary fa fa-envelope "></i>
						</span> <span class="">Email</span>
						</a> <a href="#" class="list-group-item"> <span
							class="fa-stack fa-lg"> <i
								class="fa-stack-2x fa fa-circle "></i> <i
								class="fa-stack-1x text-primary fa fa-envelope "></i>
						</span> <span class="">Email</span>
						</a> <a href="#" class="list-group-item"> <span
							class="fa-stack fa-lg"> <i
								class="fa-stack-2x fa fa-circle "></i> <i
								class="fa-stack-1x text-primary fa fa-envelope "></i>
						</span> <span class="">Email</span>
						</a> <a href="#" class="list-group-item"> <span
							class="fa-stack fa-lg"> <i
								class="fa-stack-2x fa fa-circle "></i> <i
								class="fa-stack-1x text-primary fa fa-envelope "></i>
						</span> <span class="">Email</span>
						</a>
					</div>


					<div class="headline">
						<h3>Tags</h3>
					</div>

					<ul class="list-unstyled list-inline blog-tags">
						<li><a href="#"><i class="fa fa-tags"></i> Business</a></li>
						<li><a href="#"><i class="fa fa-tags"></i> Music</a></li>
						<li><a href="#"><i class="fa fa-tags"></i> Internet</a></li>
						<li><a href="#"><i class="fa fa-tags"></i> Education</a></li>
						<li><a href="#"><i class="fa fa-tags"></i> People</a></li>
						<li><a href="#"><i class="fa fa-tags"></i> Math</a></li>
						<li><a href="#"><i class="fa fa-tags"></i> Photos</a></li>
						<li><a href="#"><i class="fa fa-tags"></i> Electronics</a></li>
						<li><a href="#"><i class="fa fa-tags"></i> Apple</a></li>
						<li><a href="#"><i class="fa fa-tags"></i> Canada</a></li>
					</ul>

				</div>

			</div>
		</div>



		</section>
	</div>
</body>
</html>