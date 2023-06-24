<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>  
	<div class="container">
		<div class="row">
			<div class="col-sm-3" style="margin-top: 250px;">
				<a href="index.html"> <img src=""
					width="100%" style="border: 1px soild black; height: 200px; margin-left: 20px" alt=""></a>
			</div>
			<div class="col-sm-9">
				<form:form modelAttribute="userInfor" method="post"
					enctype="multipart/form-data">
					<div class="card card-account">
						<div class="card-header bg-white"></div>
						<div class="card-body">
							<div class="row">
								<div class="mb-3 col-6">
									<label for="exampleFormControlInput1" class="form-label">Số
										điện thoại</label>
									<form:input path="phoneNumber"
										class="form-control account-phone" placeholder="0123456789" />

								</div>
								<div class="mb-3 col-6">
									<label for="exampleFormControlInput1" class="form-label">Họ
										tên</label>
									<form:input path="fullName"
										class="form-control account-name"/>
								</div>
								<div class="mb-3 col-6">
									<label class="form-label">Giới tính</label>
									<div class="form-control account-gender">
											<form:radiobuttons path="gender" items="${genders}" delimiter=" " /> <br>
									</div>
								</div>
								<div class="mb-3 col-6">
									<label for="exampleFormControlInput1" class="form-label">Ngày
										sinh</label>
										<form:input path="birth" class="form-control account-date"  placeholder="01/01/1999" /> 
								</div>
								<div class="mb-3 col-6">
									<label for="exampleFormControlInput1" class="form-label">Email
										address</label> 
											<form:input path="email"
										class="form-control account-email" placeholder="name@example.com"/>
										
								</div>
								<div class="mb-3 col-6">
									<label for="exampleFormControlInput1" class="form-label">Địa
										chỉ</label> 
											<form:input path="address"
										class="form-control account-address"/>
										
								</div>
								<div class="mb-3 col-6">
									<label for="exampleFormControlInput1" class="form-label">Ảnh</label>
										<input type="file" name="image" class="form-control"> <br>
								
								</div>
								<div class="mb-3 col-6">
									<label for="exampleFormControlInput1" class="form-label">Password</label>
								<form:input path="password" 
									disabled="disabled"	class="form-control account-address" placeholder="password"/>
								</div>
							</div>
						</div>
						<div class="card-footer" >
<div class="card-footer">
				
				<button class="update-account" formaction="/action/updateUser"><i class="bi bi-box-arrow-in-down"></i> Cập
					nhật</button>
			
				<!-- <button class="reset-account"><i class="bi bi-arrow-counterclockwise"></i> Đặt lại</button> -->
			</div>
							
						</div>
					</div>
				</form:form>

			</div>
		</div>
	</div>
