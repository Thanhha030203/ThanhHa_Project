package com.NhanVanStore_ASM.dao;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.NhanVanStore_ASM.entity.DetailInvoice;
import com.NhanVanStore_ASM.entity.Invoice;

public interface InvoiceDao extends JpaRepository<Invoice, String>{
	@Query("Select i from Invoice i where i.users.phoneNumber like ?1")
		Page<Invoice> findByByerAccountLike(String phoneNumber,Pageable page);
	
	@Query("SELECT o FROM Invoice o WHERE o.byerName LIKE ?1")
	Page<Invoice> findByByername(String keywords, Pageable pageable3);

	@Query("select i from Invoice i where i.users.phoneNumber like ?1 and i.invoiceCode in (select max(d.invoiceCode) from Invoice d)")
	Invoice Findinvoice(String phoneNumber);
	
	
}
