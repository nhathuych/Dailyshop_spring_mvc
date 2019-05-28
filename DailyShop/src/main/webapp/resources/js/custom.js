$(document).ready(function() {

	// phần header xài chung giữa các page
	// khi mới mở trang web thì load hàm này đầu tiên để đổ danh mục sản phẩm ra file header
	hienThiDanhMucSanPham()
	function hienThiDanhMucSanPham() {
		$.ajax({
			url:"/DailyShop/api/HienThiDanhMuc",
			type:"GET",
			data: {
			},
			// value đại diện cho giá trị return về
			success : function(value) {
				var danhmucsp = $("#danhmucsp").find("ul");
				danhmucsp.empty();
				danhmucsp.append(value);
			}
		})
	}

	$(".btnAddToCart").click(function() {
		// truyền duy nhất idChiTietSanPham thôi
		//bên ApiController truy vấn lấy ChiTietSanPham ra xử lý
		var idChiTiet = $(this).attr("data-machitiet");
		
		$.ajax({
			url:"/DailyShop/api/ThemGioHang",
			type:"GET",
			data: {
				idChiTiet : idChiTiet
			},
			// value đại diện cho giá trị return về
			success : function(value) {
				$("#soluong-giohang").text(value + "")
			}
		})
	})

	$(".btnXoaSpTrongGio").click(function() {
		var THIS = $(this);
		var idChiTiet = THIS.attr("data-idChiTiet-Gio")
		
		$.ajax({
			url:"/DailyShop/api/XoaGioHang",
			type:"GET",
			data: {
				idChiTiet : idChiTiet
			},
			success : function(value) {
				if (value != "notok") {
					// remove thẻ <tr> và cập nhật lại số lượng trong giỏ
					THIS.closest("tr").remove()
					$("#soluong-giohang").text(value + "")
					
					if (value === "0") {
						$("#btnUpdateCart").remove()
					}
				}
			}
		})
	})


	/* ----------------------------------------------------- phần admin ----------------------------------------------------- */


	// upload file
	var files = [];	// up nhiều file
	var tenhinh = "";
	$("#hinhsp").change(function() {
		files = event.target.files;
		tenhinh = files[0].name;
		
		forms = new FormData();
		forms.append("file", files[0]);
		
		$.ajax({
			url:"/DailyShop/api/UploadHinhAnh",
			// up file thì phải mã hóa file thành kiểu byte nên sẽ có rất nhiều ký tự
			// dạng GET bị giới hạn số ký tự nên phải xài hàm POST
			type:"POST",
			data: forms,
			contentType: false,
			enctype: "multipart/form-data",	// mã hóa dữ liệu
			processData: false,		// dừng sử lý thể data của thẻ forms ở trên
			success: function(value) {
			}
		})
	});

	// cách clone 1 thẻ div
	$("body").on("click", ".btn-themchitiet", function() {
		$(this).remove();
		var chitietClone = $("#chitietsanpham").clone().removeAttr("id");
		$("#container-chitietsanpham").append("<br>").append(chitietClone);
	});


	$("body").on("click", ".btnXoa_Row", function() {
		var THIS = $(this)
		var idSanPham = THIS.attr("data-idSanPham")
		
		$.ajax({
			url : "/DailyShop/api/XoaSanPham",
			type : "GET",
			data : {
				idSanPham : idSanPham
			},
			success : function(value) {
				if (value === "ok") {
					THIS.closest("tr").remove()
				}
			}
		})
	})

	// click vô icon viết chì trên table
	// chỉ cần đổ dữ liệu lên form còn chuyện cập nhật thì để QuanLySanPhamController lo
	$("body").on("click", ".btnCapNhat_Row", function() {
		var THIS = $(this)
		var idSanPham = THIS.attr("data-idSanPham-admin")
		
		// đổi tile thành sửa sản phẩm
		$("#txtThemVaSua").text("Cập nhật sản phẩm")
		// ẩn btnThem và hiển thị btnCapNhat, btnThoat
		$("#btnThemSanPham").addClass("hidden")
		$("#btnCapNhatSanPham").removeClass("hidden")
		$("#btnThoatCapNhat").removeClass("hidden")
		
		$.ajax({
			url:"/DailyShop/api/DoDuLieuRaForm",
			type:"POST",
			data: {
				idSanPham : idSanPham
			},
			success : function(value) {
				console.log(value)
				$("#masp").val(value.idSanPham)
				$("#tensp").val(value.tenSanPham)
				$("#danhmucsp").val(value.danhMucSanPham.idDanhMuc)
				$("#giasp").val(value.giaTien)
				$("#mota").val(value.moTa)
				if (value.gioiTinh === "male") {
					$("#rdbMale").prop("checked", true)
				} else {
					$("#rdbFemale").prop("checked", true)
				}
				
				$("#container-chitietsanpham").empty()
				len = value.chiTietSanPhams.length
				for (i = 0; i < len; i++) {
					var chitietClone = $("#chitietsanpham").clone().removeAttr("id")
					
					if (i < len - 1) {
						chitietClone.find(".btn-themchitiet").remove()
					}
					
					chitietClone.find("#mau").val(value.chiTietSanPhams[i].mausanpham.idMau)
					chitietClone.find("#size").val(value.chiTietSanPhams[i].sizesanpham.idSize)
					chitietClone.find("#soluong").val(value.chiTietSanPhams[i].soLuong)
					$("#container-chitietsanpham").append(chitietClone)
				}
			}
		})
	})

	// xuất ra danh sách chi tiết sản phẩm khi click btnChiTietHoaDon
	$("body").on("click", ".btnChiTietHoaDon", function() {
		var THIS = $(this)
		var idHoaDon = THIS.attr("data-idHoaDon")
		
		$.ajax({
			url:"/DailyShop/api/XuatThongTinHoaDon",
			type:"GET",
			data: {
				idHoaDon : idHoaDon
			},
			success : function(value) {
				var tbodysanpham = $("#sanpham-hoadon").find("tbody");
				tbodysanpham.empty();
				tbodysanpham.append(value);
			}
		})
	})



})





/* ----------------------------------------------------- Ko dc dung vo ----------------------------------------------------- */
jQuery(function($){


  /* ----------------------------------------------------------- */
  /*  1. CARTBOX 
  /* ----------------------------------------------------------- */
    
     jQuery(".aa-cartbox").hover(function(){
      jQuery(this).find(".aa-cartbox-summary").fadeIn(500);
    }
      ,function(){
          jQuery(this).find(".aa-cartbox-summary").fadeOut(500);
      }
     );   
  
  /* ----------------------------------------------------------- */
  /*  2. TOOLTIP
  /* ----------------------------------------------------------- */    
    jQuery('[data-toggle="tooltip"]').tooltip();
    jQuery('[data-toggle2="tooltip"]').tooltip();

  /* ----------------------------------------------------------- */
  /*  3. PRODUCT VIEW SLIDER 
  /* ----------------------------------------------------------- */    

    jQuery('#demo-1 .simpleLens-thumbnails-container img').simpleGallery({
        loading_image: 'demo/images/loading.gif'
    });

    jQuery('#demo-1 .simpleLens-big-image').simpleLens({
        loading_image: 'demo/images/loading.gif'
    });

  /* ----------------------------------------------------------- */
  /*  4. POPULAR PRODUCT SLIDER (SLICK SLIDER)
  /* ----------------------------------------------------------- */      

    jQuery('.aa-popular-slider').slick({
      dots: false,
      infinite: false,
      speed: 300,
      slidesToShow: 4,
      slidesToScroll: 4,
      responsive: [
        {
          breakpoint: 1024,
          settings: {
            slidesToShow: 3,
            slidesToScroll: 3,
            infinite: true,
            dots: true
          }
        },
        {
          breakpoint: 600,
          settings: {
            slidesToShow: 2,
            slidesToScroll: 2
          }
        },
        {
          breakpoint: 480,
          settings: {
            slidesToShow: 1,
            slidesToScroll: 1
          }
        }
        // You can unslick at a given breakpoint now by adding:
        // settings: "unslick"
        // instead of a settings object
      ]
    }); 

  
  /* ----------------------------------------------------------- */
  /*  5. FEATURED PRODUCT SLIDER (SLICK SLIDER)
  /* ----------------------------------------------------------- */      

    jQuery('.aa-featured-slider').slick({
        dots: false,
        infinite: false,
        speed: 300,
        slidesToShow: 4,
        slidesToScroll: 4,
        responsive: [
          {
            breakpoint: 1024,
            settings: {
              slidesToShow: 3,
              slidesToScroll: 3,
              infinite: true,
              dots: true
            }
          },
          {
            breakpoint: 600,
            settings: {
              slidesToShow: 2,
              slidesToScroll: 2
            }
          },
          {
            breakpoint: 480,
            settings: {
              slidesToShow: 1,
              slidesToScroll: 1
            }
          }
          // You can unslick at a given breakpoint now by adding:
          // settings: "unslick"
          // instead of a settings object
        ]
    });
    
  /* ----------------------------------------------------------- */
  /*  6. LATEST PRODUCT SLIDER (SLICK SLIDER)
  /* ----------------------------------------------------------- */      
    jQuery('.aa-latest-slider').slick({
        dots: false,
        infinite: false,
        speed: 300,
        slidesToShow: 4,
        slidesToScroll: 4,
        responsive: [
          {
            breakpoint: 1024,
            settings: {
              slidesToShow: 3,
              slidesToScroll: 3,
              infinite: true,
              dots: true
            }
          },
          {
            breakpoint: 600,
            settings: {
              slidesToShow: 2,
              slidesToScroll: 2
            }
          },
          {
            breakpoint: 480,
            settings: {
              slidesToShow: 1,
              slidesToScroll: 1
            }
          }
          // You can unslick at a given breakpoint now by adding:
          // settings: "unslick"
          // instead of a settings object
        ]
    });

  /* ----------------------------------------------------------- */
  /*  7. TESTIMONIAL SLIDER (SLICK SLIDER)
  /* ----------------------------------------------------------- */     
    
    jQuery('.aa-testimonial-slider').slick({
      dots: true,
      infinite: true,
      arrows: false,
      speed: 300,
      slidesToShow: 1,
      adaptiveHeight: true
    });

  /* ----------------------------------------------------------- */
  /*  8. CLIENT BRAND SLIDER (SLICK SLIDER)
  /* ----------------------------------------------------------- */  

    jQuery('.aa-client-brand-slider').slick({
        dots: false,
        infinite: false,
        speed: 300,
        autoplay: true,
        autoplaySpeed: 2000,
        slidesToShow: 5,
        slidesToScroll: 1,
        responsive: [
          {
            breakpoint: 1024,
            settings: {
              slidesToShow: 4,
              slidesToScroll: 4,
              infinite: true,
              dots: true
            }
          },
          {
            breakpoint: 600,
            settings: {
              slidesToShow: 2,
              slidesToScroll: 2
            }
          },
          {
            breakpoint: 480,
            settings: {
              slidesToShow: 1,
              slidesToScroll: 1
            }
          }
          // You can unslick at a given breakpoint now by adding:
          // settings: "unslick"
          // instead of a settings object
        ]
    });

  /* ----------------------------------------------------------- */
  /*  9. PRICE SLIDER  (noUiSlider SLIDER)
  /* ----------------------------------------------------------- */        

    jQuery(function(){
      if($('body').is('.productPage')){
       var skipSlider = document.getElementById('skipstep');
        noUiSlider.create(skipSlider, {
            range: {
                'min': 0,
                '10%': 10,
                '20%': 20,
                '30%': 30,
                '40%': 40,
                '50%': 50,
                '60%': 60,
                '70%': 70,
                '80%': 80,
                '90%': 90,
                'max': 100
            },
            snap: true,
            connect: true,
            start: [20, 70]
        });
        // for value print
        var skipValues = [
          document.getElementById('skip-value-lower'),
          document.getElementById('skip-value-upper')
        ];

        skipSlider.noUiSlider.on('update', function( values, handle ) {
          skipValues[handle].innerHTML = values[handle];
        });
      }
    });


    
  /* ----------------------------------------------------------- */
  /*  10. SCROLL TOP BUTTON
  /* ----------------------------------------------------------- */

  //Check to see if the window is top if not then display button

    jQuery(window).scroll(function(){
      if ($(this).scrollTop() > 300) {
        $('.scrollToTop').fadeIn();
      } else {
        $('.scrollToTop').fadeOut();
      }
    });
     
    //Click event to scroll to top

    jQuery('.scrollToTop').click(function(){
      $('html, body').animate({scrollTop : 0},800);
      return false;
    });
  
  /* ----------------------------------------------------------- */
  /*  11. PRELOADER
  /* ----------------------------------------------------------- */

    jQuery(window).load(function() { // makes sure the whole site is loaded      
      jQuery('#wpf-loader-two').delay(200).fadeOut('slow'); // will fade out      
    })

  /* ----------------------------------------------------------- */
  /*  12. GRID AND LIST LAYOUT CHANGER 
  /* ----------------------------------------------------------- */

  jQuery("#list-catg").click(function(e){
    e.preventDefault(e);
    jQuery(".aa-product-catg").addClass("list");
  });
  jQuery("#grid-catg").click(function(e){
    e.preventDefault(e);
    jQuery(".aa-product-catg").removeClass("list");
  });


  /* ----------------------------------------------------------- */
  /*  13. RELATED ITEM SLIDER (SLICK SLIDER)
  /* ----------------------------------------------------------- */      

    jQuery('.aa-related-item-slider').slick({
      dots: false,
      infinite: false,
      speed: 300,
      slidesToShow: 4,
      slidesToScroll: 4,
      responsive: [
        {
          breakpoint: 1024,
          settings: {
            slidesToShow: 3,
            slidesToScroll: 3,
            infinite: true,
            dots: true
          }
        },
        {
          breakpoint: 600,
          settings: {
            slidesToShow: 2,
            slidesToScroll: 2
          }
        },
        {
          breakpoint: 480,
          settings: {
            slidesToShow: 1,
            slidesToScroll: 1
          }
        }
        // You can unslick at a given breakpoint now by adding:
        // settings: "unslick"
        // instead of a settings object
      ]
    });
});

