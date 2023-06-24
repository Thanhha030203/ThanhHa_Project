<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>

<div>
    <div class="title-account">
        <h4>Danh sách người dùng</h4>
    </div>
    <table class="table table-striped table-hover table-bordered table-account">
        <thead>
            <tr>
                <th scope="col">SĐT</th>
                <th scope="col">Họ tên</th>
                <th scope="col">Giới tính</th>
                <th scope="col">Ngày sinh</th>
                <th scope="col">Email</th>
                <th scope="col">Địa chỉ</th>
                <th scope="col">Vai trò</th>
                <th scope="col"></th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="item" items="${pageUser.content}">
				<tr>
					<td>${item.phoneNumber}</td>
					<td>${item.fullName}</td>
					<td>${item.gender}</td>
					<td>${item.birth}</td>
					<td>${item.email}</td>
					<td>${item.address}</td>
					<td>${item.role}</td>
                    <td><a href="/account/edit/${item.phoneNumber}"><i class="bi bi-pencil-square"></i></a></td>
                </tr>
			</c:forEach>
        </tbody>
    </table>
    <div class="new-account">
        <div class="dieukhien">
            <ul class="pagination">
                <li class="page-item"><a class="page-link" href="list-account?p=0"><i class="bi bi-chevron-double-left"></i></a></li>
                <li class="page-item"><a class="page-link" href="list-account?p=${pageUser.number-1}"><i class="bi bi-chevron-left"></i></a></li>
                <li class="page-item"><a class="page-link" href="list-account?p=${pageUser.number+1}"><i class="bi bi-chevron-right"></i></a></li>
                <li class="page-item"><a class="page-link" href="list-account?p=${pageUser.totalPages-1}"><i class="bi bi-chevron-double-right"></i></a></li>
            </ul>
        </div>
        <button class="btn-new-account"><a href="new-account"><i class="bi bi-person-fill-add"></i> Tạo mới</a></button>
    </div>
</div>