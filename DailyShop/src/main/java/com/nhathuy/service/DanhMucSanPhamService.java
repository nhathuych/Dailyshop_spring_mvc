package com.nhathuy.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.nhathuy.dao.DanhMucSanPhamDAO;
import com.nhathuy.daoimpl.DanhMucSanPhamDaoImpl;
import com.nhathuy.entity.DanhMucSanPham;

@Service
public class DanhMucSanPhamService implements DanhMucSanPhamDaoImpl {

	@Autowired
	DanhMucSanPhamDAO danhMucDAO;

	@Override
	public List<DanhMucSanPham> layDanhSach() {
		return danhMucDAO.layDanhSach();
	}

	@Override
	public DanhMucSanPham get(int idDanhMuc) {
		return danhMucDAO.get(idDanhMuc);
	}
}
