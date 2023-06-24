<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>

<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>

    <div class="container my-5">
        <div class="row">
           <div class="col-sm-5">
            <form action="" class="form-control">
                <label for="" class="form-label" >Nhập tên người nhận</label>
                <input type="text" name= "buyname" class="form-control" placeholder="name"> <br>
                <label for=""  class="form-label">Địa chỉ người nhận</label>
                <input type="text"  name= "buyaddress" class="form-control" placeholder="address"> <br>
                <label for="" class="form-label">Số điện thoại người nhận</label>
                <input type="text"  name= "buyphone" class="form-control" placeholder="phone"> <br>
                <!-- <label for="" class="form-control">Số điện thoại người nhận</label>
                <input type="text" class="form-control" placeholder="phone"> <br> -->
                 <p class="mt-5">
                <span style="font-size: 18px; font-weight: 600;">TẠM TÍNH : </span>
                 <span style="font-size: 16px; font-weight: 700; color: #ff5800;">${totalPrice}đ</span>
            </p>
            <div class="mt-5">

                <button formaction="/home/cart" formmethod="post" class="btn btn-primary">Trờ về</button>
            <button formaction="/user/buy/${totalPrice}" formmethod="post"  class="btn btn-primary float-end">Đặt hàng</button>
            </div>
            </form>
           
           </div>
           <div class="col-sm-7">
            <table class="table table-bordered">
                <tr>
                    <th colspan="2">SẢN PHẨM</th>
                    <th>GIÁ</th>
                    <th>SỐ LƯỢNG</th>
                    <th>TỔNG TIỀN</th>
                </tr>
                  <c:forEach var="cartitem" items="${listcart}">
                        <tr>
                    <td style="text-align: center; width: 100px;"><img src="../../image/${cartitem.bookId.bookImage}"
                            width="100%" class="py-2" alt=""></td>
                    <td style="font-size: 14px; font-weight: 400;">${cartitem.bookId.bookTitle}</td>
                    <td style="font-size: 14px; font-weight: 400;">${cartitem.bookId.price}đ <del
                            style="font-size: 14px; font-weight: 400;">53.000đ</del></td>
                    <td class="w-25">
                        <div>
                            <p style="margin-bottom:-1px; font-size: 14px; color: #999;"> Số lượng</p>
                            <input class="w-50" name="quantityCartitem" value="${cartitem.quantityCart}" type="number" min="1" /> <br>
                           
                        </div>
                    </td>
                    <td>
                        <h style="font-size: 14px; font-weight: 400;">${cartitem.bookId.price *cartitem.quantityCart}₫</h4>
                    </td>
                </tr>
                  </c:forEach>
              
            </table>

           </div>
        </div>
       

    </div>
