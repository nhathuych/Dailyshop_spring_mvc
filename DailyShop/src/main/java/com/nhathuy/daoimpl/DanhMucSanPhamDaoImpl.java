package com.nhathuy.daoimpl;

import java.util.List;

import com.nhathuy.entity.DanhMucSanPham;

public interface DanhMucSanPhamDaoImpl {
	List<DanhMucSanPham> layDanhSach();
	DanhMucSanPham get(int idDanhMuc);
}
