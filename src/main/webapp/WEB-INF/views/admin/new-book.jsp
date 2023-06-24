<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<div class="card card-book">
	<div class="card-header">
		<h4>Chi tiết sản phẩm</h4>
	</div>
	<div class="card-body">
		<form:form action="book-crud" modelAttribute="itemBook">
			<div class="row">
				<div class="mb-3 col-6">
					<label for="exampleFormControlInput1" class="form-label">ID</label>
					<form:input path="bookCode" type="text" class="form-control book-id"
						id="exampleFormControlInput1" />
				</div>
				<div class="mb-3 col-6">
					<label for="exampleFormControlInput1" class="form-label">Tên sách</label>
					<form:input path="bookTitle" type="text" class="form-control book-name"
						id="exampleFormControlInput1" />
				</div>
				<div class="mb-3 col-6">
					<label for="exampleFormControlInput1" class="form-label">Nhà xuất bản</label>
					<form:input path="publishingCompany" type="text" class="form-control book-nxb"
						id="exampleFormControlInput1" />
				</div>
				<div class="mb-3 col-6">
					<label for="exampleFormControlInput1" class="form-label">Năm sản xuất</label>
					<form:input path="publishedYear" type="text" class="form-control book-nsx"
						id="exampleFormControlInput1" />
				</div>
				<div class="mb-3 col-6">
					<label for="exampleFormControlInput1" class="form-label">Giá</label>
					<form:input path="price" type="text" class="form-control book-price"
						id="exampleFormControlInput1" />
				</div>
				<div class="mb-3 col-6">
					<label for="exampleFormControlInput1" class="form-label">Số lượng</label>
					<form:input path="quantity" type="text" class="form-control book-quantity"
						id="exampleFormControlInput1" />
				</div>
				<div class="mb-3 col-6">
					<label for="exampleFormControlInput1" class="form-label">Kích thước</label>
					<form:input path="size" type="text" class="form-control book-size" id="exampleFormControlInput1" />
				</div>
				<div class="mb-3 col-6">
					<label for="exampleFormControlInput1" class="form-label">Số trang</label>
					<form:input path="pageNumber" type="text" class="form-control book-pageNumber"
						id="exampleFormControlInput1" />
				</div>
				<div class="mb-3 col-6">
					<label for="exampleFormControlInput1" class="form-label">Tác giả</label>
					<form:input path="author" type="text" class="form-control book-author"
						id="exampleFormControlInput1" />
				</div>
				<div class="mb-3 col-6">
					<label for="exampleFormControlInput1" class="form-label">Thể loại</label>
					<form:input path="booktype.bookTypeCode" type="text" class="form-control book-type"
						id="exampleFormControlInput1" />
				</div>
				<div class="mb-3 col-6">
					<label for="exampleFormControlInput1" class="form-label">Phân loại sách</label>
					<form:input path="bookClassification" type="text" class="form-control book-classification"
						id="exampleFormControlInput1" />
				</div>
				<div class="mb-3 col-6">
					<label for="exampleFormControlInput1" class="form-label">Nhà cung cấp</label>
					<form:input path="supplier.supplierCode" type="text" class="form-control book-supplier"
						id="exampleFormControlInput1" />
				</div>
				<div class="mb-3 col-6">
					<label for="exampleFormControlInput1" class="form-label">Ảnh</label>
					<form:input path="bookImage" type="file" class="form-control book-image"
						id="exampleFormControlInput1" />
				</div>
				<div class="mb-3 col-12">
					<label for="exampleFormControlInput1" class="form-label">Nội dung</label>
					<form:textarea path="content" cols="30" rows="3" class="form-control book-content"
						id="exampleFormControlInput1" />
				</div>
			</div>
			<div class="card-footer">
				<button class="add-account" formaction="/book/create"><i class="bi bi-person-fill-add"></i> Tạo
					mới</button>
				<button class="update-account" formaction="/book/update"><i class="bi bi-box-arrow-in-down"></i> Cập
					nhật</button>
				<button class="delete-account" formaction="/book/delete/"><i class="bi bi-trash"></i> Xóa</button>
				<!-- <button class="reset-account"><i class="bi bi-arrow-counterclockwise"></i> Đặt lại</button> -->
			</div>
		</form:form>
	</div>
</div>