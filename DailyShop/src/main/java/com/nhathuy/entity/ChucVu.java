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
@Table(name = "chucvu", catalog = "dailyshop")
public class ChucVu implements java.io.Serializable {
	private static final long serialVersionUID = 1L;

	private int idChucVu;
	private String tenChucVu;
	private Set<User> users = new HashSet<User>(0);

	public ChucVu() {
	}

	public ChucVu(String tenChucVu, Set<User> users) {
		this.tenChucVu = tenChucVu;
		this.users = users;
	}

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "IdChucVu", unique = true, nullable = false)
	public int getIdChucVu() {
		return this.idChucVu;
	}

	public void setIdChucVu(int idChucVu) {
		this.idChucVu = idChucVu;
	}

	@Column(name = "TenChucVu", length = 45)
	public String getTenChucVu() {
		return this.tenChucVu;
	}

	public void setTenChucVu(String tenChucVu) {
		this.tenChucVu = tenChucVu;
	}

	@OneToMany(fetch = FetchType.LAZY, mappedBy = "chucvu")
	public Set<User> getUsers() {
		return this.users;
	}

	public void setUsers(Set<User> users) {
		this.users = users;
	}

}
