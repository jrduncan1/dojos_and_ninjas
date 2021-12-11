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
<title>Create Ninja</title>
</head>
<body>
	<div class="container m-5">
		<div class="d-flex justify-content-between align-items-center col-6">
			<h1>New Ninja</h1>
			<a href="/"><button class="btn btn-warning">Home</button></a> 
		</div>
		<form:form action="/ninjas/new" method="post" modelAttribute="newNinja" class="form mt-5">
			<div class="row mb-2">
				<form:errors path="dojo" class="text-danger" />
				<form:label path="dojo" class="col-sm-2 col-form-label">Dojo:</form:label>
				<div class="col-4">
					<form:select path="dojo" class="form-select">
						<c:forEach var="eachDojo" items="${dojos}">
							<form:option value="${eachDojo.id}">${eachDojo.name}</form:option>
						</c:forEach>
					</form:select>
				</div>

			</div>
			<div class="row mb-2">
				<form:errors path="firstName" class="text-danger" />
				<form:label path="firstName" class="col-sm-2 col-form-label">First Name: </form:label>
				<div class="col-4">
					<form:input path="firstName" type="text" class="form-control"/>
				</div>
			</div>
			<div class="row mb-2">
				<form:errors path="lastName" class="text-danger" />
				<form:label path="lastName" class="col-sm-2 col-form-label">Last Name: </form:label>
				<div class="col-4">
					<form:input path="lastName" type="text" class="form-control"/>
				</div>
			</div>
			<div class="row mb-2">
				<form:errors path="age" class="text-danger" />
				<form:label path="age" class="col-sm-2 col-form-label">Age: </form:label>
				<div class="col-4">
					<form:input path="age" type="text" class="form-control"/>
				</div>
			</div>
			<button class="btn btn-primary mt-3">Submit</button>
		</form:form>
	</div>
</body>
</html>