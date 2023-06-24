package com.NhanVanStore_ASM.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.NhanVanStore_ASM.entity.DetailInvoice;
import com.NhanVanStore_ASM.entity.Invoice;

public interface DetailInvoiceDao extends JpaRepository<DetailInvoice, String>{
	
	@Query("Select d from DetailInvoice d where d.invoice.invoiceCode like ?1")
	List<DetailInvoice> findByCodeInvoiceLike(String invoiceCode);
	@Query("SELECT d FROM DetailInvoice d WHERE d.invoice.invoiceCode=?1")
	List<DetailInvoice> findByInvoiceCode(String invoice);
}
