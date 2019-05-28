package com.nhathuy.controller.admin;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.nhathuy.entity.HoaDon;
import com.nhathuy.service.HoaDonService;

@Controller
@RequestMapping("/admin/qlhoadon")
public class QuanLyHoaDonController {

	@Autowired
	HoaDonService hoaDonService;

	@GetMapping
	public String Defalut(ModelMap modelMap) {
		modelMap.addAttribute("dsHoaDon", hoaDonService.layDanhSach(0, 50, false)); // danh sách chưa thanh toán
		return "qlhoadon";
	}

	// lịch sử hóa đơn đã thanh toán
	@GetMapping("/dathanhtoan")
	public String danhSachChuaThanhToan(ModelMap modelMap) {
		modelMap.addAttribute("dsHoaDon", hoaDonService.layDanhSach(0, 50, true));	// danh sách đã thanh toán
		modelMap.addAttribute("trangthai", "�?ã thanh toán");

		return "qlhoadon";
	}

	@GetMapping("/thanhtoan/{idHoaDon}")
	public String Defalut(@PathVariable int idHoaDon, ModelMap modelMap) {
		HoaDon hoadon = hoaDonService.getHoaDon(idHoaDon);
		hoadon.setDaThanhToan(true);
		hoaDonService.capNhatHoaDon(hoadon);

		modelMap.addAttribute("dsHoaDon", hoaDonService.layDanhSach(0, 50, false));
		return "qlhoadon";
	}
}
