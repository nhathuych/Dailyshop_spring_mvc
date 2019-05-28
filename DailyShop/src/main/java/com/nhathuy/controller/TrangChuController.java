package com.nhathuy.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.nhathuy.service.SanPhamService;

@Controller
@RequestMapping("/")
public class TrangChuController {

	@Autowired
	SanPhamService sanPhamService;

	@GetMapping
	public String Default(ModelMap modelMap) {
		modelMap.addAttribute("dsSanPham", sanPhamService.layDanhSachTheoGia(true, 0, 8));
		return "index";
	}
}
