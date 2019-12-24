<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="s"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<base href="${pageContext.servletContext.contextPath }/" />
<meta charset="utf-8">
<title>Shop CKC</title>
</head>
<script src='https://www.google.com/recaptcha/api.js'></script>
<script src="themes/js/jquery-1.7.1.min.js"></script>
<script src="themes/js/jquery.validate.min.js"></script>
<script type="text/javascript">
	$(function() {
		$("#order").validate({
			rules : {
				requireDate : {
					required : true
				},
				receiver : {
					required : true
				},
				address : {
					required : true
				},
				numberPhone : {
					required : true
				}
			},
			messages : {
				requireDate : {
					required : 'Vui lòng nhập ngày nhận !'
				},
				receiver : {
					required : 'Vui lòng nhập tên người nhận !'
				},
				address : {
					required : 'Vui lòng nhập địa chỉ của bạn !'
				},
				numberPhone : {
					required : 'Vui lòng nhập số điện thoại của bạn !'
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
				<div class="span9">
					<ul class="breadcrumb">
						<li><a href="user/home">Trang chủ</a> <span class="divider">/</span></li>
						<li class="active">Kiểm tra đơn đặt hàng</li>
					</ul>
			
					<div class="well">
						<h3>Kiểm tra đơn đặt hàng</h3>
						<label class="error">${message }</label>
						<form:form id="order" role="form" modelAttribute="order"
							class="form-horizontal" action="order/purchase" method="post"
							novalidate="novalidate">
							<div class="control-group">
								<label class="control-label">Tên khách hàng: </label>
								<div class="controls">
									<form:input path="customer.id" name="id"
										class="form-control valid" placeholder="Username"
										readonly="true" />
								</div>
							</div>
							<div class="control-group">
								<label class="control-label">Ngày đặt:</label>
								<div class="controls">
									<form:input path="orderDate" name="orderDate"
										class="form-control error" placeholder="Order Date"
										readonly="true" />
								</div>
							</div>
							
							<div class="control-group">
								<label class="control-label">Ngày yêu cầu: <sup
									style="color: red">*</sup></label>
								<div class="controls">
									<form:input path="requireDate" id="requireDate"
										name="requireDate" class="form-control error"
										placeholder="Nhập ngày yêu cầu" />
								</div>
							</div>
							<div class="control-group">
								<label class="control-label">Tên người nhận: <sup
									style="color: red">*</sup></label>
								<div class="controls">
									<form:input path="receiver" name="receiver"
										class="form-control error" placeholder="Nhập tên người nhận" />
								</div>
							</div>
							<div class="control-group">
								<label class="control-label">Số điện thoại: <sup
									style="color: red">*</sup></label>
								<div class="controls">
									<form:input path="numberPhone" name="numberPhone"
										class="form-control error" placeholder="Nhập số điện thoại" />
								</div>
							</div>
							
								
							<div class="control-group">
								<label class="control-label">Địa chỉ: <sup
									style="color: red">*</sup></label>
								<div class="controls">
									<form:input path="address" name="address"
										class="form-control error" placeholder="Nhập địa chỉ" />
								</div>
							</div>
							<div class="control-group">
								<label class="control-label">Thông tin: </label>
								<div class="controls">
									<form:textarea path="description" rows="5" name="description"
										class="form-control error" placeholder="Nhập thông tin" />
								</div>
							</div>
							<div class="control-group">
								<div class="controls">
									<input class="btn btn-large btn-danger" type="submit"
										value="Đặt Hàng">
								</div>
							</div>
							<form:hidden path="status" value="1" />
						</form:form>
						<hr class="soft">
						<table class="table table-bordered">
							<thead>
								<tr>

									<th>Tên sản phẩm</th>
									<th>Hình ảnh</th>	
									<th>Đơn giá</th>								
									<th>Số lượng</th>
									<th>Giảm giá</th>
									<th>Thành tiền</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="p" items="${cart.items}">
									<tr>
										<td>${p.nameProduct}</td>
										<td><img src="images/products/${p.photo}" height="80px"
											width="150px" /></td>
										<td><fmt:formatNumber value="${p.unitPrice}"
												pattern="###,###" /> VNĐ</td>
										<td>${p.quantity}</td>
										<td><fmt:formatNumber value="${p.discount}"
												type="percent" /></td>
										<td><fmt:formatNumber
												value="${p.unitPrice*p.quantity*(1-p.discount)}"
												pattern="###,###"></fmt:formatNumber> VNĐ</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>

				</div>
			</div>
		</div>
	</div>
	<jsp:include page="footer.jsp"></jsp:include>
</body>


<link href="assets/jquery-ui/jquery-ui.min.css" rel="stylesheet" />
<script src="assets/jquery-ui/jquery-ui.min.js"></script>
<script>
	$(function() {
		$(".requireDate").datepicker({
			dateFormat : 'dd/mm/yy'
		});
		$("input#requireDate").datepicker({
			dateFormat : 'dd/mm/yy'
		});
	});
</script>


</html>