package com.nhathuy.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.context.annotation.ScopedProxyMode;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.nhathuy.daoimpl.DanhMucSanPhamDaoImpl;
import com.nhathuy.entity.DanhMucSanPham;

@Repository
@Transactional
@Scope(proxyMode = ScopedProxyMode.TARGET_CLASS)
public class DanhMucSanPhamDAO implements DanhMucSanPhamDaoImpl {

	@Autowired
	SessionFactory sessionFactory;

	@Override
	public List<DanhMucSanPham> layDanhSach() {
		Session session = sessionFactory.getCurrentSession();
		List<DanhMucSanPham> ds = session.createQuery("from DanhMucSanPham", DanhMucSanPham.class).getResultList();

		return ds;
	}

	@Override
	public DanhMucSanPham get(int idDanhMuc) {
		Session session = sessionFactory.getCurrentSession();

		return (DanhMucSanPham) session.createQuery("from DanhMucSanPham where IdDanhMuc = :id")
				.setParameter("id", idDanhMuc).getSingleResult();
	}
}
