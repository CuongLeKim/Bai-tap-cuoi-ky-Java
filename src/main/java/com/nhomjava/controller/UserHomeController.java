package com.nhomjava.controller;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.nhomjava.entity.UserEtity;

@Controller
@Transactional
@RequestMapping(value = "user")
public class UserHomeController {
	@Autowired
	ServletContext application;
	@Autowired
	HttpSession httpSession;
	@Autowired
	SessionFactory sessionFactory;
	
	
	@RequestMapping(value = "home")
	public String userHome() {
		
		return"user/index";
	}
	
	//Mở form dk
	
	
	@RequestMapping(value="register",method =RequestMethod.GET)	
	public String formRegister(ModelMap model) {
		model.addAttribute("register" ,new UserEtity());
	
		
		return "user/register";
	}
	//Thuc hien DK
	@RequestMapping(value = "register",method = RequestMethod.POST)
	public String register(ModelMap model,@ModelAttribute("register") UserEtity userEtity, HttpServletResponse request) {
		Session session=sessionFactory.getCurrentSession();
		session.save(userEtity);
		String a=userEtity.getFullName();
		System.out.println(a);
		model.addAttribute("message","Đăng ký thành công");
		
		return "user/register";
	}
	
	// Mở form đăng nhập
		@RequestMapping(value = "login" ,method = RequestMethod.GET)
		public String formLogin(ModelMap model, @CookieValue(defaultValue = "") String id,
				@CookieValue(defaultValue = "") String pw) {
			UserEtity userEtity=new UserEtity();
			
			userEtity.setPassword(pw);
			model.addAttribute("user",userEtity);
			return "user/login";
		}

		// Thực hiện đăng nhập
		@RequestMapping( value = "login" ,method = RequestMethod.POST)
		public String login(ModelMap model, @ModelAttribute("user") UserEtity user,	HttpServletResponse response) {

			UserEtity userEtity = new UserEtity();
			userEtity.setId(user.getId());

			Session session = sessionFactory.getCurrentSession();
			try {
				session.refresh(userEtity);

				if (user.getPassword().equals(userEtity.getPassword())) {
					
						httpSession.setAttribute("user", userEtity);
						
					
				} else {
					model.addAttribute("message", "Mật khẩu không đúng !");
				}
			} catch (Exception ex) {
				model.addAttribute("message", "Tài khoản không đúng !");
			}
			return "user/login";
		}
}

