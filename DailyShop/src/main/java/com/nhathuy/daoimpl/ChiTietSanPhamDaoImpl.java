package com.nhathuy.daoimpl;

import java.util.List;

import com.nhathuy.entity.ChiTietSanPham;

public interface ChiTietSanPhamDaoImpl {
	List<ChiTietSanPham> getListByIdSanPham(int idSanPham);
	ChiTietSanPham get(int idChiTiet);
	boolean add(ChiTietSanPham chitietsanpham);
	boolean tangSoLuong(int idChiTiet, int soluong);
	boolean giamSoLuong(int idChiTiet, int soluong);
}
