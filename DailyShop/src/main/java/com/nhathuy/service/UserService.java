package com.nhathuy.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.nhathuy.dao.UserDAO;
import com.nhathuy.daoimpl.UserDaoImpl;
import com.nhathuy.entity.User;

@Service
public class UserService implements UserDaoImpl {

	@Autowired
	UserDAO userDAO;

	@Override
	public boolean themMoi(User user) {
		return userDAO.themMoi(user);
	}

	@Override
	public User getUser(String email) {
		return userDAO.getUser(email);
	}

	@Override
	public boolean kiemTraDangNhap(String email, String password) {
		return userDAO.kiemTraDangNhap(email, password);
	}

	@Override
	public boolean isEmailDuplicate(String email) {
		return userDAO.isEmailDuplicate(email);
	}

	@Override
	public List<User> getList() {
		return userDAO.getList();
	}
}
