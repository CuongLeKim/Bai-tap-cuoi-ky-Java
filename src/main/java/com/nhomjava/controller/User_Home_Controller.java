package com.nhomjava.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping(value = "user")
public class User_Home_Controller {

	@RequestMapping(value = "home")
	public String userHome() {
		return"user/index";
	}
	@RequestMapping(value = "register", method = RequestMethod.GET)
	public String formRegister() {
		//model.addAttribute("register", new Customer());
		return "user/register";
	}
	@RequestMapping(value = "login", method = RequestMethod.GET)
	public String formLogin() {
		//model.addAttribute("register", new Customer());
		return "user/login";
}
}
