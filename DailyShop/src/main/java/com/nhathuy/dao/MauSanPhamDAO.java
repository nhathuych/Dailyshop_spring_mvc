package com.nhathuy.dao;

import java.util.List;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.context.annotation.ScopedProxyMode;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.nhathuy.daoimpl.MauSanPhamDaoImpl;
import com.nhathuy.entity.MauSanPham;

@Repository
@Transactional
@Scope(proxyMode = ScopedProxyMode.TARGET_CLASS)
public class MauSanPhamDAO implements MauSanPhamDaoImpl {

	@Autowired
	SessionFactory sessionFactory;

	@Override
	public List<MauSanPham> layDanhSach() {
		return sessionFactory.getCurrentSession().createQuery("from MauSanPham", MauSanPham.class).getResultList();
	}
}
