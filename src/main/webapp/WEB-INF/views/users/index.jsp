<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Nhân Văn</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-iYQeCzEYFbKjA/T2uDLTpkwGzCiq6soy8tYaI1GyVh/UjpbCx/TYkiZhlZB6+fzT" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css"
        integrity="sha384-DyZ88mC6Up2uqS4h/KRgHuoeGwBcD4Ng9SiP4dIRy0EXTlnuz47vAwmeGwVChigm" crossorigin="anonymous" />
    <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.6.9/angular.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.6.9/angular-route.js"></script>
    <link rel="stylesheet" href="/css/index.css">
    <link rel="stylesheet" href="/css/admin.css">
    <link rel="stylesheet" href="/css/product.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.3/font/bootstrap-icons.css">
</head>

<body>
    <div class="container-fuild">
        <header>
            <div class="header-top">
              <div class="container">
                  <div class="content-header">
                    <div class="container">
                        <ul class="nav text-white" style="line-height: 8px; ">
                            <li class="nav-item mx-3" style=" font-size: 12px; font-weight: 600;">
                                
                                Chào mừng bạn đến với NHÂN VĂN - siêu thị sách và tiện ích
                            </li>
                            <li class="nav-item mx-3" style=" font-size: 12px; font-weight: 600;">
                                <i class="bi bi-envelope text-danger"></i>
                                Email : sale@nhanvan.com
                            </li>
                            <li class="nav-item mx-3" style=" font-size: 12px; font-weight: 600;">
                                <i class="bi bi-telephone-fill text-danger"></i>

                                Hotline Mua Lẻ : 028.3636.7777
                            </li>
                            <li class="nav-item mx-3" style=" font-size: 12px; font-weight: 600;">
                                <i class="bi bi-telephone-fill text-danger"></i>
                                Hotline Mua Sỉ : 0813.709.777
                            </li>
                        </ul>
                    </div>
                  </div>
              </div>
            </div>
            <div class="">
                <div class="header-med">
                    <div class="container">
                        <div class="row py-4">
                            <div class="col-lg-3">
                                <div class="logo">
                                    <a href="/home/content"><img src="https://theme.hstatic.net/200000122283/1000637900/14/logo.png?v=10998"
                                        class="mw-100" alt=""></a>
                                </div>
                            </div>
                            <div class="col-lg-6">

                                <div class="input-group flex-nowrap rounded-pill">
                                    <input type="text" class="form-control "
                                        style="border: 1px solid #f60;border-top-left-radius:5px;border-bottom-left-radius:5px;"
                                        placeholder="Tìm kiếm tại đây" aria-label="Username"
                                        aria-describedby="addon-wrapping">
                                    <!-- <label for="">{{SearchText}}</label> -->
                                    <a href="listproduct/{{SearchText}}">
                                        <button class=""
                                            style="background-color: #f60;width: 80px; height: 40px; border: none; color: #fff;border-top-right-radius:5px;border-bottom-right-radius:5px; "
                                            type="button">
                                            <img src="icons/icon/seach1.png" alt="">
                                            Tìm kiếm
                                        </button>
                                    </a>
                                </div>
                                <div class="" style="margin-top: -20px;">
                                    <ul class="nav">
                                        <li class="nav-item">
                                            <a class="nav-link" href="#">Nguyễn Nhật Ánh</a>
                                        </li>
                                        <li class="nav-item">
                                            <a class="nav-link" href="#">Casio FX580</a>
                                        </li>
                                        <li class="nav-item">
                                            <a class="nav-link" href="#">Nhân Số học</a>
                                        </li>
                                        <li class="nav-item">
                                            <a class="nav-link" href="#">Tập học sinh</a>
                                        </li>
                                        <li class="nav-item">
                                            <a class="nav-link " href="#">Sách Minh Long</a>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                            <div class="col-lg-3">
                                <div class="float-start mx-3">
                                    <div class="float-start">
                                        <span>
                                            <a href="#">
                                                <i class="bi bi-cart2" style="font-size: 30px;"></i>
                                            </a>
                                        </span>
                                      
                                    </div>
                                    <div class="float-end">
                                        <p style="font-size: 15px" class="badge rounded-pill bg-warning">0</p>
                                        <p style="margin-top: -17px; font-size: 15px;"><a style="text-decoration: none;" href="/home/${linktocart}">Giỏ hàng</a></p>
                                    </div>
                                   
                                </div>
                                <div class="float-start mx-1">
                                    <div class="float-start">
                                        <span>
                                            <a href="$">
                                                <i class="bi bi-person" style="font-size: 30px;"></i>
                                            </a>
                                        </span>
                                      
                                    </div>
                                    <div class="float-end">
                                        <p style="font-size: 15px;">Xin chào</p>
                                        <p style="margin-top: -17px; font-size: 14px;"><a href="/home/${linkforlogin}">${messageUser}</a></p>
                                    </div>

                                </div>

                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="header-bot">
                <div class="container ">
                    <div class="row" style="height: 50px;">
                        <div class="col-sm-3">
                            <div class="title-menu">
                               <span style="line-height: 50px; float: left; margin-left: 20px;">DANH MỤC</span>
                                <span style="float: right; line-height: 50px; margin-right: 20px;">
                                    <img src="/Icon/menu.png" alt="">
                                </span>
                            </div>
                        </div>
                        <div class="col-lg-9">
                            <div class="title-menu-2">
                                <ul class="nav">
                                    <li class="nav-item">
                                        <a class="nav-link" href="#" style="color: red; font-weight: 500;">GIAO HÀNG
                                            NHANH 2H</a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link" href="#">SÁCH ĐỘC QUYỀN</a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link" href="#">SÁCH GIẢM GIÁ</a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link" href="#">SALE TRONG THÁNG</a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link " href="#">KIỂM TRA ĐƠN HÀNG</a>
                                    </li>
                                </ul>
                            </div>

                        </div>

                    </div>

                </div>
            </div>
        </header>
            <jsp:include page="${viewhome}" />

            </div>

        <footer>
            <div class="container-fuild">
                <div class="foot-header">
                    <div class="row">
                        <div class="col-sm-6">
                            <div class="icon-footheader">
                            </div>
                            <div class="text-footheader">
                                <h4 style="font-size: 16px; color: white; line-height: 100px;">ĐĂNG KÝ NHẬN TIN</h4>
                            </div>
                        </div>
                        <div class="col-sm-6">
                            <div class="search-footheader">
                                <div class="input-group flex-nowrap rounded-pill">
                                    <input type="text" class="form-control "
                                        style="border:none ;border-top-left-radius:5px;border-bottom-left-radius:5px;"
                                        placeholder="Nhập địa chỉ email của bạn" ng-model="SearchText"
                                        aria-label="Username" aria-describedby="addon-wrapping">
                                    <!-- <label for="">{{SearchText}}</label> -->
                                    <a href="#!listproduct/{{SearchText}}">
                                        <button class=""
                                            style="background-color: #f60;width: 100px; height: 40px; border: none; color: #fff;border-top-right-radius:5px;border-bottom-right-radius:5px; "
                                            type="button">
                                            <img src="icons/icon/seach1.png" alt="">
                                            Đăng ký
                                        </button>
                                    </a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="foot-body">
                    <div class="container">
                        <div class="row">
                            <div class="col-sm-6">
                                <div>
                                    <h4 style="font-size: 18px;">LIÊN HỆ</h4>
                                    <hr>

                                    <div>
                                        <h6>CÔNG TY CỔ PHẦN VĂN HÓA NHÂN VĂN</h6>
                                        <h6>MST: 0302229082</h6>
                                        <ul class="listinfo">
                                            <li>
                                                Địa chỉ: Số 1 Trường Chinh, P.11, Q.Tân Bình, Tp.Hồ Chí Minh
                                            </li>
                                            <li>
                                                Hotline: 028.3636.7777 - 0813.709.777
                                            </li>
                                            <li>
                                                Email: sale@nhanvan.vn
                                            </li>
                                            <li>
                                                Giờ mở cửa: Từ thứ 2 đến thứ 6: 8:30 am - 8 pm Thứ 7: 8:30 am - 12 pm
                                            </li>
                                        </ul>
                                        <div>
                                            <img width="25%"
                                                src="https://theme.hstatic.net/200000122283/1000637900/14/logo-bct.png?v=10998"
                                                alt="">
                                        </div>
                                        <div class="mt-3 ms-2">
                                            <img src="/Icon/facebook.jpg" width="5%" alt="">
                                            <img src="/Icon/tiwiter.jpg" width="5%" alt="">
                                            <img src="/Icon/youtube.jpg" width="5%" alt="">
                                            <img src="/Icon/zalo.jpg" width="5%" alt="">
                                        </div>
                                    </div>

                                </div>
                            </div>
                            <div class="col-sm-3">
                                <div>
                                    <h4 style="font-size: 18px;">THÔNG TIN
                                        <hr>
                                        <div>
                                            <h6>Data Call Limit : 1000</h6>

                                        </div>
                                </div>
                                <div>
                                    <h4 style="font-size: 18px; margin-top: 50px;">DỊCH VỤ</h4>
                                    <hr>

                                    <div>
                                        <h6>Data Call Limit : 1000</h6>

                                    </div>
                                </div>
                            </div>
                            <div class="col-sm-3">
                                <div>
                                    <h4 style="font-size: 18px;">FANPAGE FACEBOOK
                                        <hr>
                                        <div>
                                            <img src="https://theme.hstatic.net/200000122283/1000637900/14/three_index_1.jpg?v=10998"
                                                width="100%" height="150px" alt="">

                                        </div>
                                        <div class="mt-3 ms-3">
                                            <img src="/Icon/shoppe.jpg" width="12%" alt="">
                                            <img src="/Icon/tiki.jpg" width="12%" alt="">
                                            <img src="/Icon/lazada.jpg" width="12%" alt="">
                                        </div>
                                </div>
                                <div>

                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="foot-bodyfoot">
                        <hr>
                    </div>
                </div>
                <div class="foot-foot mb-5">
                    <div class="container">
                        <div class="row">
                            <div class="col-sm-4">
                                <div class="float-start">
                                    <h5 style="font-size: 15px;margin-top: 10px; margin-right: 10px;">TẢI ỨNG DỤNG</h5>
                                </div>
                                <div class="float-start">
                                    <span>
                                        <div">
                                            <img src="/Icon/appstore.jpg" width="45%" alt="">
                                            <img class="ms-1" src="/Icon/googleplay.jpg" width="45%" alt="">
                                </div>
                                </span>
                            </div>
                            <div class="col-sm-4 text-center">
                                Copyright © 2023. All Rights Reserved. Siêu Thị Sách & Tiện Ích Nhân Văn
                            </div>
                            <div class="col-sm-4 text-center">
                               <img src="/Icon/payzalomomomoca.jpg" alt="">
                            </div>
                        </div>
                       
                    </div>
               
            </div>
        </footer>



    </div>
    <script src="../../js/index.js"></script>
 
</body>

</html>