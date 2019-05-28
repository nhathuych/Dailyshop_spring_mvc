package com.nhathuy.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.context.annotation.ScopedProxyMode;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.nhathuy.daoimpl.SizeSanPhamDaoImpl;
import com.nhathuy.entity.SizeSanPham;

@Repository
@Transactional
@Scope(proxyMode = ScopedProxyMode.TARGET_CLASS)
public class SizeSanPhamDAO implements SizeSanPhamDaoImpl {

	@Autowired
	SessionFactory sessionFactory;

	@Override
	public List<SizeSanPham> layDanhSach() {
		Session session = sessionFactory.getCurrentSession();
		List<SizeSanPham> ds = session.createQuery("from SizeSanPham", SizeSanPham.class).getResultList();

		return ds;
	}
}
