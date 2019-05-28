package com.nhathuy.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "user", catalog = "dailyshop")
public class User implements java.io.Serializable {
	private static final long serialVersionUID = 1L;

	private int idUser;
	private ChucVu chucvu;
	private String hoTen;
	private String email;
	private String password;

	public User() {
	}

	public User(ChucVu chucvu, String hoTen, String email, String password) {
		this.chucvu = chucvu;
		this.hoTen = hoTen;
		this.email = email;
		this.password = password;
	}

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "IdUser", unique = true, nullable = false)
	public int getIdUser() {
		return this.idUser;
	}

	public void setIdUser(int idUser) {
		this.idUser = idUser;
	}

	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "IdChucVu")
	public ChucVu getChucvu() {
		return this.chucvu;
	}

	public void setChucvu(ChucVu chucvu) {
		this.chucvu = chucvu;
	}

	@Column(name = "HoTen", length = 45)
	public String getHoTen() {
		return this.hoTen;
	}

	public void setHoTen(String hoTen) {
		this.hoTen = hoTen;
	}

	@Column(name = "Email", length = 45)
	public String getEmail() {
		return this.email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	@Column(name = "Password", length = 45)
	public String getPassword() {
		return this.password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	// các Entity class này ko cho đặt tên hàm bắt đầu bằng "get"
	public String firstName() {
		String[] split = getHoTen().split(" ");
		return split[0];
	}
}
