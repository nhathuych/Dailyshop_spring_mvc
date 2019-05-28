package com.nhathuy.daoimpl;

import java.util.List;

import com.nhathuy.entity.User;

public interface UserDaoImpl {
	boolean themMoi(User user);
	User getUser(String email);
	boolean kiemTraDangNhap(String email, String password);
	boolean isEmailDuplicate(String email);
	List<User> getList();	// phục dụ cho dashboard
}
