package com.nhathuy.controller.admin;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.nhathuy.service.UserService;

@Controller
@RequestMapping("/admin/user")
public class QuanLyNguoiDungController {

	@Autowired
	UserService userService;

	@GetMapping
	public String Default(ModelMap modelMap) {
		modelMap.addAttribute("dsUser", userService.getList());
		return "qlnguoidung";
	}
}
