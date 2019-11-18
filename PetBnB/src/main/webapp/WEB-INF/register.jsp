<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Register</title>
    <%@include file="/WEB-INF/nav.jsp"%>
  </head>
  <body>
  <form:form action="register.do" method="GET" modelAttribute="user">
  <table>
  <tr>
  <td style="color:#000000"><form:label path="firstName">First Name:</form:label></td>
  <td><form:input path="firstName" required="required"/>
  <form:errors path="firstName" /></td>
  </tr>
  <tr>
  <td style="color:#000000"><form:label path="lastName">Last Name:</form:label></td>
  <td><form:input path="lastName" required="required"/>
  <form:errors path="lastName" /></td>
  </tr>
  <tr>
  <td style="color:#000000"><form:label path="username">Username:</form:label></td>
  <td><form:input path="username" required="required"/>
  <form:errors path="username" /></td>
  </tr>
  <tr>
  <td style="color:#000000"><form:label path="password">Password:</form:label></td>
  <td><form:input path="password" required="required"/>
  <form:errors path="password" required="required"/></td>
  </tr>
  <tr>
  <td style="color:#000000"><form:label path="email">Email:</form:label></td>
  <td><form:input path="email" required="required"/>
  <form:errors path="email" /></td>
  </tr>
  <tr>
  <td style="color:#000000"><form:label path="address.street">Street:</form:label></td>
  <td><form:input path="address.street" required="required"/>
  <form:errors path="address.street" /></td>
  </tr>
  <tr>
  <td style="color:#000000"><form:label path="address.city">City:</form:label></td>
  <td><form:input path="address.city" required="required"/>
  <form:errors path="address.city" /></td>
  </tr>
  <tr>
  <td style="color:#000000"><form:label path="address.state">State:</form:label></td>
  <td><form:input path="address.state" required="required"/>
  <form:errors path="address.state" /></td>
  </tr>
  <tr>
  <td style="color:#000000"><form:label path="address.zip">Zip:</form:label></td>
  <td><form:input path="address.zip" required="required"/>
  <form:errors path="address.zip" /></td>
  </tr>
  <tr>
  <td style="color:#000000"><form:label path="address.phone">Phone:</form:label></td>
  <td><form:input path="address.phone" required="required"/>
  <form:errors path="address.phone" /></td>
  </tr>
  <c:if test="${not empty error}">
  <h3>
  ${error }
  </h3>
  </c:if>
  <tr><td>
  <input type="submit" value="Register" /></td></tr>
  </table>
</form:form>
  </body>
</html>