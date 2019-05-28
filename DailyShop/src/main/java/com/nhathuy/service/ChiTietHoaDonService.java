package com.nhathuy.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.nhathuy.dao.ChiTietHoaDonDAO;
import com.nhathuy.daoimpl.ChiTietHoaDonDaoImpl;
import com.nhathuy.entity.ChiTietHoaDon;

@Service
public class ChiTietHoaDonService implements ChiTietHoaDonDaoImpl {

	@Autowired
	ChiTietHoaDonDAO chiTietHoaDonDAO;

	@Override
	public boolean themChiTietHoaDon(ChiTietHoaDon chiTietHoaDon) {
		return chiTietHoaDonDAO.themChiTietHoaDon(chiTietHoaDon);
	}

	@Override
	public List<ChiTietHoaDon> layDanhSach(int idHoaDon) {
		return chiTietHoaDonDAO.layDanhSach(idHoaDon);
	}
}
