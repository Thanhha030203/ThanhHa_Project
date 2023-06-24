<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<div class="card card-account">
	<div class="card-header">
		<h4>Thông tin chi tiết</h4>
	</div>
	<div class="card-body">

		<form:form action="user-crud" modelAttribute="item" enctype="multipart/form-data">
			<div class="row">
				<div class="mb-4 col-6">
					<label for="exampleFormControlInput1" class="form-label">Số điện thoại</label>
					<form:input path="phoneNumber" type="text" class="form-control account-phone"
						id="exampleFormControlInput1" placeholder="0123456789" />
						<form:errors class="errors" path="phoneNumber" />
				</div>
				<div class="mb-4 col-6">
					<label for="exampleFormControlInput1" class="form-label">Password</label>
					<form:input path="password" type="password" class="form-control account-password" id="exampleFormControlInput1" />
					<form:errors class="errors" path="password" />
				</div>
				<div class="mb-4 col-6">
					<label for="exampleFormControlInput1" class="form-label">Họ tên</label>
					<form:input path="fullName" type="text" class="form-control account-name"
						id="exampleFormControlInput1" />
						<form:errors class="errors" path="fullName" />
				</div>
				<div class="mb-4 col-6">
					<label class="form-label">Giới tính</label>
					<div class="form-control account-gender">
						<form:radiobuttons path="gender" items="${genders}" delimiter=" " /> <br>
					</div>
				</div>
				<div class="mb-4 col-6">
					<label for="exampleFormControlInput1" class="form-label">Ngày sinh</label>
					<form:input path="birth" class="form-control account-date"
						id="exampleFormControlInput1"  placeholder="01/01/1999"/>
					<form:errors class="errors" path="birth" />
				</div>
				<div class="mb-4 col-6">
					<label for="exampleFormControlInput1" class="form-label">Email address</label>
					<form:input path="email" type="text" class="form-control account-email"
						id="exampleFormControlInput1" placeholder="name@example.com" />
					<form:errors class="errors" path="email" />
				</div>
				<div class="mb-4 col-6">
					<label for="exampleFormControlInput1" class="form-label">Địa chỉ</label>
					<form:input path="address" type="text" class="form-control account-address"
						id="exampleFormControlInput1" />
					<form:errors class="errors" path="address" />
				</div>
				<div class="mb-4 col-6">
					<label class="form-label">Vai trò</label>
					<div class="form-control account-role">
						<form:radiobuttons path="role" items="${roles}" delimiter=" " /> <br>
					</div>
				</div>
				<div class="mb-4 col-6">
					<label for="exampleFormControlInput1" class="form-label">Ảnh</label>
					<form:input path="userImage" type="file" class="form-control account-image"
						id="exampleFormControlInput1" name="image"/>
					<p>${message }</p>
				</div>
			</div>
			<div class="card-footer">
				<button class="add-account" formaction="/users/create"><i class="bi bi-person-fill-add"></i> Tạo mới</button>
				<button class="update-account" formaction="/users/update"><i class="bi bi-box-arrow-in-down"></i> Cập
					nhật</button>
				<button class="delete-account" formaction="/users/delete/"><i class="bi bi-trash"></i>
					Xóa</button>
				<!-- <button class="reset-account"><i class="bi bi-arrow-counterclockwise"></i> Đặt lại</button> -->
			</div>
		</form:form>
	</div>
</div>