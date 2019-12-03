package com.nhomjava.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.nhomjava.DAO.UserDAO;
import com.nhomjava.entity.UserEtity;

@Service("userService")
@Transactional
public class UserService {
	
	@Autowired
	UserDAO userDAO;
public void ThemUser(UserEtity userEtity) {
	userDAO.ThemUser(userEtity);
	
}

//Lấy id khách hàng
 public UserEtity getIDUserEtity(Integer id) {
	 
	 return userDAO.getIDUserEtity(id);
 }
 
/*public UserEtity getIDUserEtity(Integer id) {
	return userDAO.getIDUserEtity(id);
}*/

// Lấy danh sách khách hàng

public List<UserEtity> getAllUserEtity() {
	return userDAO.getAllUserEtity();
}

// Kiểm tra email
 
public int checkEmail(String email) {
	return userDAO.checkEmail(email);
}

// Kiểm tra password

public int checkPassword(String password) {
	return userDAO.checkPassword(password);
}

}
