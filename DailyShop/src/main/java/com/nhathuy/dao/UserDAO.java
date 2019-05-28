package com.nhathuy.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.context.annotation.ScopedProxyMode;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.nhathuy.daoimpl.UserDaoImpl;
import com.nhathuy.entity.User;

@Repository
@Transactional
@Scope(proxyMode = ScopedProxyMode.TARGET_CLASS)
public class UserDAO implements UserDaoImpl {

	@Autowired
	SessionFactory sessionFactory;

	@Override
	public boolean themMoi(User user) {
		Session session = sessionFactory.getCurrentSession();
		int id = (int) session.save(user);

		return id > 0 ? true : false;
	}

	@Override
	public User getUser(String email) {
		Session session = sessionFactory.getCurrentSession();
		User user = (User) session.createQuery("from User where Email = :email").setParameter("email", email)
				.getSingleResult();

		return user;
	}

	@Override
	public boolean kiemTraDangNhap(String email, String password) {
		try {
			Session session = sessionFactory.getCurrentSession();
			int id = (int) session.createQuery("select idUser from User where Email = :email and Password = :pass")
					.setParameter("email", email).setParameter("pass", password).getSingleResult();
			return id > 0 ? true : false;
		} catch (Exception e) {
			e.printStackTrace();
		}

		return false;
	}

	@Override
	public boolean isEmailDuplicate(String email) {
		String s = null;
		try {
			Session session = sessionFactory.getCurrentSession();
			s = (String) session.createQuery("select email from User where email = :email").setParameter("email", email)
					.getSingleResult();
		} catch (Exception e) {
			e.printStackTrace();
		}

		return s != null ? true : false;
	}

	@Override
	public List<User> getList() {
		return sessionFactory.getCurrentSession().createQuery("from User", User.class).getResultList();
	}
}
