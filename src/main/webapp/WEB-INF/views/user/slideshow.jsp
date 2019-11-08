<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>

<%-- <base href="${pageContext.servletContext.contextPath}/"> --%>
<div id="carouselBlk">
	<div id="myCarousel" class="carousel slide">
		<div class="carousel-inner">
			<div class="item">
				<div class="container">
					<a href="user/register"><img style="width: 100%"
						src="slideshow/images/slide1.png" alt="special offers"></a>
					
				</div>
			</div>
			<div class="item active">
				<div class="container">
					<a href="user/register"><img style="width: 100%"
						src="slideshow/images/slide2.png" alt=""></a>
					
				</div>
			</div>
			<div class="item">
				<div class="container">
					<a href="user/register"><img style="width: 100%" src="slideshow/images/slide3.png"
						alt=""></a>
					

				</div>
			</div>
			<div class="item">
				<div class="container">
					<a href="user/register"><img style="width: 100%" src="slideshow/images/slide4.png"
						alt=""></a>
					

				</div>
			</div>
			<div class="item">
				<div class="container">
					<a href="user/register"><img style="width: 100%" src="slideshow/images/slide5.png"
						alt=""></a>
					
				</div>
			</div>
			
		</div>
		<a class="left carousel-control" href="#myCarousel" data-slide="prev">‹</a>
		<a class="right carousel-control" href="#myCarousel" data-slide="next">›</a>
	</div>
</div>
