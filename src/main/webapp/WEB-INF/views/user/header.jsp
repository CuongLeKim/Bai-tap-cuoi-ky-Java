<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt"%>


<base href="${pageContext.servletContext.contextPath}/">
<div id="header">
	<div class="container">
		<div id="welcomeLine" class="row">

			<div class="span6">
				<c:choose>
					<c:when test="${ sessionScope.user.fullName == null }">
						<a href="#"><span class="btn btn-sm btn-success">Quên
								mật khẩu</span></a>
					</c:when>
					<c:when test="${ sessionScope.user.fullName != null}">
						<span>Xin chào: <strong>
								${sessionScope.user.fullName }</strong></span>
						<a href="#"
							onclick="return confirm ('Bạn chắc chắn muốn đăng xuất ?')"><span
							class="btn btn-mini btn-danger">Đăng xuất</span></a>
					</c:when>
				</c:choose>
			</div>
			<div class="span6">
				<div class="pull-right">
					 
						<a href="#"><span id="cart-amount"
						class="btn btn-danger btn-sm">$ <fmt:formatNumber
								value="${cart.amount}" pattern="###,###" /> VNĐ
					</span> </a> <a href="#"><span id="cart-count"
						class="btn btn-sm btn-primary"><i
							class="icon-shopping-cart icon-white"></i> Sản
							phẩm trong giỏ hàng</span> </a>
				</div>
			</div>
		</div>
		<!-- Navbar ================================================== -->
		<div id="logoArea" class="navbar">
			<a id="smallScreen" data-target="#topMenu" data-toggle="collapse"
				class="btn btn-navbar"> <span class="icon-bar"></span> <span
				class="icon-bar"></span> <span class="icon-bar"></span>
			</a>
			<div class="navbar-inner">
				<a class="brand" href="user/home"><h1>Shop CKC</h1></a>
				<form action="user/product/search-product.htm"
					class="form-inline navbar-search" method="post">
					<input id="" name="search" type="text">
					
					<button type="submit" id="submitButton" class="btn btn-danger">Tìm
						kiếm</button>
				</form>
				<ul id="topMenu" class="nav pull-right">
					<li class=""><a href="user/home">Trang chủ</a></li>
					<li class=""><a href="#">Giới thiệu</a></li>
					<li class=""><a href="#">Góp ý</a></li>
					<li class=""><a href="#">Liên hệ</a></li>
					<li class=""><a href="#">Sản phẩm</a></li>
				
						<a href="<c:url value="#" />" >List Customer</a>
							<li class=""><a href="<c:url value="user/register" />"><span
									class="btn-xs btn-info">Đăng ký</span></a></li>
							<li class=""><a href="user/login"><span
									class="btn-xs btn-success">Đăng nhập</span></a></li>
				
						
							
					
					 
				</ul>
			</div>
		</div>
	</div>
</div>
<script>
	$(function() {
		$(".language a").click(function() {
			$.ajax({
				url : "user/set-language.htm?language=" + $(this).attr("href"),
				success : function() {
					location.reload();
				}
			});
			return false;
		});
	});

	
</script>