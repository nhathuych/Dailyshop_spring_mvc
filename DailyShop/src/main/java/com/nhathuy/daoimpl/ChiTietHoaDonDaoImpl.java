package com.nhathuy.daoimpl;

import java.util.List;

import com.nhathuy.entity.ChiTietHoaDon;

public interface ChiTietHoaDonDaoImpl {
	boolean themChiTietHoaDon(ChiTietHoaDon chiTietHoaDon);
	List<ChiTietHoaDon> layDanhSach(int idHoaDon);
}
