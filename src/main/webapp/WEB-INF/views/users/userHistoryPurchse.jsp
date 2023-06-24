<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>

<div class="row">
    <div class="col-6 controller-invoice mt-5">
        <div class="title-invoice mt-5 ms-4">
            <h4>Hóa đơn</h4>
        </div>
        <table class="table table-striped table-hover table-bordered table-invoice ms-4">
            <thead>
                <tr>
                    <th scope="col">Mã hóa đơn</th>
                    <th scope="col">Ngày mua</th>
                    <th scope="col">Tổng tiền</th>
                    <th scope="col"></th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="listinvoice" items="${userlistInvoice.content}">
                    <tr>
                        <td>${listinvoice.invoiceCode}</td>
                        <td>${listinvoice.purchaseDate}</td>
                        <td>${listinvoice.totalInvoice}</td>
                        <td><a href="/action/editInvoice/${listinvoice.invoiceCode}"><i class="bi bi-pencil-square"></i></a>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
        <div class="new-invoice">
            <div class="control-invoice">
                <ul class="pagination">
                    <li class="page-item"><a class="page-link" href="list-invoice?p=0"><i
                                class="bi bi-chevron-double-left"></i></a></li>
                    <li class="page-item"><a class="page-link" href="list-invoice?p=${pageInvoice.number-1}"><i
                                class="bi bi-chevron-left"></i></a></li>
                    <li class="page-item"><a class="page-link" href="list-invoice?p=${pageInvoice.number+1}"><i
                                class="bi bi-chevron-right"></i></a></li>
                    <li class="page-item"><a class="page-link" href="list-invoice?p=${pageInvoice.totalPages-1}"><i
                                class="bi bi-chevron-double-right"></i></a></li>
                </ul>
            </div>
            <!-- <button class="btn-new-account"><a href="new-account"><i class="bi bi-person-fill-add"></i> Tạo mới</a></button> -->
        </div>
    </div>
    <div class="col-6 controller-detailInvoice mt-5">
        <div class="title-detailInvoice mt-5">
            <h4>Chi tiết</h4>
        </div>
        <table class="table table-striped table-hover table-bordered table-detailInvoice">
            <thead>
                <tr>
                    <th scope="col">Mã hóa đơn chi tiết</th>
                    <th scope="col">Sản phẩm</th>
                    <th scope="col">Số lượng</th>
                    <th scope="col">Tổng tiền</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="listdetailinvoice" items="${listdetailinvoice}">
                    <tr>
                        <td>${listdetailinvoice.detailInvoiceCode}</td>
                        <td>${listdetailinvoice.bookCode.bookTitle}</td>
                        <td>${listdetailinvoice.number}</td>
                        <td>${listdetailinvoice.total}</td>
                </c:forEach>
            </tbody>
        </table>
        <button class="btn-delete-invoice"><i class="bi bi-trash"></i> Xóa</button>
    </div>
</div>