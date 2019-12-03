<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>

<base href="${pageContext.servletContext.contextPath}/">
<!-- Bootstrap style -->
<link id="callCss" rel="stylesheet"
	href="themes/bootshop/bootstrap.min.css" media="screen" />
<link href="themes/css/base.css" rel="stylesheet" media="screen" />
<!-- Bootstrap style responsive -->
<link href="themes/css/bootstrap-responsive.min.css" rel="stylesheet" />
<link href="themes/css/font-awesome.css" rel="stylesheet"
	type="text/css">
<!-- Google-code-prettify -->
<link href="themes/js/google-code-prettify/prettify.css"
	rel="stylesheet" />
<!-- fav and touch icons -->
<link rel="shortcut icon" href="themes/images/ico/favicon.ico">
<link rel="apple-touch-icon-precomposed" sizes="144x144"
	href="themes/images/ico/apple-touch-icon-144-precomposed.png">
<link rel="apple-touch-icon-precomposed" sizes="114x114"
	href="themes/images/ico/apple-touch-icon-114-precomposed.png">
<link rel="apple-touch-icon-precomposed" sizes="72x72"
	href="themes/images/ico/apple-touch-icon-72-precomposed.png">
<link rel="apple-touch-icon-precomposed"
	href="themes/images/ico/apple-touch-icon-57-precomposed.png">
<style type="text/css" id="enject"></style>
<div id="footerSection">
	<div class="container">
		<div class="row">
			<div class="span3">
				<c:choose>
					<c:when test="${ sessionScope.user.fullName != null}">
						<h5>TÀI KHOẢN</h5>
						<a href="#">ĐỔI
							MẬT KHẨU</a>
						<a href="#">CẬP
							NHẬT THÔNG TIN</a>
						<a href="#">XEM ĐƠN HÀNG</a>
						<a href="#">SẢN PHẨM ĐÃ MUA</a>
					</c:when>
				</c:choose>

			</div>
			<div class="span3">
				<h5>THÔNG TIN</h5>
				<a href="#">GIỚI THIỆU</a> 
				<a href="#">GÓP Ý</a> 
				<a href="#">LIÊN HỆ</a>
				<a href="#">HỎIĐÁP</a>

			</div>
			
			<div class="span3">
				<h5>SẢN PHẨM</h5>
				<a href="#">MỚI NHẤT</a>
				<a href="#">GIẢM GIÁ</a> 
				<a href="#">ĐẶC BIỆT</a>
				<a href="#">XEM NHIỀU</a>

			</div>
			<div id="socialMedia" class="span3 pull-right">
				<h5>LIÊN HỆ VỚI CHÚNG TÔI</h5>
				<a href="https://www.facebook.com/cuong.lekim.5682" target="blank"><img
					width="60" height="60"  src="themes/images/facebook.png"
					title="facebook" alt="facebook"></a>	
			</div>
		</div>
		<div class="pull-right" style="font-size: 20px;">
			<b>Hotline hỗ trợ khách hàng</b>
		</div>
		<br>
		<p class="pull-right">Tel: 0344684483 
			</p>
			<br>
		<div  style="font-size: 15px;">
			<p><center>©Copyright by ShopCKC 2019    </center></p>
		</div>
		



	
	

<!-- Placed at the end of the document so the pages load faster ============================================= -->
<script src="themes/js/jquery.js" type="text/javascript"></script>
<script src="themes/js/bootstrap.min.js" type="text/javascript"></script>
<script src="themes/js/google-code-prettify/prettify.js"></script>

<script src="themes/js/bootshop.js"></script>
<script src="themes/js/jquery.lightbox-0.5.js"></script>

<script src="themes/js/jquery-1.7.1.min.js"></script>
<script src="themes/js/jquery.validate.min.js"></script>


