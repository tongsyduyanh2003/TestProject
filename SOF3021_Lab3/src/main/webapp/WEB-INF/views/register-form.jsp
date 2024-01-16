<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE html>

<html lang="en" xmlns:th="http://www.thymeleaf.org">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Register</title>

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
    <style type="text/css">
      .error{
      	color: red;
      }
    </style>
  </head>
  <body>
        <div class="container" style="margin-top: 10px;">
            <div class="row" style="border: 1px darkgrey solid; border-radius: 10px;width: 50%; margin: 0 auto; padding: 20px;" >
                <div class="col-sm-12">
                    <h2>Register Account</h2>
                    <form:form action="/account/SaveOrUpdate" modelAttribute="ACCOUNT" method="post" enctype="multipart/form-data">
                        <div class="form-group">
                            <label>UserName</label>
                            <form:input type="text" class="form-control" path="username"  placeholder="Enter UserName"/>
                            <form:errors path="username" cssClass="error"></form:errors>
                        </div> <br>
                        <div class="form-group">
                            <label>Password:</label>
                            <form:input type="password" class="form-control" path="password"  placeholder="Enter password"/>
                            <form:errors path="password" cssClass="error"></form:errors>
                        </div> <br>
                        <div class="form-group">
                            <label>FullName</label>
                            <form:input type="text" class="form-control" path="fullname"  placeholder="Enter fullname"/>                         
                        	<form:errors path="fullname" cssClass="error"></form:errors>
                        </div> <br>
                        <div class="form-group">
                            <label>Email</label>
                            <form:input type="text" class="form-control" path="email"  placeholder="Enter email"/>
                        	<form:errors path="email" cssClass="error"></form:errors>
                        </div> <br>
						<div class="form-group">
                            <label>Photo</label>
                            <input type="file" class="form-control" name="image"  accept="image/png, image/jpeg"/>
                        	<p class="error">${ERROR_PHOTO }</p>
                        </div> <br>
                        <div class="form-group">
                            <label>Status</label>
                            <div class="radio"><!--value = 1 => Nam| 0 =>Nu -->
                                <label class="checkbox-inline">
                                	<form:checkbox path="activated"/>Activated</label>
                                <label class="checkbox-inline">
									<form:checkbox path="admin" />Admin</label>
                            </div>
                        </div>
                        <h5 style="color: blue">${mess}</h5>
                        <hr>
                        <form:button type="submit" class="btn btn-primary">Submit</form:button>
                        <a href="/account/register" class="btn btn-danger">Cancel</a>
                        <a href="/account/views" class="btn btn-success">Display Account</a>
                    </form:form>
                </div>
            </div>
        </div>
    </body>
</html>

