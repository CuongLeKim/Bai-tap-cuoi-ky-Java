package com.nhomjava.admin.controller;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.nhomjava.admin.service.CustomerService;
import com.nhomjava.model.Customer;

@Controller
@Transactional
@RequestMapping(value = "employee/customer")
public class CustomerController {

	@Autowired
	private CustomerService customerService;
	@Autowired
	ServletContext application;

	// Trang chủ
	@RequestMapping(method = RequestMethod.GET)
	public String home(ModelMap model, HttpServletRequest request, HttpServletResponse response) {
		if (customerService.getRowCustomer() > 10) {
			if (request.getParameter("page") == null) {
				model.addAttribute("listCustomer", customerService.loadCustomerPage("1"));
			} else {
				model.addAttribute("listCustomer", customerService.loadCustomerPage(request.getParameter("page")));
			}
			double paging = Math.ceil(Double.valueOf(customerService.getRowCustomer()) / 10);
			model.addAttribute("rowCount", paging);
		} else {
			model.addAttribute("listCustomer", customerService.getAllCustomer());
		}
		return "employee/customer-home";
	}

	
	// Xóa khách hàng
	@RequestMapping(value = "delete-customer/{id}.htm", method = RequestMethod.GET)
	public String deleteCustomer(ModelMap model, @PathVariable("id") String id,
			@ModelAttribute("customer") Customer customer) {
		customerService.deleteCustomer(customer);
		return "redirect:/employee/customer";
	}

	// Tìm kiếm khách hàng
	@RequestMapping(value = "search.htm", method = RequestMethod.GET)
	public String searchCustomer(ModelMap model, @RequestParam("search") String search) {
		model.addAttribute("listCustomer", customerService.searchCustomer(search));
		return "employee/customer-home";
	}

}
