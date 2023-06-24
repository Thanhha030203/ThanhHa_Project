<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>

<div>
    <div class="title-book">
        <h4>Danh sách sản phẩm</h4>
    </div>
    <table class="table table-striped table-hover table-book table-bordered">
        <thead>
            <tr>
                <th scope="col">ID</th>
                <th scope="col">Tên sách</th>
                <th scope="col">Năm SX</th>
                <th scope="col">Giá</th>
                <th scope="col">Tác giả</th>
                <th scope="col">Ảnh</th>
                <th scope="col"></th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="item" items="${pageBook.content}">
				<tr>
					<td>${item.bookCode}</td>
					<td>${item.bookTitle}</td>
					<td>${item.publishedYear}</td>
					<td>${item.price}</td>
					<td>${item.author}</td>
					<td><img src="/image/${item.bookImage}" alt=""></td>
                    <td><a href="/book/edit/${item.bookCode}"><i class="bi bi-pencil-square"></i></a></td>
				</tr>
			</c:forEach>
        </tbody>
    </table>
    <div class="new-book">
        <div class="dieukhien">
            <ul class="pagination">
                <li class="page-item"><a class="page-link" href="list-book?p=0"><i class="bi bi-chevron-double-left"></i></a></li>
                <li class="page-item"><a class="page-link" href="list-book?p=${pageBook.number-1}"><i class="bi bi-chevron-left"></i></a></li>
                <li class="page-item"><a class="page-link" href="list-book?p=${pageBook.number+1}"><i class="bi bi-chevron-right"></i></a></li>
                <li class="page-item"><a class="page-link" href="list-book?p=${pageBook.totalPages-1}"><i class="bi bi-chevron-double-right"></i></a></li>
            </ul>
        </div>
        <button class="btn-new-book"><a href="new-book"><i class="bi bi-bag-plus-fill"></i> Tạo mới</a></button>
    </div>
</div>
