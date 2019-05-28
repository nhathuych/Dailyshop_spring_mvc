package com.nhathuy.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.nhathuy.dto.GioHang;
import com.nhathuy.entity.ChiTietHoaDon;
import com.nhathuy.entity.ChiTietHoaDonId;
import com.nhathuy.entity.HoaDon;
import com.nhathuy.service.ChiTietHoaDonService;
import com.nhathuy.service.HoaDonService;

@Controller
@RequestMapping("/checkout")
public class CheckoutController {

	@Autowired
	HoaDonService hoaDonService;

	@Autowired
	ChiTietHoaDonService chiTietHoaDonService;

	@GetMapping
	public String Default(HttpSession httpSession, ModelMap modelMap) {
		if (httpSession.getAttribute("giohang") == null) {
			modelMap.addAttribute("msgGioHang", "Giỏ hàng của bạn đang trống. Xin quay lại sau!");
		} else {
			List<GioHang> gioHangs = (List<GioHang>) httpSession.getAttribute("giohang");
			int total = 0;
			for (GioHang gio : gioHangs) {
				total += gio.getGiaTien() * gio.getSoLuong();
			}

			modelMap.addAttribute("total", total);
		}

		return "checkout";
	}

	@PostMapping(params = "btnOrder")
	public String ThemHoaDon(@RequestParam String fullname, @RequestParam String phone, @RequestParam String address,
			@RequestParam String ghichu, HttpSession httpSession, ModelMap modelMap) {
		if (fullname.isEmpty()) {
			modelMap.addAttribute("msgOrder", "Không được để trống tên khách hàng");
		} else if (phone.isEmpty()) {
			modelMap.addAttribute("msgOrder", "Không được để trống số điện thoại");
		} else if (address.isEmpty()) {
			modelMap.addAttribute("msgOrder", "Không được để trống địa chỉ giao hàng");
		} else {
			if (httpSession.getAttribute("giohang") != null) {
				List<GioHang> gioHangs = (List<GioHang>) httpSession.getAttribute("giohang");
				HoaDon hoadon = new HoaDon(fullname, phone, address, ghichu, null, false);

				boolean res = hoaDonService.themHoaDon(hoadon);
				if (res) {
					for (GioHang sp : gioHangs) {
						ChiTietHoaDonId chiTietHoaDonId = new ChiTietHoaDonId(hoadon.getIdHoaDon(), sp.getIdChiTietSanPham());

						ChiTietHoaDon chiTietHoaDon = new ChiTietHoaDon();
						chiTietHoaDon.setId(chiTietHoaDonId);
						chiTietHoaDon.setGiaTien(sp.getGiaTien());
						chiTietHoaDon.setSoLuong(sp.getSoLuong());

						chiTietHoaDonService.themChiTietHoaDon(chiTietHoaDon);
					}
					// đặt mua và lưu hóa đơn thành công thì xóa giỏ hàng
					httpSession.removeAttribute("giohang");
					modelMap.addAttribute("msgOrder", "Đặt mua thành công");
				} else {
					modelMap.addAttribute("msgOrder", "Đặt mua thất bại");
				}
			}
		}

		return "checkout";
	}
}
