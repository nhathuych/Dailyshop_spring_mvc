package com.nhathuy.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.nhathuy.entity.DanhMucSanPham;
import com.nhathuy.service.DanhMucSanPhamService;
import com.nhathuy.service.SanPhamService;

@Controller
@RequestMapping("/product")
public class ProductController {

	@Autowired
	DanhMucSanPhamService danhMucService;

	@Autowired
	SanPhamService sanPhamService;

	@GetMapping
	public String Default() {
		return "product";
	}

	@GetMapping("/{idDanhMuc}")
	public String Default(@PathVariable int idDanhMuc, ModelMap modelMap) {
		List<DanhMucSanPham> dsDanhMuc = danhMucService.layDanhSach();

		modelMap.addAttribute("dsDanhMuc", dsDanhMuc);
		modelMap.addAttribute("dsSanPham", sanPhamService.layDanhSach(idDanhMuc, 0, 100));
		modelMap.addAttribute("tendanhmuc", dsDanhMuc.get(idDanhMuc - 1).getTenDanhMuc());

		return "product";
	}

	@PostMapping
	public String search(@RequestParam String txtSearch, ModelMap modelMap) {
		modelMap.addAttribute("dsDanhMuc", danhMucService.layDanhSach());
		modelMap.addAttribute("dsSanPham", sanPhamService.timTheoTen(txtSearch));
		modelMap.addAttribute("tendanhmuc", String.format("Search for '%s'", txtSearch));	// để cho đẹp

		return "product";
	}
}
