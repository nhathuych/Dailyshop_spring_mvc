package com.nhathuy.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.context.annotation.ScopedProxyMode;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.nhathuy.daoimpl.HoaDonDaoImpl;
import com.nhathuy.entity.HoaDon;

@Repository
@Transactional
@Scope(proxyMode = ScopedProxyMode.TARGET_CLASS)
public class HoaDonDAO implements HoaDonDaoImpl {

	@Autowired
	SessionFactory sessionFactory;

	@Override
	public boolean themHoaDon(HoaDon hoaDon) {
		Session session = sessionFactory.getCurrentSession();
		int id = (int) session.save(hoaDon);

		return id > 0 ? true : false;
	}

	@Override
	public List<HoaDon> layDanhSach(int startPosition, int maxResult) {
		Session session = sessionFactory.getCurrentSession();

		return session.createQuery("from HoaDon", HoaDon.class).setFirstResult(startPosition).setMaxResults(maxResult)
				.getResultList();
	}

	@Override
	public List<HoaDon> layDanhSach(int startPosition, int maxResult, boolean daThanhToan) {
		List<HoaDon> ds = null;
		Session session = sessionFactory.getCurrentSession();

		if (daThanhToan == true) {
			ds = session.createQuery("from HoaDon where DaThanhToan = 1", HoaDon.class).setMaxResults(maxResult).getResultList();
		} else {
			ds = session.createQuery("from HoaDon where DaThanhToan = 0", HoaDon.class).setMaxResults(maxResult).getResultList();
		}

		return ds;
	}

	@Override
	public HoaDon getHoaDon(int idHoaDon) {
		Session session = sessionFactory.getCurrentSession();
		return session.get(HoaDon.class, idHoaDon);
	}

	@Override
	public boolean capNhatHoaDon(HoaDon hoaDon) {
		try {
			Session session = sessionFactory.getCurrentSession();
			session.merge(hoaDon);
			return true;
		} catch (Exception e) {
			e.printStackTrace();
		}

		return false;
	}
}
