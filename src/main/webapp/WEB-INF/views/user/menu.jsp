<%@page pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt"%>
<style>
#cart-image {
	background-size: 100% 100%;
}
</style>

<div id="sidebar" class="span3">
	
	<ul class="nav nav-tabs nav-stacked">
		<li class="subMenu open"><a> NHÀ CUNG CẤP </a>
			<ul>
				<!-- Show Nhà Sản Xuất -->
				<c:forEach var="producer" items="${producer}">
					<li><a href="user/product/list-by-producer/${producer.id}.htm">
							<i class="icon-chevron-right"></i>${producer.nameProducer } <%-- <c:choose>
							<c:when test="${language == 'en'}">${c.name}</c:when>
							<c:otherwise>${c.nameVN}</c:otherwise>
						</c:choose> --%>
					</a></li>
				</c:forEach>
			</ul></li>
	</ul>

	<br>
	<ul class="nav nav-tabs nav-stacked">
		<li class="subMenu open"><a>HÀNG ĐẶC BIỆT</a>
			<ul>
				<li><a href="user/product/type/best.htm"><i
						class="icon-chevron-right"></i>Hàng bán chạy</a></li>
				<li><a href="user/product/type/latest.htm"><i
						class="icon-chevron-right"></i>Hàng mới</a></li>
				<li><a href="user/product/type/saleoff.htm"><i
						class="icon-chevron-right"></i>Hàng giảm giá</a></li>
				<li><a href="user/product/type/favorite.htm"><i
						class="icon-chevron-right"></i>Hàng yêu thích</a></li>
				<li><a href="user/product/type/views.htm"><i
						class="icon-chevron-right"></i>Hàng xem nhiều</a></li>
				<li><a href="user/product/type/special.htm"><i
						class="icon-chevron-right"></i>Hàng đặc biệt</a></li>
			</ul></li>
	</ul>

	<br>
	

</div>
