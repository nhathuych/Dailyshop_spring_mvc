package com.nhathuy.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.nhathuy.dao.SizeSanPhamDAO;
import com.nhathuy.daoimpl.SizeSanPhamDaoImpl;
import com.nhathuy.entity.SizeSanPham;

@Service
public class SizeSanPhamService implements SizeSanPhamDaoImpl {

	@Autowired
	SizeSanPhamDAO sizeSanPhamDAO;

	@Override
	public List<SizeSanPham> layDanhSach() {
		return sizeSanPhamDAO.layDanhSach();
	}
}
