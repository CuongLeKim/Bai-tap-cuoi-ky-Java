<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="f"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>
<!doctype html>
<html lang="en">
<head>
<base href="${pageContext.servletContext.contextPath }/">
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<link rel="apple-touch-icon" sizes="76x76"
	href="login/images/apple-icon.png">
<link rel="icon" type="login/image/png" sizes="96x96"
	href="login/images/favicon.png">

<meta
	content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0'
	name='viewport' />
<meta name="viewport" content="width=device-width" />
<script src="assets/js/jquery-3.1.1.min.js"></script>
<title><s:message code="employee.login.text" /></title>

<link href="login/css/bootstrap.css" rel="stylesheet" />
<link href="login/css/coming-sssoon.css" rel="stylesheet" />

<!--     Fonts     -->
<link
	href="http://netdna.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.css"
	rel="stylesheet">
<link href='http://fonts.googleapis.com/css?family=Grand+Hotel'
	rel='stylesheet' type='text/css'>

</head>
<style type="text/css">
*[id$=errors] {
	color: red;
	font-style: italic;
}
</style>
<body>
	<nav class="navbar navbar-transparent navbar-fixed-top"
		role="navigation">
		<div class="container">
			<!-- Brand and toggle get grouped for better mobile display -->
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse"
					data-target="#bs-example-navbar-collapse-1">
					<span class="sr-only">Toggle navigation</span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
			</div>

			<!-- Collect the nav links, forms, and other content for toggling -->
			<div class="collapse navbar-collapse"
				id="bs-example-navbar-collapse-1">
				
			</div>
			<!-- /.navbar-collapse -->
		</div>
		<!-- /.container -->
	</nav>

	<div class="main">
		
		

		<div class="cover black" data-color="black">
		
		<a href="user/register"><img style="width: 100%","height="100%" 
						src="images/employee.jpg" ></a>
		</div>

		<!--   You can change the black color for the filter with those colors: blue, green, red, orange       -->

		<div class="container">
			<h1 class="logo cursivee">Shop CKC</h1>
		          -->

			<div class="content">
				<h1 class="motto">
					Hệ thống ADMIN
				</h1>
				<div class="subscribe">
					
					<div class="row">
						<div class="col-md-4 col-md-offset-4 col-sm6-6 col-sm-offset-3 ">
							<form:form class="form-inline" action="employee" method="post"
								commandName="loginForm">
								<div class="form-group">
									<label class="sr-only">Username</label>
									<form:input path="id" type="id"
										placeholder="Nhập tên đăng nhập"
										class="form-control transparent" />
								</div>
								<form:errors path="id" />
								<br>
								<br>
								<div class="form-group">
									<label class="sr-only">Password</label>
									<form:password path="password"
										placeholder="Nhập password"
										class="form-control transparent" />
								</div>
								<form:errors path="password" />
								<br>
								<br>
								<div class="form-group">
									<a href="employee/forgot.htm" type="submit"
										class="btn btn-primary btn-fill ">Quên mật khẩu</a>
									<button type="submit" class="btn btn-warning btn-fill">
										Đăng nhập
									</button>

								</div>

							</form:form>

						</div>
					</div>
				</div>
			</div>
		</div>
		
	</div>
</body>
<script src="login/js/jquery-1.10.2.js" type="text/javascript"></script>
<script src="login/js/bootstrap.min.js" type="text/javascript"></script>


<script>
	$(function() {
		$("a[data-lang]").click(function() {
			var lang = $(this).attr("data-lang");
			$.get("admin/home?lang=" + lang, function() {
				location.reload();
			});
			return false;
		});
	});
</script>
</html>
