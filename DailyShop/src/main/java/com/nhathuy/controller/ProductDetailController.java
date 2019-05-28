package com.nhathuy.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.nhathuy.entity.ChiTietSanPham;
import com.nhathuy.service.ChiTietSanPhamService;
import com.nhathuy.service.SanPhamService;

@Controller
@RequestMapping("/product-detail")
public class ProductDetailController {

	@Autowired
	ChiTietSanPhamService chiTietSanPhamService;

	@Autowired
	SanPhamService sanPhamService;

	@GetMapping
	public String Default() {
		return "product-detail";
	}

	@GetMapping("/{idSanPham}")
	public String Default(@PathVariable int idSanPham, ModelMap modelMap) {
		List<ChiTietSanPham> dsChiTiet = chiTietSanPhamService.getListByIdSanPham(idSanPham);
		int soluong = 0;
		for (ChiTietSanPham chitiet : dsChiTiet) {
			soluong += chitiet.getSoLuong();
		}

		modelMap.addAttribute("currSanPham", sanPhamService.get(idSanPham));
		modelMap.addAttribute("dsChiTiet", dsChiTiet);
		modelMap.addAttribute("soluong", soluong);

		return "product-detail";
	}
}
