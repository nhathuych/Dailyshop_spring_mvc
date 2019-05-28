package com.nhathuy.daoimpl;

import java.util.List;

import com.nhathuy.entity.HoaDon;

public interface HoaDonDaoImpl {
	boolean themHoaDon(HoaDon hoaDon);
	List<HoaDon> layDanhSach(int startPosition, int maxResult);
	List<HoaDon> layDanhSach(int startPosition, int maxResult, boolean daThanhToan);
	HoaDon getHoaDon(int idHoaDon);
	boolean capNhatHoaDon(HoaDon hoaDon);
}
