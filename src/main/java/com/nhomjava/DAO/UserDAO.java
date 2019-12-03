package com.nhomjava.DAO;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.nhomjava.entity.UserEtity;

@Repository
@Transactional
public class UserDAO {
@Autowired
SessionFactory sessionFactory;
//them khach hang
public void ThemUser(UserEtity userEtity) {
	Session session =sessionFactory.getCurrentSession();
	
	
	session.save(userEtity);
}
// Lấy id khách hàng

public UserEtity getIDUserEtity(Integer id) {
	Session session = sessionFactory.getCurrentSession();
	UserEtity userEtity = (UserEtity) session.get(UserEtity.class, id);
	return userEtity;
}


//Lấy danh sách khách hàng

@SuppressWarnings("unchecked")
public List<UserEtity> getAllUserEtity() {
	Session session = sessionFactory.getCurrentSession();
	List<UserEtity> list = session.createQuery("FROM user").list();
	return list;
}


//Kiểm tra email tồn tại chưa

@SuppressWarnings("unchecked")
public int checkEmail(String email) {
	Session session = sessionFactory.getCurrentSession();
	List<UserEtity> list = session.createQuery("FROM user WHERE Email = '" + email + "'").list();
	return list.size();
}

//Kiểm tra mật khẩu

@SuppressWarnings("unchecked")
public int checkPassword(String password) {
	Session session = sessionFactory.getCurrentSession();
	List<UserEtity> list = session.createQuery("FROM user WHERE Password = '" + password + "'").list();
	return list.size();
}
}
