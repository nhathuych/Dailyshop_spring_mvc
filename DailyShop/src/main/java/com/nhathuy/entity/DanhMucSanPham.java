package com.nhathuy.entity;

import java.util.HashSet;
import java.util.Set;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name = "danhmucsanpham", catalog = "dailyshop")
public class DanhMucSanPham implements java.io.Serializable {
	private static final long serialVersionUID = 1L;

	private int idDanhMuc;
	private String tenDanhMuc;
	private Set<SanPham> sanphams = new HashSet<SanPham>(0);

	public DanhMucSanPham() {
	}

	public DanhMucSanPham(String tenDanhMuc) {
		this.tenDanhMuc = tenDanhMuc;
	}

	public DanhMucSanPham(String tenDanhMuc, Set<SanPham> sanphams) {
		this.tenDanhMuc = tenDanhMuc;
		this.sanphams = sanphams;
	}

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "IdDanhMuc", unique = true, nullable = false)
	public int getIdDanhMuc() {
		return this.idDanhMuc;
	}

	public void setIdDanhMuc(int idDanhMuc) {
		this.idDanhMuc = idDanhMuc;
	}

	@Column(name = "TenDanhMuc", length = 45)
	public String getTenDanhMuc() {
		return this.tenDanhMuc;
	}

	public void setTenDanhMuc(String tenDanhMuc) {
		this.tenDanhMuc = tenDanhMuc;
	}

	@OneToMany(fetch = FetchType.LAZY, mappedBy = "danhmucsanpham")
	public Set<SanPham> getSanphams() {
		return this.sanphams;
	}

	public void setSanphams(Set<SanPham> sanphams) {
		this.sanphams = sanphams;
	}
}
