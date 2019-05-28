package com.nhathuy.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.nhathuy.dao.HoaDonDAO;
import com.nhathuy.daoimpl.HoaDonDaoImpl;
import com.nhathuy.entity.HoaDon;

@Service
public class HoaDonService implements HoaDonDaoImpl {

	@Autowired
	HoaDonDAO hoaDonDAO;

	@Override
	public boolean themHoaDon(HoaDon hoaDon) {
		return hoaDonDAO.themHoaDon(hoaDon);
	}

	@Override
	public List<HoaDon> layDanhSach(int startPosition, int maxResult) {
		return hoaDonDAO.layDanhSach(startPosition, maxResult);
	}

	@Override
	public List<HoaDon> layDanhSach(int startPosition, int maxResult, boolean daThanhToan) {
		return hoaDonDAO.layDanhSach(startPosition, maxResult, daThanhToan);
	}

	@Override
	public HoaDon getHoaDon(int idHoaDon) {
		return hoaDonDAO.getHoaDon(idHoaDon);
	}

	@Override
	public boolean capNhatHoaDon(HoaDon hoaDon) {
		return hoaDonDAO.capNhatHoaDon(hoaDon);
	}
}
