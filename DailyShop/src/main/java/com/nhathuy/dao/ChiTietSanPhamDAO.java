package com.nhathuy.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.context.annotation.ScopedProxyMode;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.nhathuy.daoimpl.ChiTietSanPhamDaoImpl;
import com.nhathuy.entity.ChiTietSanPham;

@Repository
@Transactional
@Scope(proxyMode = ScopedProxyMode.TARGET_CLASS)
public class ChiTietSanPhamDAO implements ChiTietSanPhamDaoImpl {

	@Autowired
	SessionFactory sessionFactory;

	@Override
	public List<ChiTietSanPham> getListByIdSanPham(int idSanPham) {
		List<ChiTietSanPham> ds = null;
		try {
			Session session = sessionFactory.getCurrentSession();
			ds = session.createQuery("from ChiTietSanPham where idSanPham = :id", ChiTietSanPham.class)
					.setParameter("id", idSanPham).getResultList();
			return ds;
		} catch (Exception e) {
			e.printStackTrace();
		}

		return ds;
	}

	@Override
	public ChiTietSanPham get(int idChiTiet) {
		ChiTietSanPham chitiet = null;
		try {
			Session session = sessionFactory.getCurrentSession();
			chitiet = (ChiTietSanPham) session.createQuery("from ChiTietSanPham where IdChiTietSanPham = :id")
					.setParameter("id", idChiTiet).getSingleResult();
			return chitiet;
		} catch (Exception e) {
			e.printStackTrace();
		}

		return chitiet;
	}

	@Override
	public boolean add(ChiTietSanPham chitietsanpham) {
		Session session = sessionFactory.getCurrentSession();
		int id = (int) session.save(chitietsanpham);
		return id > 0 ? true : false;
	}

	@Override
	public boolean tangSoLuong(int idChiTiet, int soluong) {
		Session session = sessionFactory.getCurrentSession();
		ChiTietSanPham chitiet = get(idChiTiet);
		int n = chitiet.getSoLuong();
		chitiet.setSoLuong(n + soluong);
		session.save(chitiet);

		return true;
	}

	@Override
	public boolean giamSoLuong(int idChiTiet, int soluong) {
		Session session = sessionFactory.getCurrentSession();
		ChiTietSanPham chitiet = get(idChiTiet);
		int n = chitiet.getSoLuong();

		if (n > 0) {
			chitiet.setSoLuong(n - soluong);
			session.save(chitiet);
			return true;
		}

		return false;
	}
}
