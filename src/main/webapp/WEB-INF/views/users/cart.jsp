<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

  <form>
  	  <div>
        <div class="container">
            <div>
                <h4>GIỎ HÀNG CỦA BẠN</h4>

            </div>
            <hr  style="width: 300px; font-weight: 700; color: #ff5800;">
            <div class="mt-5">
                <table class="table table-bordered">
                    <tr>
                        <th colspan="2">SẢN PHẨM</th>
                        <th>GIÁ</th>
                        <th>SỐ LƯỢNG</th>
                        <th>TỔNG TIỀN</th>
                    </tr>
                  	<c:forEach var="cartitem" items="${listcartUserAction}">
                  		  <tr>
                        <td style="text-align: center; width: 200px;"><img src="../../image/${cartitem.bookId.bookImage}"
                                width="100%" class="py-2" alt=""></td>
                        <td style="font-size: 17px; font-weight: 600;">${cartitem.bookId.bookTitle}</td>
                        <td style="font-size: 20px; font-weight: 600;">${cartitem.bookId.price}đ <del
                                style="font-size: 16px; font-weight:300;">53.000đ</del></td>
                        <td class="w-25">
                            <div>
                                <p style="margin-bottom:-1px; font-size: 14px; color: #999;"> Số lượng</p>
                                <input class="w-50" name="quantityCartitem" value="${cartitem.quantityCart}" type="number" min="1" /> <br>
                                <button class="del-cartbtn mt-1" formaction="/cart/deleteitem/${cartitem.cartId}">Xoá</button> <button class="mt-1 update-cartbtn" formaction="/cart/updateitem/${cartitem.cartId}">Cập
                                    nhật</button>
                            </div>
                        </td>
                        <td>
                            <h style="font-size: 20px; font-weight: 600;">${cartitem.bookId.price *cartitem.quantityCart}₫</h4>
                        </td>
                    </tr>
                  	</c:forEach>
                  
                </table>

            </div>
        </div>
        <div class="container">
            <div class="cartdescri float-start">
                <div class="incarrtdescri">
                    <div>
                        <p style="font-size: 12px; font-weight: 500; color: gray;"><span class="badge bg-danger">NOTE</span>  Thêm ghi chú cho đơn hàng</p>
                    </div>
                    <div>
                        <textarea class="form-control" style="background-color:#eee" rows="5" id="comment" name="text"></textarea>
                    </div>
                </div>
            </div>
            <div class="cartdescri float-end" style="margin-left: 2%;">
                <div style="text-align: right;margin: 30px;">
                    <p>
                        <span style="font-size: 18px; font-weight: 600;">TẠM TÍNH : </span>
                         <span style="font-size: 16px; font-weight: 700; color: #ff5800;">${totalPrice}đ</span>
                    </p>
                    <p style="font-size: 16px; color: #666; font-style: italic; margin-top: -15px;">
                        Phí vận chuyển sẽ được tính ở trang Thanh toán
                    </p>
                    <div>
                        <a href="#" class="linkcart">Tiếp tục mua hàng</a>
                        <a href="#" class="linkcart">Cập nhật</a>
                        <a href="/action/buy" class="linkcart">Thanh toán</a>
                    </div>
                </div>
            </div>
        </div>
       
    </div>
    <div style="clear: both;"></div>
    <div class="container mt-2">
        <div class="form-check">
            <input class="form-check-input" type="checkbox">
            <label class="form-check-label">Xuất hoá đơn công ty</label>
          </div>
    </div>

    
        <div class="container mt-5">
            <div style="border: 1px solid #ddd; height: 1150px;">
                <div class="top-flash">
                    <div style="font-weight:normal  ; color: white;" class="ms-2 float-start">
                        <h4 style="font-size: 16px; line-height: 50px;">MUA THÊM 150,900₫ ĐỂ ĐƯỢC GIẢM 11K PHÍ SHIP</h4>
                    </div>
                    <div style="font-weight:normal  ; color: white;" class="ms-2 float-end me-2 mt-2">
                        <button
                            style="background-color: white; height: 30px; width: 30px; border: none; margin-right: 10px;">
                            < </button>
                                <button
                                    style="background-color: white; height: 30px; width: 30px; border: none;">></button>
                    </div>
                </div>
                <div class="body-flash">
                    <div class="body-inbodyflash">
                        <div class="itembodycart float-start ms-1">
                            <div class="itemsbodyproduct con text-center">
                                <a href="#"> <img src="../../image/SBH_8931805006121.jpg"
                                        style="position: relative;" class="my-1" width="70%" alt=""></a>
                                <div class="More">
                                    <div class="text_a">
                                        <a href="#"><img src="../../Icon/menu.png" alt=""></a>
                                    </div>
                                </div>
                            </div>
                            <div class="itemtitle ms-3 mt-2">
                                <div>
                                    <a href="#" class="titleitem">
                                        <p>Sách giáo khoa</p>
                                    </a>
                                    <div style="margin-top: -14px;font-size: 14px;">
                                        <i class="bi bi-star text-warning"></i>
                                        <i class="bi bi-star text-warning"></i>
                                        <i class="bi bi-star text-warning"></i>
                                        <i class="bi bi-star text-warning"></i>
                                        <i class="bi bi-star text-warning"></i>
                                        <span>0 đánh giá</span>
                                    </div>
                                    <div>
                                        <span style="color: #f60; font-weight: 700;">105,006đ </span>
                                        <span style="color: #b1b1b1; font-size: 16px; font-weight: normal;"><del>132,000đ
                                            </del></span>
                                    </div>                           
                                </div>
                            </div>
                        </div>
                        <div class="itembodycart float-start ms-1">
                            <div class="itemsbodyproduct con text-center">
                                <a href="#"> <img src="../../image/SBH_8931805006121.jpg"
                                        style="position: relative;" class="my-1" width="70%" alt=""></a>
                                <div class="More">
                                    <div class="text_a">
                                        <a href="#"><img src="../../Icon/menu.png" alt=""></a>
                                    </div>
                                </div>
                            </div>
                            <div class="itemtitle ms-3 mt-2">
                                <div>
                                    <a href="#" class="titleitem">
                                        <p>Sách tinh khôi cho bé rèn </p>
                                    </a>
                                    <div style="margin-top: -14px;font-size: 14px;">
                                        <i class="bi bi-star text-warning"></i>
                                        <i class="bi bi-star text-warning"></i>
                                        <i class="bi bi-star text-warning"></i>
                                        <i class="bi bi-star text-warning"></i>
                                        <i class="bi bi-star text-warning"></i>
                                        <span>0 đánh giá</span>
                                    </div>
                                    <div>
                                        <span style="color: #f60; font-weight: 700;">105,006đ </span>
                                        <span style="color: #b1b1b1; font-size: 16px; font-weight: normal;"><del>132,000đ
                                            </del></span>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="itembodycart float-start ms-1">
                            <div class="itemsbodyproduct con text-center">
                                <a href="#"> <img src="../../image/SBH_8931805006121.jpg"
                                        style="position: relative;" class="my-1" width="70%" alt=""></a>
                                <div class="More">
                                    <div class="text_a">
                                        <a href="#"><img src="../../Icon/menu.png" alt=""></a>
                                    </div>
                                </div>
                            </div>
                            <div class="itemtitle ms-3 mt-2">
                                <div>
                                    <a href="#" class="titleitem">
                                        <p>Sách giáo khoa</p>
                                    </a>
                                    <div style="margin-top: -14px;font-size: 14px;">
                                        <i class="bi bi-star text-warning"></i>
                                        <i class="bi bi-star text-warning"></i>
                                        <i class="bi bi-star text-warning"></i>
                                        <i class="bi bi-star text-warning"></i>
                                        <i class="bi bi-star text-warning"></i>
                                        <span>0 đánh giá</span>
                                    </div>
                                    <div>
                                        <span style="color: #f60; font-weight: 700;">105,006đ </span>
                                        <span style="color: #b1b1b1; font-size: 16px; font-weight: normal;"><del>132,000đ
                                            </del></span>
                                    </div>

                                </div>
                            </div>
                        </div>
                        <div class="itembodycart float-start ms-1">
                            <div class="itemsbodyproduct con text-center">
                                <a href="#"> <img src="../../image/SBH_8931805006121.jpg"
                                        style="position: relative;" class="my-1" width="70%" alt=""></a>
                                <div class="More">
                                    <div class="text_a">
                                        <a href="#"><img src="../../Icon/menu.png" alt=""></a>
                                    </div>
                                </div>
                            </div>
                            <div class="itemtitle ms-3 mt-2">
                                <div>
                                    <a href="#" class="titleitem">
                                        <p>Sách giáo khoa</p>
                                    </a>
                                    <div style="margin-top: -14px;font-size: 14px;">
                                        <i class="bi bi-star text-warning"></i>
                                        <i class="bi bi-star text-warning"></i>
                                        <i class="bi bi-star text-warning"></i>
                                        <i class="bi bi-star text-warning"></i>
                                        <i class="bi bi-star text-warning"></i>
                                        <span>0 đánh giá</span>
                                    </div>
                                    <div>
                                        <span style="color: #f60; font-weight: 700;">105,006đ </span>
                                        <span style="color: #b1b1b1; font-size: 16px; font-weight: normal;"><del>132,000đ
                                            </del></span>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="itembodycart float-start ms-1">
                            <div class="itemsbodyproduct con text-center">
                                <a href="#"> <img src="../../image/SBH_8931805006121.jpg"
                                        style="position: relative;" class="my-1" width="70%" alt=""></a>
                                <div class="More">
                                    <div class="text_a">
                                        <a href="#"><img src="../../Icon/menu.png" alt=""></a>
                                    </div>
                                </div>
                            </div>
                            <div class="itemtitle ms-3  mt-2">
                                <div>
                                    <a href="#" class="titleitem">
                                        <p>Sách giáo khoa</p>
                                    </a>
                                    <div style="margin-top: -14px;font-size: 14px;">
                                        <i class="bi bi-star text-warning"></i>
                                        <i class="bi bi-star text-warning"></i>
                                        <i class="bi bi-star text-warning"></i>
                                        <i class="bi bi-star text-warning"></i>
                                        <i class="bi bi-star text-warning"></i>
                                        <span>0 đánh giá</span>
                                    </div>
                                    <div>
                                        <span style="color: #f60; font-weight: 700;">105,006đ </span>
                                        <span style="color: #b1b1b1; font-size: 16px; font-weight: normal;"><del>132,000đ
                                            </del></span>
                                    </div>

                                </div>
                            </div>
                        </div>
                        <div class="itembodycart float-start ms-1">
                            <div class="itemsbodyproduct con text-center">
                                <a href="#"> <img src="../../image/SBH_8931805006121.jpg"
                                        style="position: relative;" class="my-1" width="70%" alt=""></a>
                                <div class="More">
                                    <div class="text_a">
                                        <a href="#"><img src="../../Icon/menu.png" alt=""></a>
                                    </div>
                                </div>
                            </div>
                            <div class="itemtitle ms-3 mt-2">
                                <div>
                                    <a href="#" class="titleitem">
                                        <p>Sách giáo khoa s</p>
                                    </a>
                                    <div style="margin-top: -14px;font-size: 14px;">
                                        <i class="bi bi-star text-warning"></i>
                                        <i class="bi bi-star text-warning"></i>
                                        <i class="bi bi-star text-warning"></i>
                                        <i class="bi bi-star text-warning"></i>
                                        <i class="bi bi-star text-warning"></i>
                                        <span>0 đánh giá</span>
                                    </div>
                                    <div>
                                        <span style="color: #f60; font-weight: 700;">105,006đ </span>
                                        <span style="color: #b1b1b1; font-size: 16px; font-weight: normal;"><del>132,000đ
                                            </del></span>
                                    </div>
                                   

                                </div>
                            </div>
                        </div>
                        <div class="itembodycart float-start ms-1">
                            <div class="itemsbodyproduct con text-center">
                                <a href="#"> <img src="../../image/SBH_8931805006121.jpg"
                                        style="position: relative;" class="my-1" width="70%" alt=""></a>
                                <div class="More">
                                    <div class="text_a">
                                        <a href="#"><img src="../../Icon/menu.png" alt=""></a>
                                    </div>
                                </div>
                            </div>
                            <div class="itemtitle ms-3 mt-2">
                                <div>
                                    <a href="#" class="titleitem">
                                        <p>Sách giáo khoa s</p>
                                    </a>
                                    <div style="margin-top: -14px;font-size: 14px;">
                                        <i class="bi bi-star text-warning"></i>
                                        <i class="bi bi-star text-warning"></i>
                                        <i class="bi bi-star text-warning"></i>
                                        <i class="bi bi-star text-warning"></i>
                                        <i class="bi bi-star text-warning"></i>
                                        <span>0 đánh giá</span>
                                    </div>
                                    <div>
                                        <span style="color: #f60; font-weight: 700;">105,006đ </span>
                                        <span style="color: #b1b1b1; font-size: 16px; font-weight: normal;"><del>132,000đ
                                            </del></span>
                                    </div>
                                  

                                </div>
                            </div>
                        </div>
                        <div class="itembodycart float-start ms-1">
                            <div class="itemsbodyproduct con text-center">
                                <a href="#"> <img src="../../image/SBH_8931805006121.jpg"
                                        style="position: relative;" class="my-1" width="70%" alt=""></a>
                                <div class="More">
                                    <div class="text_a">
                                        <a href="#"><img src="../../Icon/menu.png" alt=""></a>
                                    </div>
                                </div>
                            </div>
                            <div class="itemtitle ms-3 mt-2">
                                <div>
                                    <a href="#" class="titleitem">
                                        <p>Sách giáo khoa s</p>
                                    </a>
                                    <div style="margin-top: -14px;font-size: 14px;">
                                        <i class="bi bi-star text-warning"></i>
                                        <i class="bi bi-star text-warning"></i>
                                        <i class="bi bi-star text-warning"></i>
                                        <i class="bi bi-star text-warning"></i>
                                        <i class="bi bi-star text-warning"></i>
                                        <span>0 đánh giá</span>
                                    </div>
                                    <div>
                                        <span style="color: #f60; font-weight: 700;">105,006đ </span>
                                        <span style="color: #b1b1b1; font-size: 16px; font-weight: normal;"><del>132,000đ
                                            </del></span>
                                    </div>
                                   
                                </div>
                            </div>
                        </div>
                        <div class="itembodycart float-start ms-1">
                            <div class="itemsbodyproduct con text-center">
                                <a href="#"> <img src="../../image/SBH_8931805006121.jpg"
                                        style="position: relative;" class="my-1" width="70%" alt=""></a>
                                <div class="More">
                                    <div class="text_a">
                                        <a href="#"><img src="../../Icon/menu.png" alt=""></a>
                                    </div>
                                </div>
                            </div>
                            <div class="itemtitle ms-3 mt-2">
                                <div>
                                    <a href="#" class="titleitem">
                                        <p>Sách giáo khoa s</p>
                                    </a>
                                    <div style="margin-top: -14px;font-size: 14px;">
                                        <i class="bi bi-star text-warning"></i>
                                        <i class="bi bi-star text-warning"></i>
                                        <i class="bi bi-star text-warning"></i>
                                        <i class="bi bi-star text-warning"></i>
                                        <i class="bi bi-star text-warning"></i>
                                        <span>0 đánh giá</span>
                                    </div>
                                    <div>
                                        <span style="color: #f60; font-weight: 700;">105,006đ </span>
                                        <span style="color: #b1b1b1; font-size: 16px; font-weight: normal;"><del>132,000đ
                                            </del></span>
                                    </div>
                                  
                                </div>
                            </div>
                        </div>
                        <div class="itembodycart float-start ms-1">
                            <div class="itemsbodyproduct con text-center">
                                <a href="#"> <img src="../../image/SBH_8931805006121.jpg"
                                        style="position: relative;" class="my-1" width="70%" alt=""></a>
                                <div class="More">
                                    <div class="text_a">
                                        <a href="#"><img src="../../Icon/menu.png" alt=""></a>
                                    </div>
                                </div>
                            </div>
                            <div class="itemtitle ms-3 mt-2">
                                <div>
                                    <a href="#" class="titleitem">
                                        <p>Sách giáo khoa s</p>
                                    </a>
                                    <div style="margin-top: -14px;font-size: 14px;">
                                        <i class="bi bi-star text-warning"></i>
                                        <i class="bi bi-star text-warning"></i>
                                        <i class="bi bi-star text-warning"></i>
                                        <i class="bi bi-star text-warning"></i>
                                        <i class="bi bi-star text-warning"></i>
                                        <span>0 đánh giá</span>
                                    </div>
                                    <div>
                                        <span style="color: #f60; font-weight: 700;">105,006đ </span>
                                        <span style="color: #b1b1b1; font-size: 16px; font-weight: normal;"><del>132,000đ
                                            </del></span>
                                    </div>
                                 
                                </div>
                            </div>
                        </div>
                        <div class="itembodycart float-start ms-1">
                            <div class="itemsbodyproduct con text-center">
                                <a href="#"> <img src="../../image/SBH_8931805006121.jpg"
                                        style="position: relative;" class="my-1" width="70%" alt=""></a>
                                <div class="More">
                                    <div class="text_a">
                                        <a href="#"><img src="../../Icon/menu.png" alt=""></a>
                                    </div>
                                </div>
                            </div>
                            <div class="itemtitle ms-3 mt-2">
                                <div>
                                    <a href="#" class="titleitem">
                                        <p>Sách giáo khoa s</p>
                                    </a>
                                    <div style="margin-top: -14px;font-size: 14px;">
                                        <i class="bi bi-star text-warning"></i>
                                        <i class="bi bi-star text-warning"></i>
                                        <i class="bi bi-star text-warning"></i>
                                        <i class="bi bi-star text-warning"></i>
                                        <i class="bi bi-star text-warning"></i>
                                        <span>0 đánh giá</span>
                                    </div>
                                    <div>
                                        <span style="color: #f60; font-weight: 700;">105,006đ </span>
                                        <span style="color: #b1b1b1; font-size: 16px; font-weight: normal;"><del>132,000đ
                                            </del></span>
                                    </div>
                                  
                                </div>
                            </div>
                        </div>
                        <div class="itembodycart float-start ms-1">
                            <div class="itemsbodyproduct con text-center">
                                <a href="#"> <img src="../../image/SBH_8931805006121.jpg"
                                        style="position: relative;" class="my-1" width="70%" alt=""></a>
                                <div class="More">
                                    <div class="text_a">
                                        <a href="#"><img src="../../Icon/menu.png" alt=""></a>
                                    </div>
                                </div>
                            </div>
                            <div class="itemtitle ms-3 mt-2">
                                <div>
                                    <a href="#" class="titleitem">
                                        <p>Sách giáo khoa s</p>
                                    </a>
                                    <div style="margin-top: -14px;font-size: 14px;">
                                        <i class="bi bi-star text-warning"></i>
                                        <i class="bi bi-star text-warning"></i>
                                        <i class="bi bi-star text-warning"></i>
                                        <i class="bi bi-star text-warning"></i>
                                        <i class="bi bi-star text-warning"></i>
                                        <span>0 đánh giá</span>
                                    </div>
                                    <div>
                                        <span style="color: #f60; font-weight: 700;">105,006đ </span>
                                        <span style="color: #b1b1b1; font-size: 16px; font-weight: normal;"><del>132,000đ
                                            </del></span>
                                    </div>
                                  
                                </div>
                            </div>
                        </div>
                        <div class="itembodycart float-start ms-1">
                            <div class="itemsbodyproduct con text-center">
                                <a href="#"> <img src="../../image/SBH_8931805006121.jpg"
                                        style="position: relative;" class="my-1" width="70%" alt=""></a>
                                <div class="More">
                                    <div class="text_a">
                                        <a href="#"><img src="../../Icon/menu.png" alt=""></a>
                                    </div>
                                </div>
                            </div>
                            <div class="itemtitle ms-3 mt-2">
                                <div>
                                    <a href="#" class="titleitem">
                                        <p>Sách giáo khoa s</p>
                                    </a>
                                    <div style="margin-top: -14px;font-size: 14px;">
                                        <i class="bi bi-star text-warning"></i>
                                        <i class="bi bi-star text-warning"></i>
                                        <i class="bi bi-star text-warning"></i>
                                        <i class="bi bi-star text-warning"></i>
                                        <i class="bi bi-star text-warning"></i>
                                        <span>0 đánh giá</span>
                                    </div>
                                    <div>
                                        <span style="color: #f60; font-weight: 700;">105,006đ </span>
                                        <span style="color: #b1b1b1; font-size: 16px; font-weight: normal;"><del>132,000đ
                                            </del></span>
                                    </div>
                                  
                                </div>
                            </div>
                        </div>
                        <div class="itembodycart float-start ms-1">
                            <div class="itemsbodyproduct con text-center">
                                <a href="#"> <img src="../../image/SBH_8931805006121.jpg"
                                        style="position: relative;" class="my-1" width="70%" alt=""></a>
                                <div class="More">
                                    <div class="text_a">
                                        <a href="#"><img src="../../Icon/menu.png" alt=""></a>
                                    </div>
                                </div>
                            </div>
                            <div class="itemtitle ms-3 mt-2">
                                <div>
                                    <a href="#" class="titleitem">
                                        <p>Sách giáo khoa s</p>
                                    </a>
                                    <div style="margin-top: -14px;font-size: 14px;">
                                        <i class="bi bi-star text-warning"></i>
                                        <i class="bi bi-star text-warning"></i>
                                        <i class="bi bi-star text-warning"></i>
                                        <i class="bi bi-star text-warning"></i>
                                        <i class="bi bi-star text-warning"></i>
                                        <span>0 đánh giá</span>
                                    </div>
                                    <div>
                                        <span style="color: #f60; font-weight: 700;">105,006đ </span>
                                        <span style="color: #b1b1b1; font-size: 16px; font-weight: normal;"><del>132,000đ
                                            </del></span>
                                    </div>
                                  
                                </div>
                            </div>
                        </div>
                        <div class="itembodycart float-start ms-1">
                            <div class="itemsbodyproduct con text-center">
                                <a href="#"> <img src="../../image/SBH_8931805006121.jpg"
                                        style="position: relative;" class="my-1" width="70%" alt=""></a>
                                <div class="More">
                                    <div class="text_a">
                                        <a href="#"><img src="../../Icon/menu.png" alt=""></a>
                                    </div>
                                </div>
                            </div>
                            <div class="itemtitle ms-3 mt-2">
                                <div>
                                    <a href="#" class="titleitem">
                                        <p>Sách giáo khoa s</p>
                                    </a>
                                    <div style="margin-top: -14px;font-size: 14px;">
                                        <i class="bi bi-star text-warning"></i>
                                        <i class="bi bi-star text-warning"></i>
                                        <i class="bi bi-star text-warning"></i>
                                        <i class="bi bi-star text-warning"></i>
                                        <i class="bi bi-star text-warning"></i>
                                        <span>0 đánh giá</span>
                                    </div>
                                    <div>
                                        <span style="color: #f60; font-weight: 700;">105,006đ </span>
                                        <span style="color: #b1b1b1; font-size: 16px; font-weight: normal;"><del>132,000đ
                                            </del></span>
                                    </div>
                                  
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

        </div>
  	
  </form>