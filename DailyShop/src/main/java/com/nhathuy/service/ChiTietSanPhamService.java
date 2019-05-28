package com.nhathuy.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.nhathuy.dao.ChiTietSanPhamDAO;
import com.nhathuy.daoimpl.ChiTietSanPhamDaoImpl;
import com.nhathuy.entity.ChiTietSanPham;

@Service
public class ChiTietSanPhamService implements ChiTietSanPhamDaoImpl {

	@Autowired
	ChiTietSanPhamDAO chiTietSanPhamDAO;

	@Override
	public List<ChiTietSanPham> getListByIdSanPham(int idSanPham) {
		return chiTietSanPhamDAO.getListByIdSanPham(idSanPham);
	}

	@Override
	public ChiTietSanPham get(int idChiTiet) {
		return chiTietSanPhamDAO.get(idChiTiet);
	}

	@Override
	public boolean add(ChiTietSanPham chitietsanpham) {
		return chiTietSanPhamDAO.add(chitietsanpham);
	}

	@Override
	public boolean tangSoLuong(int idChiTiet, int soluong) {
		return chiTietSanPhamDAO.tangSoLuong(idChiTiet, soluong);
	}

	@Override
	public boolean giamSoLuong(int idChiTiet, int soluong) {
		return chiTietSanPhamDAO.giamSoLuong(idChiTiet, soluong);
	}
}
