<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Document</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-iYQeCzEYFbKjA/T2uDLTpkwGzCiq6soy8tYaI1GyVh/UjpbCx/TYkiZhlZB6+fzT"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.15.4/css/all.css"
	integrity="sha384-DyZ88mC6Up2uqS4h/KRgHuoeGwBcD4Ng9SiP4dIRy0EXTlnuz47vAwmeGwVChigm"
	crossorigin="anonymous" />
<script
	src="https://ajax.googleapis.com/ajax/libs/angularjs/1.6.9/angular.min.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/angularjs/1.6.9/angular-route.js"></script>
<link rel="stylesheet" href="../../css/index.css">

<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.3/font/bootstrap-icons.css">
</head>
<body>
	<div class="container">
		<div class="row">
			<div class="col-sm-4" style="margin-top: 200px;">
				<a href="index"> <img src="../../image/nhanvanstore.jpg"
					width="100%" alt=""></a>
			</div>
			<div class="col-sm-8">
				<form:form modelAttribute="userCreate" method="post"
					enctype="multipart/form-data">
					<div class="card card-account">
						<div class="card-header">
							<h4>ĐĂNG KÝ TÀI KHOẢN</h4>
						</div>
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
								<form:password path="password"
										class="form-control account-address" placeholder="password"/>
								</div>
							</div>
						</div>
						<div class="card-footer">

							<button class="reset-account" formaction="/home/login" formmethod="post">
								<i class="bi bi-arrow-counterclockwise"></i> Trở về
							</button>
							<button class="add-account" formaction="/home/saveAccount" formmethod="post">
								<i class="bi bi-person-fill-add"></i>Đăng ký
							</button>
						</div>
					</div>
				</form:form>

			</div>
		</div>
	</div>
</body>
</html>