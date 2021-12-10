<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page isErrorPage="true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />
<title>Home</title>
</head>
<body>
	<div class="container m-5">
		<div class="d-flex justify-content-between align-items-center col-6">
			<h1>Dojos and Ninjas</h1>
			<a href="/"><button class="btn btn-warning">Add Dojo</button></a>
			<a href="/"><button class="btn btn-info">Add Ninja</button></a>
		</div>
		<div class="mt-5 p-2 border border-3 border-dark col-5">
			<h3>Dojos: </h3>
			<table class="table">
				<c:forEach var="dojos" items="${dojos}">
					<tr>
						<td>${dojos.name}</td>
						<td>
							<div class="d-flex">
								<a href="/dojos/<c:out value="${dojos.id}"></c:out>"><button class="btn btn-secondary me-3">View</button></a>
							</div>
						</td>
					</tr>
				</c:forEach>
			</table>
		</div>
	</div>
</body>
</html>