package com.nhathuy.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.nhathuy.entity.ChucVu;
import com.nhathuy.entity.User;
import com.nhathuy.service.UserService;

@Controller
@RequestMapping("/register")
public class RegisterController {

	@Autowired
	UserService userService;

	@GetMapping
	public String Default(HttpSession httpSession) {
		User user = (User) httpSession.getAttribute("user");
		if (user != null) {
			return "redirect:/";
		}
		return "register";
	}

	@PostMapping(params = "btnRegister")
	public String dangky(@RequestParam String name_reg, @RequestParam String email_reg, @RequestParam String pass_reg,
			ModelMap modelMap, HttpSession httpSession) {

		if (email_reg.isEmpty() || pass_reg.isEmpty()) {
			modelMap.addAttribute("msgRegister", "ko dc để trống email hoặc mật khẩu");
		} else if (userService.isEmailDuplicate(email_reg)) {
			modelMap.addAttribute("msgRegister", "Email này đã được đăng ký rồi. Vui lòng chọn email khác");
		} else {
			ChucVu chucvu = new ChucVu();
			chucvu.setIdChucVu(3);

			boolean res = userService.themMoi(new User(chucvu, name_reg, email_reg, pass_reg));
			if (res) {
				modelMap.addAttribute("msgRegister", "Đăng ký thành công");
			} else {
				modelMap.addAttribute("msgRegister", "Đăng ký thất bại");
			}
		}

		return "register";
	}

	@PostMapping(params = "btnLogin")
	public String dangNhap(@RequestParam String email_log, @RequestParam String pass_log, ModelMap modelMap,
			HttpSession httpSession) {
		if (email_log.trim().isEmpty() || pass_log.trim().isEmpty()) {
			modelMap.addAttribute("msgLogin", "Tài khoản hoặc mật khẩu không hợp lệ");
		} else {
			boolean res = userService.kiemTraDangNhap(email_log, pass_log);
			if (res) {
				httpSession.setAttribute("user", userService.getUser(email_log));
				return "redirect:/";
			} else {
				modelMap.addAttribute("msgLogin", "Tài khoản hoặc mật khẩu không hợp lệ");
			}
		}

		return "register";
	}

	@GetMapping("/dang-xuat")
	public String dangXuat(HttpSession httpSession) {
		httpSession.removeAttribute("user");

		return "redirect:/";
	}
}
