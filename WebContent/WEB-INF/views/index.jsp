<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@include file="includes/bootstrapMeta.inc"%>
<title>Employee Manager Spring Data JPA</title>
<%@include file="includes/bootstrapCss.css"%>
<%@include file="includes/treeView.css"%>



</head>
<body>
	<div class="container">
		<center>
			<h1>${type}</h1>
			<br>
			<!--  Search + Fill ----------------------------------------------------------- -->
			<div class="row">
				<form method="post" action="find">
					<label for="searchString">Search:</label> <select name="type">
						<option value="findAll" selected="selected">findAll</option>
						<option value="findBySubcategory">findBySubcategory</option>				
								
					</select> <input type="text" name="searchString"> <input
						type="submit" value="Do it">
				</form>
			</div>

			<!--  Search + Fill ----------------------------------------------------------- -->
		</center>



		<!--  list all employees ----------------------------------------------------------- -->
		<div class="row">
			<div class="col-md-10 col-md-offset-1">
				<h1>Activities</h1>
				<table data-toggle="table" class="table table-striped">
					<thead>
						<tr>
							<th>ID</th>
							<th>subcategory</th>
							<th>ort</th>
							<th>titel</th>
							<th>text</th>
							<th>limit</th>
							<th>version</th>
							<th>DOB</th>
							<th>Action <a href="fill"><button type="button"
										class="btn btn-success">Fill List</button></a>
							</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${activities}" var="activity">
							<tr>
								<td>${activity.id}</td>
								<td>${activity.subcategory}</td>
								<td>${activity.ort}</td>
								<td>${activity.text}</td>
								<td>${activity.limit}</td>
								<td>${activity.version}</td>
								<td><fmt:formatDate value="${activity.date}"
										pattern="dd.MM.yyyy" />
								<td><a href="delete?id=${activity.id}">Delete</a></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
		<!--  list all employees ----------------------------------------------------------- -->
	</div>
	<!--  end of container -->
	<%@include file="includes/bootstrapJs.js"%>
</body>
</html>
