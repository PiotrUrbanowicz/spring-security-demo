<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
<title>Company Home Page</title>
</head>
<body>

<h2>Company Home Page</h2>

Welcome to our company page!

<hr>
	<p>
		User: <security:authentication property="principal.username"/>
		<br><br>
		Role(s): <security:authentication property="principal.authorities"/>
	</p>
	
	<hr>
	
	<security:authorize access="hasRole('MANAGER')">
	<p>
	<a href="${pageContext.request.contextPath}/leaders">LeaderShip Meeting</a>
	(only for Leaders peeps)
	</p>
		</security:authorize>
		
			<security:authorize access="hasRole('ADMIN')">
		<p>
	<a href="${pageContext.request.contextPath}/systems">IT Systems Meeting</a>
	(only for Admin peeps)
	</p>
		</security:authorize>
<hr>

	<form:form action="${pageContext.request.contextPath}/logout"
	method="POST">
	
	<input type="submit" value="Logout"/>
	</form:form>
	


</body>
</html>