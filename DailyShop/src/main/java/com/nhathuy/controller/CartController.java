package com.nhathuy.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.nhathuy.dto.GioHang;

@Controller
@RequestMapping("/cart")
public class CartController {

	@GetMapping
	public String Default(HttpSession httpSession, ModelMap modelMap) {
		List<GioHang> gioHangs = null;
		if (httpSession.getAttribute("giohang") != null) {
			gioHangs = (List<GioHang>) httpSession.getAttribute("giohang");
			modelMap.addAttribute("gioHangs", gioHangs);
		}

		return "cart";
	}

	@PostMapping(params = "btnCheckout")
	public String Default2(HttpSession httpSession, ModelMap modelMap) {
		if (httpSession.getAttribute("giohang") == null) {
			modelMap.addAttribute("msgCheckout", "Giỏ hàng của bạn đang trống. Ko thể thực thiện thao tác này!");
			return "cart";
		}
		return "redirect:checkout";
	}

	@PostMapping(params = "btnUpdateCart")
	public String Default(HttpSession httpSession, ModelMap modelMap, @RequestParam Integer[] soluongsp) {
		List<GioHang> gioHangs = null;
		int lenght = soluongsp.length;
		int total = 0;

		if (httpSession.getAttribute("giohang") != null) {
			gioHangs = (List<GioHang>) httpSession.getAttribute("giohang");
			for (int i = 0; i < lenght; i++) {
				gioHangs.get(i).setSoLuong(soluongsp[i]);
				total += gioHangs.get(i).getGiaTien() * soluongsp[i];
			}
		}

		modelMap.addAttribute("gioHangs", gioHangs);
		modelMap.addAttribute("total", total);

		return "cart";
	}
}
