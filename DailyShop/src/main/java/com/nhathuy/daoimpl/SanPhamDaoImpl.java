package com.nhathuy.daoimpl;

import java.util.List;

import com.nhathuy.entity.SanPham;

public interface SanPhamDaoImpl {
	SanPham get(int idSanPham);
	List<SanPham> layDanhSach(int idDanhMuc, int startPosition, int maxResult);
	List<SanPham> layDanhSachTheoGia(boolean isASC, int startPosition, int maxResult);
	long sizeOfDanhMuc(int idDanhMuc);
	boolean themMoi(SanPham sanpham);
	boolean remove(int idSanPham);
	List<SanPham> timTheoTen(String tenSanPham);
	boolean capNhat(SanPham sanpham);
}
