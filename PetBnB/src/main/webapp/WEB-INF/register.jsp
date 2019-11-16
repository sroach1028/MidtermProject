<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Register</title>
  </head>
  <body>
  <form:form action="register.do" method="GET" modelAttribute="user">
  <form:label path="firstName">First Name:</form:label>
  <form:input path="firstName" required="required"/>
  <form:errors path="firstName" />
  <br />
  <form:label path="lastName">Last Name:</form:label>
  <form:input path="lastName" required="required"/>
  <form:errors path="lastName" />
  <br />
  <form:label path="username">Username:</form:label>
  <form:input path="username" required="required"/>
  <form:errors path="username" />
  <br />
  <form:label path="password">Password:</form:label>
  <form:input path="password" required="required"/>
  <form:errors path="password" required="required"/>
  <br />
  <form:label path="email">Email:</form:label>
  <form:input path="email" required="required"/>
  <form:errors path="email" />
  <br />
  <form:label path="address.street">Street:</form:label>
  <form:input path="address.street" required="required"/>
  <form:errors path="address.street" />
  <br />
  <form:label path="address.city">City:</form:label>
  <form:input path="address.city" required="required"/>
  <form:errors path="address.city" />
  <br />
  <form:label path="address.state">State:</form:label>
  <form:input path="address.state" required="required"/>
  <form:errors path="address.state" />
  <br />
  <form:label path="address.zip">Zip:</form:label>
  <form:input path="address.zip" required="required"/>
  <form:errors path="address.zip" />
  <br />
  <form:label path="address.phone">Phone:</form:label>
  <form:input path="address.phone" required="required"/>
  <form:errors path="address.phone" />
  <br />
  <c:if test="${not empty error}">
  <h3>
  ${error }
  </h3>
  </c:if>
  <input type="submit" value="Login" />
</form:form>
  </body>
</html>