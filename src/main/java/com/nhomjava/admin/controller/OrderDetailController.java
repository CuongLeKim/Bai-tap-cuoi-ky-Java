package com.nhomjava.admin.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.nhomjava.admin.service.OrderDetailService;
import com.nhomjava.model.OrderDetail;

@Controller
@Transactional
public class OrderDetailController {

	@Autowired
	OrderDetailService orderDetailService;

	

	// Trang chủ dành cho employee xem đơn hàng
	@RequestMapping(value = "employee/orderDetail", method = RequestMethod.GET)
	public String indexOrder2(ModelMap model, HttpServletRequest request) {
		if (orderDetailService.getRowOrderDetail() < 10) {
			if (request.getParameter("page") == null) {
				model.addAttribute("listOrderDetail", orderDetailService.loadOrderDetailPage("1"));
			} else {
				model.addAttribute("listOrderDetail",
						orderDetailService.loadOrderDetailPage(request.getParameter("page")));
			}
			double paging = Math.ceil(Double.valueOf(orderDetailService.getRowOrderDetail()));
			model.addAttribute("rowCount", paging);
		} else {
			model.addAttribute("listOrderDetail", orderDetailService.getAllOrderDetail());
		}
		return "employee/orderDetail-home";
	}

	// Mở form sửa đơn hàng dành cho employee
	@RequestMapping(value = "employee/orderDetail/edit-orderDetail/{id}.htm", method = RequestMethod.GET)
	public String formEdit2(ModelMap model, @PathVariable("id") Integer id) {
		model.addAttribute("orderDetail", orderDetailService.getIDOrderDetail(id));
		return "admin/orderDetail-edit";
	}

	// Thực hiện sửa đơn hàng dành cho employee
	@RequestMapping(value = "employee/orderDetail/edit-orderDetail/{id}.htm", method = RequestMethod.POST)
	public String editOrder2(ModelMap model, @PathVariable("id") Integer id,
			@ModelAttribute("orderDetail") OrderDetail orderDetail) {
		orderDetailService.updateOrderDetail(orderDetail);
		model.addAttribute("listOrderDetail", orderDetailService.getAllOrderDetail());
		return "redirect:/employee/order";
	}

	// Thực hiện tìm kiếm employee
	@RequestMapping(value = "employee/orderDetail/search.htm", method = RequestMethod.GET)
	public String searchOrder2(ModelMap model, @RequestParam("search") String search) {
		model.addAttribute("listOrderDetail", orderDetailService.searchOrderDetail(search));
		return "employee/orderDetail-home";
	}
}
