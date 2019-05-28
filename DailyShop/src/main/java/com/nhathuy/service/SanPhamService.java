package com.nhathuy.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.nhathuy.dao.SanPhamDAO;
import com.nhathuy.daoimpl.SanPhamDaoImpl;
import com.nhathuy.entity.SanPham;

@Service
public class SanPhamService implements SanPhamDaoImpl {

	@Autowired
	SanPhamDAO sanPhamDAO;

	@Override
	public SanPham get(int idSanPham) {
		return sanPhamDAO.get(idSanPham);
	}

	@Override
	public List<SanPham> layDanhSach(int idDanhMuc, int startPosition, int maxResult) {
		return sanPhamDAO.layDanhSach(idDanhMuc, startPosition, maxResult);
	}

	@Override
	public List<SanPham> layDanhSachTheoGia(boolean isASC, int startPosition, int maxResult) {
		return sanPhamDAO.layDanhSachTheoGia(isASC, startPosition, maxResult);
	}

	@Override
	public long sizeOfDanhMuc(int idDanhMuc) {
		return sanPhamDAO.sizeOfDanhMuc(idDanhMuc);
	}

	@Override
	public boolean themMoi(SanPham sanpham) {
		return sanPhamDAO.themMoi(sanpham);
	}

	@Override
	public boolean remove(int idSanPham) {
		return sanPhamDAO.remove(idSanPham);
	}

	@Override
	public List<SanPham> timTheoTen(String tenSanPham) {
		return sanPhamDAO.timTheoTen(tenSanPham);
	}

	@Override
	public boolean capNhat(SanPham sanpham) {
		return sanPhamDAO.capNhat(sanpham);
	}
}
