package com.nhathuy.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.nhathuy.dao.MauSanPhamDAO;
import com.nhathuy.daoimpl.MauSanPhamDaoImpl;
import com.nhathuy.entity.MauSanPham;

@Service
public class MauSanPhamService implements MauSanPhamDaoImpl {

	@Autowired
	MauSanPhamDAO mauSanPhamDAO;

	@Override
	public List<MauSanPham> layDanhSach() {
		return mauSanPhamDAO.layDanhSach();
	}
}
