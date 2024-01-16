<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- <%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %> --%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>

<html lang="en" xmlns:th="http://www.thymeleaf.org">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>List Account</title>

    <!-- Bootstrap CSS -->
    <link
      href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
      rel="stylesheet"
      integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN"
      crossorigin="anonymous"
    />
    <script
      src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
      integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
      crossorigin="anonymous"
    ></script>
  </head>
  <body>

	<div class="container">
		<h2>List Users</h2>
		<a href="/account/register" class="btn btn-warning">Add
			Users</a> <br> <br>
		<table class="table table-bordered">
			<thead>
				<tr align="center">
					<th>Photo</th>
					<th>UserName</th>
					<th>Password</th>
					<th>FullName</th>
					<th>Email</th>					
					<th>Activated</th>
					<th>Admin</th>
					<th>Action</th>
				</tr>
			</thead>
			<tbody>		
				<c:forEach items="${ACCOUNTS}" var="ac">
					<tr>
						<td align="center"><img src="/uploads/${ac.photo }" width="60" height="60"/></td>
						<td align="center">${ac.username }</td>
						<td align="center">${ac.password }</td>
						<td align="center">${ac.fullname }</td>
						<td align="center">${ac.email }</td>
						<td align="center">${ac.activated?"Online":"Offline"}</td>
						<td align="center">${ac.admin?"Admin":"User" }</td>
						<td align="center"><a class="btn btn-primary btn-sm" href="/account/register/${ac.username}">Edit</a>
							| <a class="btn btn-danger btn-sm" href="?btnDel=&username=${ac.username}">Delete</a></td>
					</tr>
				</c:forEach>
				
				
				
			</tbody>
		</table>
	</div>
</body>
</html>

