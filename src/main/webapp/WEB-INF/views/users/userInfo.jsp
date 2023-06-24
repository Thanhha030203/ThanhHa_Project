<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<!doctype html>
<html lang="en">

<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="/css/changpassword.css">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.3/font/bootstrap-icons.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/angularjs/1.8.2/angular.min.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/angularjs/1.6.9/angular-route.js"></script>
<link rel="stylesheet" href="/css/users.css">

<title>UserInfomation</title>
</head>

<body>
	<div class="container-fluid">
		<div class="row home">
			<div class="col-2 menu-left">
				<div class="logo">
					<a href="/home/index"><img class=" ms-4 mt-2 w-25" src="/image/logo_conong.png" alt=""></a>
					<h3 style="color: black">${username}</h3>
				</div>
				<div class="menu-controller">
					<a data-bs-toggle="collapse" href="#collapseExample"
						aria-expanded="false" aria-controls="collapseExample"> <i
						class="bi bi-ui-radios-grid pe-2"></i></i> Bảo mật
					</a>
					<div class="collapse menu-controller-list" id="collapseExample">
						<ul class="list-group">
							<li class="list-group-item"><a href="/user/chang-password" data-bs-toggle="modal" data-bs-target="#myModal">Thay
									đổi mật khẩu</a></li>
							<li class="list-group-item"><a
								href="/user/update-information">Cập nhật thông tin</a></li>
								<li class="list-group-item"><a
								href="/user/user-information">Thông tin cá nhân</a></li>
						</ul>
					</div>
				</div>
				<div class="modal" id="myModal">
  <div class="modal-dialog modal-md">
		<form action="user/change-password" method="post">
			    <div class="modal-content">

      <!-- Modal Header -->
      <div class="modal-header">
        <h4 class="modal-title">Nhập mật khẩu hiện tại</h4>
        <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
      </div>

      <!-- Modal body -->
      <div class="modal-body">
        	<input type="password" name="passwordpersent" class="form-control" placeholder="Password">
      </div>

      <!-- Modal footer -->
      <div class="modal-footer">
       <button formaction="/user/change-password" class="btn btn-primary" formmethod="post">Tiếp tục</button>
      </div>

    </div>
		</form>
  </div>
</div>
				
				<div class="menu-statistic">
					<a  href="/home/cart"> <i class="bi bi-receipt pe-2"></i> Giỏ hàng
					</a>
				</div>
				<div class="menu-statistic">
					<a href="/user/invoice"> <i class="bi bi-receipt pe-2"></i> Lịch sử mua hàng
					</a>
				</div>
				<div class="menu-statistic">
					<a href="/user/logout"> <i class="bi bi-receipt pe-2"></i>Đăng xuất
					</a>
				</div>
				<div class="menu-statistic">
					<a href="/user/deleteAccountPage"> <i class="bi bi-receipt pe-2"></i>Xoá tài khoản
					</a>
				</div>
				
			</div>
			<div class="col-10 body-right">
				<nav class="navbar navbar-black bg-white body-right-nav">
					<div class="container-fluid">
						<a class="navbar-brand text-white" href="/home/index"><i
							class="bi bi-house-door-fill icon-home"></i></a>
						<form class="d-flex">
							<input class="form-control me-2 ip-search" type="search"
								placeholder="Search" aria-label="Search">
							<button class="btn btn-search" type="submit">
								<i class="bi bi-search"></i>
							</button>
						</form>
					</div>
				</nav>
				<header>
					<jsp:include page="${viewsUserInfo}" />
				</header>
				<footer class="title-footer">
					<p>© 2023 - Nhà sách Nhân Văn</p>
				</footer>
			</div>
		</div>
	</div>
   <script src="../../js/changepassword.js"></script>
	<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js "
		integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN "
		crossorigin="anonymous "></script>
	<script
		src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js "
		integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q "
		crossorigin="anonymous "></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
		crossorigin="anonymous"></script>
</body>

</html>