package com.nhathuy.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.context.annotation.ScopedProxyMode;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.nhathuy.daoimpl.SanPhamDaoImpl;
import com.nhathuy.entity.SanPham;

@Repository
@Transactional
@Scope(proxyMode = ScopedProxyMode.TARGET_CLASS)
public class SanPhamDAO implements SanPhamDaoImpl {

	@Autowired
	SessionFactory sessionFactory;

	@Override
	public SanPham get(int idSanPham) {
		Session session = sessionFactory.getCurrentSession();
		SanPham sanpham = (SanPham) session.createQuery("from SanPham where idSanPham = :id")
				.setParameter("id", idSanPham).getSingleResult();

		return sanpham;
	}

	@Override
	public List<SanPham> layDanhSach(int idDanhMuc, int startPosition, int maxResult) {
		List<SanPham> ds = null;
		Session session = sessionFactory.getCurrentSession();
		ds = session.createQuery("from SanPham where idDanhMuc = :id", SanPham.class).setParameter("id", idDanhMuc)
				.setFirstResult(startPosition).setMaxResults(maxResult).getResultList();

		return ds;
	}

	@Override
	public List<SanPham> layDanhSachTheoGia(boolean isASC, int startPosition, int maxResult) {
		List<SanPham> ds = null;
		Session session = sessionFactory.getCurrentSession();
		if (isASC) {
			ds = session.createQuery("from SanPham order by GiaTien", SanPham.class).setFirstResult(startPosition)
					.setMaxResults(maxResult).getResultList();
		} else {
			ds = session.createQuery("from SanPham order by GiaTien desc", SanPham.class).setFirstResult(startPosition)
					.setMaxResults(maxResult).getResultList();
		}

		return ds;
	}

	@Override
	public long sizeOfDanhMuc(int idDanhMuc) {
		Session session = sessionFactory.getCurrentSession();
		long size = (long) session.createQuery("select count(IdSanPham) from SanPham where IdDanhMuc = :id")
				.setParameter("id", idDanhMuc).uniqueResult();
		return size;
	}

	@Override
	public boolean themMoi(SanPham sanpham) {
		Session session = sessionFactory.getCurrentSession();
		int id = (int) session.save(sanpham);
		return id > 0 ? true : false;
	}

	@Override
	public boolean remove(int idSanPham) {
		try {
			Session session = sessionFactory.getCurrentSession();
			session.delete(get(idSanPham));
			return true;
		} catch (Exception e) {
			e.printStackTrace();
		}

		return false;
	}

	@Override
	public List<SanPham> timTheoTen(String tenSanPham) {
		try {
			Session session = sessionFactory.getCurrentSession();
			List<SanPham> ds = session.createQuery("from SanPham where TenSanPham like :ten", SanPham.class)
					.setParameter("ten", "%" + tenSanPham + "%").getResultList();
			return ds;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	@Override
	public boolean capNhat(SanPham sanpham) {
		try {
			Session session = sessionFactory.getCurrentSession();
			session.update(sanpham);
			return true;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}
}
