package com.nhomjava.controller;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.nhomjava.model.Category;
import com.nhomjava.model.Producer;
import com.nhomjava.model.Product;
import com.nhomjava.other.ShoppingCart;

@Controller
@Transactional
@RequestMapping(value = "user")
public class UserHomeContoller {

	@Autowired
	JavaMailSender mailSender;
	@Autowired
	SessionFactory sessionFactory;

	@RequestMapping(value = "home")
	public String userHome() {
		return "user/index";
	}

	@Autowired
	protected ShoppingCart cart;

	@ModelAttribute("cart")
	public ShoppingCart getShoppingCart() {
		return cart;
	}

	@SuppressWarnings("unchecked")
	@ModelAttribute("category")
	public List<Category> getCategory() {
		Session session = sessionFactory.getCurrentSession();
		return session.createQuery("FROM Category").list();
	}

	@SuppressWarnings("unchecked")
	@ModelAttribute("producer")
	public List<Producer> getProducer() {
		Session session = sessionFactory.getCurrentSession();
		return session.createQuery("FROM Producer").list();
	}

	@SuppressWarnings("unchecked")
	@ModelAttribute("saleOffProducts")
	public List<Product> get12SaleOffProducts() {
		Session session = sessionFactory.getCurrentSession();
		String hql = "FROM Product p WHERE p.status = 1 AND p.discount > 0 ORDER BY p.discount DESC";
		Query query = session.createQuery(hql);
		query.setMaxResults(9);
		return query.list();
	}
}
