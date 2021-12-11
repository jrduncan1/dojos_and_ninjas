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
<title>Create Dojo</title>
</head>
<body>
	<div class="container m-5">
		<div class="d-flex justify-content-between align-items-center col-6">
			<h1>New Dojo</h1>
			<a href="/"><button class="btn btn-warning">Home</button></a> 
		</div>
		<form:form action="/dojos/new" method="post" modelAttribute="newDojo" class="form mt-5">
			<div class="row mb-2">
				<form:errors path="name" class="text-danger" />
				<form:label path="name" class="col-sm-2 col-form-label">Name: </form:label>
				<div class="col-4">
					<form:input path="name" type="text" class="form-control"/>
				</div>
			</div>
			<button class="btn btn-primary mt-3">Submit</button>
		</form:form>
	</div>
</body>
</html>