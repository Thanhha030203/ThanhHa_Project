<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<form>
	<div class="container mt-5">
    <div class="row">
        <div class="col-sm-4">
            <div class="img-product">
                <img src="../../image/${product.bookImage}" width="100%" alt="">
            </div>
        </div>
        <div class="col-sm-5">
            <div class="info-product">
                <h1>${product.bookTitle}</h1>
                <p><strong>SKU:</strong>${product.bookCode}</p>
                <p><span class="avaliable">khả dụng</span><span>Còn hàng</span></p>
                <p><span class="avaliable">loại sản phẩm</span><span>${product.booktype.bookTypeName}</span></p>
                <div>
                    <div class="price-product">${product.price}đ</div>
                </div>
                <div class="quanlity-product">
                    <div><label for="" style="float: left; margin: 5px 10px;font-weight: 500; font-size: 14px;">Số
                            lượng</label>
                        <input type="number" class="sl" min="1" value="1" name="quanlityBuy">
                    </div>
                </div>
                <button class="add-cartproduct ms-2" formaction="/product/addcart?id=${product.bookCode}">Thêm vào giỏ</button>
                <button class="add-cartproduct">Mua ngay</button>
                <div style="clear: both;"><span class="face-product">Sản phẩm này chỉ có mặt ở 2 cửa hàng</span>
                </div>
                <hr>
                <div>
                    <p><strong class="convient-product">ưu đãi của bạn</strong></p>
                </div>
                <hr>
                <div class="promotion-product">
                    HOÀN TIỀN 101% | ĐỔI TRẢ TRONG 07 NGÀY | TÍCH LŨY NV-POINT | NHIỀU MÃ ƯU ĐÃI
                </div>
            </div>
        </div>
        <div class="col-sm-3">
            <div class="side-product">
                <div class="card">
                    <div class="card-header">
                        <h5>DANH MỤC SẢN PHẨM</h5>
                    </div>
                    <div class="card-body">
                        <div class="list-group list-group-flush">
                            <a href="#" class="list-group-item list-group-item-action">KHO TÀNG SÁCH(49883)</a>
                            <a href="#" class="list-group-item list-group-item-action">SÁCH GIÁO KHOA(26)</a>
                            <a href="#" class="list-group-item list-group-item-action">VĂN PHÒNG PHẨM(6670)</a>
                            <a href="#" class="list-group-item list-group-item-action">ĐỒ CHƠI(275)</a>
                            <a href="#" class="list-group-item list-group-item-action">QUÀ TẶNG(62)</a>
                            <a href="#" class="list-group-item list-group-item-action">BÁCH HÓA(2205)</a>
                            <a href="#" class="list-group-item list-group-item-action">THỜI TRANG - LÀM ĐẸP(44)</a>
                            <a href="#" class="list-group-item list-group-item-action">NHÀ CỬA - ĐỜI SỐNG(275)</a>
                            <a href="#" class="list-group-item list-group-item-action">CÔNG NGHỆ(62)</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="col-sm-9">
            <div class="product-recommond">
                <div>
                    <h4 class="title-recommand">
                        <span style="font-weight: normal;">Thường được</span> mua cùng
                    </h4>
                </div>
                <div class="items-recommad mt-4">
                    <div class="item-recommad">
                        <div>
                            <img src="../../image/SBH_9786040334473.jpg" width="100%" alt="">
                        </div>
                        <div class="mt-2">
                            Sách toán lớp 5
                        </div>
                        <div class="my-3" style="font-size: 13px; font-weight: 700;">13.000đ</div>
                    </div>
                    <div class="item-recommad">
                        <div>
                            <img src="../../image/SBH_9786040334473.jpg" width="100%" alt="">
                        </div>
                        <div class="mt-2">
                            Sách toán lớp 5
                        </div>
                        <div class="my-3" style="font-size: 13px; font-weight: 700;">13.000đ</div>
                    </div>
                    <div class="item-recommad">
                        <div>
                            <img src="../../image/SBH_9786040334473.jpg" width="100%" alt="">
                        </div>
                        <div class="mt-2">
                            Sách toán lớp 5
                        </div>
                        <div class="my-3" style="font-size: 13px; font-weight: 700;">13.000đ</div>
                    </div>
                    <div class="item-recommad">
                        <div>
                            <img src="../../image/SBH_9786040334473.jpg" width="100%" alt="">
                        </div>
                        <div class="mt-2">
                            Sách toán lớp 5
                        </div>
                        <div class="my-3" style="font-size: 13px; font-weight: 700;">13.000đ</div>
                    </div>
                    <div class="item-recommad">
                        <div>
                            <img src="../../image/SBH_9786040334473.jpg" width="100%" alt="">
                        </div>
                        <div class="mt-2">
                            Sách toán lớp 5
                        </div>
                        <div class="my-3" style="font-size: 13px; font-weight: 700;">13.000đ</div>
                    </div>
                    <div style="clear: both;"></div>

                </div>

            </div>
        </div>
        <div class="col-sm-3">
            <img src="../../image/quangcaotrongsanpham.jpg" width="100%" alt="">
        </div>
    </div>
    <div class="row">
        <div class="col-sm-9" style="border: 1px solid #ddd;">
            <ul class="nav nav-tabs" role="tablist">
                <li class="nav-item">
                    <a class="nav-link active" data-bs-toggle="tab" href="#motasanpham">MÔ TẢ SẢN PHẨM</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" data-bs-toggle="tab" href="#chinhsachkhachsi">CHÍNH SÁCH KHÁCH SỈ</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" data-bs-toggle="tab" href="#chinhsachthanhvien">CHÍNH SÁCH THÀNH VIÊN</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" data-bs-toggle="tab" href="#danhgiasanpham">ĐÁNH GIÁ SẢN PHẨM</a>
                </li>
            </ul>

            <!-- Tab panes -->
            <div class="tab-content">
                <div id="motasanpham" class="container tab-pane active"><br>
                    <h5>Thông tin chi tiết</h5>
                    <table class="table table-bordered table-sm w-100">
                        <tbody>
                            <tr>
                                <td>Mã hàng</td>
                                <td>${product.bookCode}</td>
                            </tr>
                            <tr>
                                <td>Tên Nhà Cung Cấp</td>
                                <td>${product.supplier.supplierName}</td>
                            </tr>
                            <tr>
                                <td>Tác giả</td>
                                <td>${product.author}</td>
                            </tr>
                          <tr>
                                <td>Năm xuất bản</td>
                                <td>${product.publishingCompany}</td>
                            </tr>
                            <tr>
                                <td>Năm xuất bản</td>
                                <td>${product.publishedYear}</td>
                            </tr>
                            <tr>
                                <td>Số trang</td>
                                <td>${product.pageNumber}</td>
                            </tr>
                            <tr>
                                <td>Kích thước</td>
                                <td>${product.size}</td>
                            </tr>
                            <tr>
                                <td>Trọng Lượng (gr)</td>
                                <td>200</td>
                            </tr>
                            <tr>
                                <td>Hình thức</td>
                                <td>Bìa Mềm</td>
                            </tr>
                        </tbody>
                    </table>
                </div>
                <div id="chinhsachkhachsi" class="container tab-pane fade"><br>
                    <p>Trân trọng kính chào các khách hàng của Nhà sách trực tuyến Nhanvan.vn.

                        Hiện nay, do mức chiết khấu trên website Nhanvan.vn đang là rất cao, đặc
                        biệt vào các thời điểm có chương trình khuyến mãi. Do đó,
                        số lượng sản phẩm giảm KHỦNG có giới hạn nhất định, vì vậy để đảm
                        bảo quyền lợi của từng khách hàng của Nhanvan.vn, chúng tôi xin thông báo
                        chính sách về “Đơn hàng mua Số lượng” và việc xuất hóa đơn GTGT như sau:</p>
                </div>
                <div id="chinhsachthanhvien" class="container tab-pane fade"><br>
                    <h3>Chính sách thành viên</h3>
                    <p>Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque
                        laudantium, totam rem aperiam.</p>
                </div>
                <div id="danhgiasanpham" class="container tab-pane fade"><br>
                    <h3>Đánh giá sản phẩm</h3>
                    <p>Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea
                        commodo consequat.</p>
                </div>
            </div>
        </div>
    </div>
    <div class="row mt-4">
			<p>${product.content}</p>
    </div>
    <div class="row mt-4">
        <div class="col-sm-9">
            <div id="fb-root" style="width: 100%;" ></div>
            <script async defer crossorigin="anonymous" src="https://connect.facebook.net/vi_VN/sdk.js#xfbml=1&version=v17.0&appId=966799193966133&autoLogAppEvents=1" nonce="4cBcc8qs"></script>
            <div style="clear: both;">
                <div class="fb-comments" data-href="https://developers.facebook.com/docs/plugins/comments#configurator" data-width="" data-numposts="2"></div>
            </div>
        </div>
    </div>
</div>
</form>