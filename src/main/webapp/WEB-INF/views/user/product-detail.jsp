<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="s"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="f"%>
<!DOCTYPE html>
<html lang="en">
<head>
<base href="${pageContext.servletContext.contextPath }/" />
<meta charset="utf-8">
<title>Shop CKC</title>
</head>
<script src="themes/js/jquery-1.7.1.min.js"></script>
<script src="themes/js/jquery.validate.min.js"></script>
<script type="text/javascript">
	$(function() {
		$("#feedback").validate({
			rules : {
				from : {
					required : true,
					email : true
				},
				to : {
					required : true,
					email : true
				},
				subject : {
					required : true
				},
				body : {
					required : true
				}
			},
			messages : {
				from : {
					required : 'Vui lòng nhập địa chỉ email người gửi !',
					email : 'Vui lòng nhập đúng địa chỉ email !'
				},
				to : {
					required : 'Vui lòng nhập địa chỉ email người nhận',
					email : 'Vui lòng nhập đúng địa chỉ email !'
				},
				subject : {
					required : 'Vui lòng nhập chủ đề !'
				},
				body : {
					required : 'Vui lòng nhập nội dung !'
				}
			}
		});
	});
</script>
<style>
label.error {
	color: red;
	font-style: italic;
	padding-left: 33px;

}
</style>
<body>
	<jsp:include page="header.jsp"></jsp:include>
	<div id="mainBody">
		<div class="container">
			<div class="row">
				<jsp:include page="menu.jsp"></jsp:include>
				<!--  -->
				<div class="span9">
					<ul class="breadcrumb">
						<li><a href="user/home">Home</a> <span class="divider">/</span></li>
						<li><a href="user/product/list.htm">Products</a> <span
							class="divider">/</span></li>
						<li class="active">Product Details</li>
					</ul>
					<div class="row">
						<div id="gallery" class="span3">
							<a href="images/products/${product.photo }"
								title="${product.nameProduct }"> <img
								src="images/products/${product.photo }" style="width: 100%"
								alt="">
							</a>								
						</div>
						<div class="span6">
							<h3>${product.nameProduct }<span
									class="btn btn-warning pull-right">Giảm Giá: <c:choose>
										<c:when test="${product.discount == null}">0%</c:when>
										<c:when test="${product.discount == 0}">0%</c:when>
										<c:otherwise>
											<f:formatNumber value="${product.discount }" type="percent" />
										</c:otherwise>
									</c:choose>
								</span>
							</h3>

							<table class="table table-striped"
								style="font-stretch: ultra-condensed;">
								<tbody>
									<tr>
										<td style="font-size: 16px; font-weight: bold;" colspan="2"
											align="center">Thông Tin Sản Phẩm Chi Tiết</td>
									</tr>
									<tr>
										<td>Mã hàng hóa</td>
										<td>: ${product.id }</td>
									</tr>
									
									<tr>
										<td>Nhà cung cấp</td>
										<td>: ${product.producer.nameProducer }</td>
									</tr>
									<tr>
										<td>Đơn giá</td>
										<td>: <f:formatNumber value="${product.unitPrice }"
												pattern="###,###" /> VNĐ
										</td>
									</tr>
									<tr>
										<td>Ngày sản xuất</td>
										<td>: <f:formatDate value="${product.productDate }"
												pattern="dd/MM/yyy" /></td>
									</tr>
									<tr>
										<td>Số lượng còn</td>
										<td>: ${product.quantity }</td>
									</tr>
									
									<tr>
										<td>Đặc điểm</td>
										<td>: <c:choose>
												<c:when test="${product.special == true }">
													<span class="btn btn-warning">Hàng đặc biệt</span>
												</c:when>
												<c:when test="${product.latest == true }">
													<span class="btn btn-success">Hàng mới nhất</span>
												</c:when>
												<c:when test="${product.special == false }">
													Không có
												</c:when>
												<c:when test="${product.latest == false }">
												Không có
												</c:when>
											</c:choose>
										</td>
									</tr>
									<tr>
										<td>Tình trạng</td>
										<td>: <c:choose>
												<c:when test="${product.quantity < 1 }">
													<span class="btn btn-warning">Hàng sắp về</span>
												</c:when>
												<c:when test="${product.quantity >= 1}">
													<span class="btn btn-success">Hàng có sẵn</span>
												</c:when>
											</c:choose></td>
									</tr>
									
								</tbody>
							</table>
							<hr class="soft">

							<div class="control-group">
								<div class="controls">
									<label class="control-label"><span><f:formatNumber
												value="${product.unitPrice*(1-product.discount) }"
												pattern="###,###" /> VNĐ</span></label>
							
									<a href="shopping-cart/add/${product.id }" type="submit"
										class="btn btn-large btn-success pull-right"> Thêm vào giỏ hàng
										<i class=" icon-shopping-cart"></i>
									</a>
								</div>
							</div>


							<hr class="soft">
						</div>
						<div class="span9">
							<p>${product.description }</p>
							<hr class="soft">
						</div>
						<!--  -->
						<div class="span9">
							<ul id="productDetail" class="nav nav-tabs">
								<li class=""><a href="#comment" data-toggle="tab">Bình
										luận</a></li>
								
							</ul>
							<div id="myTabContent" class="tab-content">
								<!-- Bình luận -->
								<div class="tab-pane fade " id="comment">
									<div class="fb-comments" data-width="860px" data-numposts="10"></div>
								</div>
								
							</div>
						</div>
						<!--  -->
					</div>
				</div>
			</div>
		</div>

	</div>
	<jsp:include page="footer.jsp"></jsp:include>
</body>

<div id="fb-root"></div>
<script>
	(function(d, s, id) {
		var js, fjs = d.getElementsByTagName(s)[0];
		if (d.getElementById(id))
			return;
		js = d.createElement(s);
		js.id = id;
		js.src = 'https://connect.facebook.net/vi_VN/sdk.js#xfbml=1&version=v2.12&appId=830930687115334';
		fjs.parentNode.insertBefore(js, fjs);
	}(document, 'script', 'facebook-jssdk'));
</script>

</html>