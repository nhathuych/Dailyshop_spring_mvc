package com.nhathuy.dto;

import java.util.Set;

import com.nhathuy.entity.ChiTietSanPham;
import com.nhathuy.entity.DanhMucSanPham;

public class SanPhamDTO {
	private int idSanPham;
	private String tenSanPham;
	private DanhMucSanPham danhMucSanPham;
	private int giaTien;
	private String gioiTinh;
	private String moTa;
	private String hinhAnh;
	private Set<ChiTietSanPham> chiTietSanPhams;
	public SanPhamDTO() {
	}

	public int getIdSanPham() {
		return idSanPham;
	}

	public void setIdSanPham(int idSanPham) {
		this.idSanPham = idSanPham;
	}

	public String getTenSanPham() {
		return tenSanPham;
	}

	public void setTenSanPham(String tenSanPham) {
		this.tenSanPham = tenSanPham;
	}

	public DanhMucSanPham getDanhMucSanPham() {
		return danhMucSanPham;
	}

	public void setDanhMucSanPham(DanhMucSanPham danhMucSanPham) {
		this.danhMucSanPham = danhMucSanPham;
	}

	public int getGiaTien() {
		return giaTien;
	}

	public void setGiaTien(int giaTien) {
		this.giaTien = giaTien;
	}

	public String getGioiTinh() {
		return gioiTinh;
	}

	public void setGioiTinh(String gioiTinh) {
		this.gioiTinh = gioiTinh;
	}

	public String getMoTa() {
		return moTa;
	}

	public void setMoTa(String moTa) {
		this.moTa = moTa;
	}

	public String getHinhAnh() {
		return hinhAnh;
	}

	public void setHinhAnh(String hinhAnh) {
		this.hinhAnh = hinhAnh;
	}

	public Set<ChiTietSanPham> getChiTietSanPhams() {
		return chiTietSanPhams;
	}

	public void setChiTietSanPhams(Set<ChiTietSanPham> chiTietSanPhams) {
		this.chiTietSanPhams = chiTietSanPhams;
	}
}
