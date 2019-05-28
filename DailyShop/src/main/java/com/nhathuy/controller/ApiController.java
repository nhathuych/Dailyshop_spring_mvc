package com.nhathuy.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Set;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.nhathuy.dto.GioHang;
import com.nhathuy.dto.SanPhamDTO;
import com.nhathuy.entity.ChiTietHoaDon;
import com.nhathuy.entity.ChiTietSanPham;
import com.nhathuy.entity.DanhMucSanPham;
import com.nhathuy.entity.MauSanPham;
import com.nhathuy.entity.SanPham;
import com.nhathuy.entity.SizeSanPham;
import com.nhathuy.service.ChiTietHoaDonService;
import com.nhathuy.service.ChiTietSanPhamService;
import com.nhathuy.service.DanhMucSanPhamService;
import com.nhathuy.service.SanPhamService;

@Controller
@RequestMapping("/api")
@SessionAttributes({ "giohang" })
public class ApiController {

	@Autowired
	ServletContext context;

	@Autowired
	DanhMucSanPhamService danhMucService;

	@Autowired
	ChiTietSanPhamService chiTietSanPhamService;

	@Autowired
	SanPhamService sanPhamService;

	@Autowired
	ChiTietHoaDonService chiTietHoaDonService;

	@ResponseBody
	@GetMapping("/HienThiDanhMuc")
	public String hienThiDanhMuc() {
		List<DanhMucSanPham> dsDanhMuc = danhMucService.layDanhSach();
		StringBuilder s = new StringBuilder("");
		s.append("<li><a href='/DailyShop/'>Home</a></li>");
		for (DanhMucSanPham danhmuc : dsDanhMuc) {
			s.append(String.format("<li><a href='/DailyShop/product/%d'>%s</a></li>", danhmuc.getIdDanhMuc(),
					danhmuc.getTenDanhMuc()));
		}

		return s.toString();
	}

	@ResponseBody
	@GetMapping("/ThemGioHang")
	public String themGioHang(@RequestParam int idChiTiet, HttpSession httpSession) {
		ChiTietSanPham chitiet = chiTietSanPhamService.get(idChiTiet);

		if (httpSession.getAttribute("giohang") == null) {
			ArrayList<GioHang> dsGio = new ArrayList<>();

			GioHang gioHang = new GioHang();
			gioHang.setIdSanPham(chitiet.getSanpham().getIdSanPham());
			gioHang.setIdSize(chitiet.getSizesanpham().getIdSize());
			gioHang.setIdMau(chitiet.getMausanpham().getIdMau());
			gioHang.setTenSanPham(chitiet.getSanpham().getTenSanPham());
			gioHang.setGiaTien(chitiet.getSanpham().getGiaTien());
			gioHang.setMau(chitiet.getMausanpham().getMau());
			gioHang.setSize(chitiet.getSizesanpham().getSize());
			gioHang.setSoLuong(1);
			gioHang.setHinhAnh(chitiet.getSanpham().getHinhAnh());
			gioHang.setIdChiTietSanPham(idChiTiet);

			chiTietSanPhamService.giamSoLuong(idChiTiet, 1);
			dsGio.add(gioHang);
			httpSession.setAttribute("giohang", dsGio);

			return String.valueOf(dsGio.size());
		} else {
			ArrayList<GioHang> dsGio = (ArrayList<GioHang>) httpSession.getAttribute("giohang");
			int vitri = kiemTraSanPhamTrongGio(dsGio, chitiet.getSanpham().getIdSanPham(),
					chitiet.getSizesanpham().getIdSize(), chitiet.getMausanpham().getIdMau());
			if (vitri == -1) {
				GioHang gioHang = new GioHang();
				gioHang.setIdSanPham(chitiet.getSanpham().getIdSanPham());
				gioHang.setIdSize(chitiet.getSizesanpham().getIdSize());
				gioHang.setIdMau(chitiet.getMausanpham().getIdMau());
				gioHang.setTenSanPham(chitiet.getSanpham().getTenSanPham());
				gioHang.setGiaTien(chitiet.getSanpham().getGiaTien());
				gioHang.setMau(chitiet.getMausanpham().getMau());
				gioHang.setSize(chitiet.getSizesanpham().getSize());
				gioHang.setSoLuong(1);
				gioHang.setHinhAnh(chitiet.getSanpham().getHinhAnh());
				gioHang.setIdChiTietSanPham(idChiTiet);

				chiTietSanPhamService.giamSoLuong(idChiTiet, 1);
				dsGio.add(gioHang);
			} else {
				int soLuongMoi = dsGio.get(vitri).getSoLuong() + 1;
				dsGio.get(vitri).setSoLuong(soLuongMoi);
			}

			return String.valueOf(dsGio.size());
		}
	}

	// kiểm tra sản phẩm đã tồn tài trong giỏ hàng chưa
	private int kiemTraSanPhamTrongGio(ArrayList<GioHang> dsGio, int masp, int masize, int mamau) {
		for (int i = 0; i < dsGio.size(); i++) {
			if (dsGio.get(i).getIdSanPham() == masp && dsGio.get(i).getIdSize() == masize
					&& dsGio.get(i).getIdMau() == mamau) {
				return i;
			}
		}

		return -1;
	}

	@ResponseBody
	@GetMapping("/XoaGioHang")
	public String xoaGioHang(@RequestParam int idChiTiet, HttpSession httpSession) {
		List<GioHang> gioHangs = null;

		if (httpSession.getAttribute("giohang") != null) {
			gioHangs = (List<GioHang>) httpSession.getAttribute("giohang");
			for (GioHang sp : gioHangs) {
				if (sp.getIdChiTietSanPham() == idChiTiet) {
					chiTietSanPhamService.tangSoLuong(idChiTiet, sp.getSoLuong());
					gioHangs.remove(sp);

					return String.valueOf(gioHangs.size());
				}
			}
		}

		return "notok"; // not ok
	}

	/* ----------------------- phần admin ----------------------- */

	// upload hình ảnh khi thêm sản phẩm
	@PostMapping("/UploadHinhAnh")
	@ResponseBody
	public String uploadFile(MultipartHttpServletRequest multipartHttpServletRequest) {
		Iterator<String> fileNames = multipartHttpServletRequest.getFileNames();
		MultipartFile multipartFile = multipartHttpServletRequest.getFile(fileNames.next());

		try {
			// đường dẫn lưu file trên server
			String path = context.getRealPath("/resources/img/product/") + multipartFile.getOriginalFilename();
			File file = new File(path);

			// chép file vào đường dẫn nào đó
			multipartFile.transferTo(file);

			System.out.println(path);
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}

		return "";
	}

	@GetMapping("/XoaSanPham")
	@ResponseBody
	public String xoaSanPham(@RequestParam int idSanPham) {
		sanPhamService.remove(idSanPham);

		return "ok";
	}

	// produces = "application/json; charset=utf-8"	- trả về 1 json, qua bên custom.js đọc
	@PostMapping(path = "/DoDuLieuRaForm", produces = "application/json; charset=utf-8")
	@ResponseBody
	public SanPhamDTO doDuLieuRaForm(@RequestParam int idSanPham) {
		SanPhamDTO sanPhamDTO = new SanPhamDTO();
		SanPham sanpham = sanPhamService.get(idSanPham);

		Set<ChiTietSanPham> dsChiTiet = new HashSet<>();
		for (ChiTietSanPham chitiet : sanpham.getChitietsanphams()) {
			MauSanPham mausp = new MauSanPham();
			mausp.setIdMau(chitiet.getMausanpham().getIdMau());
			mausp.setMau(chitiet.getMausanpham().getMau());

			SizeSanPham sizesp = new SizeSanPham();
			sizesp.setIdSize(chitiet.getSizesanpham().getIdSize());
			sizesp.setSize(chitiet.getSizesanpham().getSize());

			ChiTietSanPham chiTietSanPham = new ChiTietSanPham();
			chiTietSanPham.setMausanpham(mausp);
			chiTietSanPham.setSizesanpham(sizesp);
			chiTietSanPham.setSoLuong(chitiet.getSoLuong());

			dsChiTiet.add(chiTietSanPham);
		}

		DanhMucSanPham danhmuc = new DanhMucSanPham();
		danhmuc.setIdDanhMuc(sanpham.getDanhmucsanpham().getIdDanhMuc());
		danhmuc.setTenDanhMuc(sanpham.getDanhmucsanpham().getTenDanhMuc());

		sanPhamDTO.setChiTietSanPhams(dsChiTiet);
		sanPhamDTO.setIdSanPham(idSanPham);
		sanPhamDTO.setTenSanPham(sanpham.getTenSanPham());
		sanPhamDTO.setGiaTien(sanpham.getGiaTien());
		sanPhamDTO.setMoTa(sanpham.getMoTa());
		sanPhamDTO.setHinhAnh(sanpham.getHinhAnh());
		sanPhamDTO.setGioiTinh(sanpham.getGioiTinh());
		sanPhamDTO.setDanhMucSanPham(danhmuc);
		sanPhamDTO.setChiTietSanPhams(dsChiTiet);

		return sanPhamDTO;
	}

	@ResponseBody
	@GetMapping("/XuatThongTinHoaDon")
	public String XuatThongTinHoaDon(@RequestParam int idHoaDon) {
		List<ChiTietSanPham> chiTietSanPhams = new ArrayList<>();
		List<ChiTietHoaDon> chiTietHoaDons = chiTietHoaDonService.layDanhSach(idHoaDon);
		StringBuilder html = new StringBuilder();

		int total = 0;
		for (ChiTietHoaDon chiTietHoaDon : chiTietHoaDons) {
			ChiTietSanPham currCTSP = chiTietHoaDon.getChitietsanpham();
			chiTietSanPhams.add(currCTSP);

			html.append("<tr>");
			html.append("<td>");
			html.append(String.format("<b style='color: red;'>%s</b> <b> x %d</b> <br/> %s, %s", currCTSP.getSanpham().getTenSanPham(),
					chiTietHoaDon.getSoLuong(), currCTSP.getMausanpham().getMau(), currCTSP.getSizesanpham().getSize()));
			html.append("</td>");
			html.append(String.format("<td style='text-align: center;'>$ %d</td>", chiTietHoaDon.getGiaTien()));
			html.append("</tr>");
			
			total += chiTietHoaDon.getGiaTien();
		}

		html.append("<tr style='text-align: center;'>");
		html.append("<th>total</th>");
		html.append(String.format("<th>$ %d</th>", total));
		html.append("</tr>");

		return html.toString();
	}
}
