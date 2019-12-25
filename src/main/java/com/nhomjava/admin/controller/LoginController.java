package com.nhomjava.admin.controller;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


import com.nhomjava.admin.service.EmployeeService;
import com.nhomjava.model.Employee;

@Controller
@Transactional
public class LoginController {

	@Autowired
	EmployeeService employeeService;
	@Autowired
	ServletContext application;
	@Autowired
	SessionFactory sessionFactory;
	@Autowired
	JavaMailSender mailSender;
	@Autowired
	HttpSession httpSession;

	

	// ==> Employee

	// Form Login
	@RequestMapping(value = "employee", method = RequestMethod.GET)
	public String formLogin2(ModelMap model) {
		model.addAttribute("loginForm", new Employee());
		return "employee/login";
	}

	// Xử Lý Login
	@RequestMapping(value = "employee", method = RequestMethod.POST)
	public String login2(ModelMap model, @ModelAttribute("loginForm") Employee employee, HttpServletRequest request,
			HttpServletResponse response, BindingResult result) {

		if (employee.getId().trim().length() == 0) {
			result.rejectValue("id", "error.account.id");
		} else if (employeeService.checkIdEmployee(employee.getId()) == 0) {
			result.rejectValue("id", "error.id.error");
		}
		if (employee.getPassword().trim().length() == 0) {
			result.rejectValue("password", "error.account.password");
		} else if (employeeService.checkPasswordEmployee(employee.getPassword()) == 0) {
			result.rejectValue("password", "error.password.error");
		}

		if (result.hasErrors()) {
			return "employee/login";
		} else {
			Employee login = employeeService.login(employee.getId(), employee.getPassword());
			if (login != null) {
				HttpSession session = request.getSession();
				session.setAttribute("employee", login);
				return "redirect:/employee/home";
			}
		}
		return "employee/login";
	}

	

	
	
	// Logout
	@RequestMapping(value = "employee/logout", method = RequestMethod.GET)
	public String logout2(HttpSession session, HttpServletRequest request, HttpServletResponse response) {
		session.removeAttribute("employee");
		return "redirect:/employee/home";
	}

}
