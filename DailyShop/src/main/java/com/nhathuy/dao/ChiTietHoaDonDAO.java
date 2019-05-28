package com.nhathuy.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.context.annotation.ScopedProxyMode;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.nhathuy.daoimpl.ChiTietHoaDonDaoImpl;
import com.nhathuy.entity.ChiTietHoaDon;
import com.nhathuy.entity.ChiTietHoaDonId;

@Repository
@Transactional
@Scope(proxyMode = ScopedProxyMode.TARGET_CLASS)
public class ChiTietHoaDonDAO implements ChiTietHoaDonDaoImpl {

	@Autowired
	SessionFactory sessionFactory;

	@Override
	public boolean themChiTietHoaDon(ChiTietHoaDon chiTietHoaDon) {
		Session session = sessionFactory.getCurrentSession();
		ChiTietHoaDonId chiTietHoaDonId = (ChiTietHoaDonId) session.save(chiTietHoaDon);

		return chiTietHoaDonId != null ? true : false;
	}

	@Override
	public List<ChiTietHoaDon> layDanhSach(int idHoaDon) {
		try {
			Session session = sessionFactory.getCurrentSession();
			return session.createQuery("from ChiTietHoaDon where idHoaDon = :id", ChiTietHoaDon.class)
					.setParameter("id", idHoaDon).getResultList();
		} catch (Exception e) {
			e.printStackTrace();
		}

		return null;
	}
}
