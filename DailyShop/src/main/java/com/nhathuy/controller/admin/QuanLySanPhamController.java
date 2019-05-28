package com.nhathuy.controller.admin;

import java.util.HashSet;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.nhathuy.entity.ChiTietSanPham;
import com.nhathuy.entity.DanhMucSanPham;
import com.nhathuy.entity.MauSanPham;
import com.nhathuy.entity.SanPham;
import com.nhathuy.entity.SizeSanPham;
import com.nhathuy.service.ChiTietSanPhamService;
import com.nhathuy.service.DanhMucSanPhamService;
import com.nhathuy.service.MauSanPhamService;
import com.nhathuy.service.SanPhamService;
import com.nhathuy.service.SizeSanPhamService;

@Controller
@RequestMapping("/admin/qlsanpham")
public class QuanLySanPhamController {

	@Autowired
	DanhMucSanPhamService danhMucSanPhamService;

	@Autowired
	SanPhamService sanPhamService;

	@Autowired
	MauSanPhamService mauSanPhamService;

	@Autowired
	SizeSanPhamService sizeSanPhamService;

	@Autowired
	ChiTietSanPhamService chiTietSanPhamService;

	@GetMapping
	public String Default(ModelMap modelMap) {
		modelMap.addAttribute("dsDanhMuc", danhMucSanPhamService.layDanhSach());
		modelMap.addAttribute("dsMau", mauSanPhamService.layDanhSach());
		modelMap.addAttribute("dsSize", sizeSanPhamService.layDanhSach());
		return "qlsanpham";
	}

	@GetMapping("/{idDanhMuc}")
	public String Default(@PathVariable int idDanhMuc, ModelMap modelMap) {
		modelMap.addAttribute("dsDanhMuc", danhMucSanPhamService.layDanhSach());
		modelMap.addAttribute("danhmuc", danhMucSanPhamService.get(idDanhMuc));
		modelMap.addAttribute("dsSanPham", sanPhamService.layDanhSach(idDanhMuc, 0, 100));
		modelMap.addAttribute("dsMau", mauSanPhamService.layDanhSach());
		modelMap.addAttribute("dsSize", sizeSanPhamService.layDanhSach());

		return "qlsanpham";
	}

	@PostMapping(params = {"btnThoatCapNhat"})
	public String thoatCapNhat(ModelMap modelMap) {
		modelMap.addAttribute("dsDanhMuc", danhMucSanPhamService.layDanhSach());
		modelMap.addAttribute("dsMau", mauSanPhamService.layDanhSach());
		modelMap.addAttribute("dsSize", sizeSanPhamService.layDanhSach());
		return "qlsanpham";
	}

	@PostMapping(params = "btnThemSanPham")
	public String themSanPham(@RequestParam String tensp, @RequestParam int danhmucsp, @RequestParam int giasp,
			@RequestParam String gioitinh, @RequestParam String mota, @RequestParam String hinhsp,
			@RequestParam int[] size, @RequestParam int[] mau, @RequestParam int[] soluong, ModelMap modelMap) {

		modelMap.addAttribute("dsDanhMuc", danhMucSanPhamService.layDanhSach());
		modelMap.addAttribute("dsMau", mauSanPhamService.layDanhSach());
		modelMap.addAttribute("dsSize", sizeSanPhamService.layDanhSach());

		int len = size.length - 1;

		if (tensp.isEmpty()) {
			modelMap.addAttribute("msgThemSanPham", "Bạn chưa nhập tên sản phẩm");
		} else if (hinhsp.isEmpty()) {
			modelMap.addAttribute("msgThemSanPham", "Bạn chưa chọn hình sản phẩm");
		} else if (soluong == null) {
			modelMap.addAttribute("msgThemSanPham", "Bạn chưa nhập số lượng");
		} else {
			DanhMucSanPham danhmucsanpham = new DanhMucSanPham();
			danhmucsanpham.setIdDanhMuc(danhmucsp);

			Set<ChiTietSanPham> dsChiTiet = len > 0 ? new HashSet<>() : null;
			for (int i = 0; i < len; i++) {
				SizeSanPham sizesanpham = new SizeSanPham();
				sizesanpham.setIdSize(size[i]);

				MauSanPham mausanpham = new MauSanPham();
				mausanpham.setIdMau(mau[i]);

				ChiTietSanPham chitietsanpham = new ChiTietSanPham();
				chitietsanpham.setSizesanpham(sizesanpham);
				chitietsanpham.setMausanpham(mausanpham);
				chitietsanpham.setSoLuong(soluong[i]);

				dsChiTiet.add(chitietsanpham);
			}

			SanPham sanpham = new SanPham();
			sanpham.setTenSanPham(tensp);
			sanpham.setDanhmucsanpham(danhmucsanpham);
			sanpham.setGiaTien(giasp);
			sanpham.setGioiTinh(gioitinh);
			sanpham.setMoTa(mota);
			sanpham.setHinhAnh(hinhsp);
			sanpham.setChitietsanphams(dsChiTiet); // chú ý mối quan hệ của 2 bảng

			boolean res = sanPhamService.themMoi(sanpham);

			modelMap.addAttribute("msgThemSanPham", res ? "Thêm thành công" : "Thêm thất bại");
		}

		return "qlsanpham";
	}

	@PostMapping(params = "btnCapNhatSanPham", produces="text/plain; charset=utf-8")
	public String capNhat(@RequestParam int masp, @RequestParam String tensp, @RequestParam int danhmucsp, @RequestParam int giasp,
			@RequestParam String gioitinh, @RequestParam String mota, @RequestParam String hinhsp,
			@RequestParam int[] size, @RequestParam int[] mau, @RequestParam int[] soluong, ModelMap modelMap) {

		modelMap.addAttribute("dsDanhMuc", danhMucSanPhamService.layDanhSach());
		modelMap.addAttribute("dsMau", mauSanPhamService.layDanhSach());
		modelMap.addAttribute("dsSize", sizeSanPhamService.layDanhSach());

		int len = size.length - 1;	// trừ 1 vì có 1 cái clone

		Set<ChiTietSanPham> dsChiTiet = new HashSet<>();

		DanhMucSanPham danhmuc = new DanhMucSanPham();
		danhmuc.setIdDanhMuc(danhmucsp);

		for (int i = 0; i < len; i++) {
			MauSanPham mausanpham = new MauSanPham();
			mausanpham.setIdMau(mau[i]);

			SizeSanPham sizesanpham = new SizeSanPham();
			sizesanpham.setIdSize(size[i]);

			ChiTietSanPham chitiet = new ChiTietSanPham();
			chitiet.setMausanpham(mausanpham);
			chitiet.setSizesanpham(sizesanpham);
			chitiet.setSoLuong(soluong[i]);

			dsChiTiet.add(chitiet);
		}

		SanPham sanpham = new SanPham();
		sanpham.setIdSanPham(masp);
		sanpham.setTenSanPham(tensp);
		sanpham.setDanhmucsanpham(danhmuc);
		sanpham.setGiaTien(giasp);
		sanpham.setGioiTinh(gioitinh);
		sanpham.setMoTa(mota);
		sanpham.setHinhAnh(hinhsp);
		sanpham.setChitietsanphams(dsChiTiet);

		sanPhamService.capNhat(sanpham);

		modelMap.addAttribute("msgThemSanPham", "Cập nhật thành công!");
		return "qlsanpham";
	}
}
