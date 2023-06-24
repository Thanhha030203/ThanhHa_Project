package com.NhanVanStore_ASM.entity;

import java.util.Date;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import com.fasterxml.jackson.annotation.JsonIgnore;

import lombok.Data;

@SuppressWarnings("serial")
@Data
@Entity 
@Table(name = "Invoice")
public class Invoice {
	@Id
	@Column(name = "invoicecode")
	String invoiceCode;
	@Column(name = "byername")
	String byerName;
	@Column(name = "byeraddress")
	String byerAddress;
	@Column(name = "byerphone")
	String byerPhone;
	
	@Temporal(TemporalType.DATE)
	@Column(name = "purchasedate")
	Date purchaseDate = new Date();
	@Column(name = "totalinvoice")
	Double totalInvoice;
	
	@JsonIgnore
	@OneToMany(mappedBy = "invoice")
	List<DetailInvoice> Detailinvoice;
	
	@ManyToOne
	@JoinColumn(name = "byeraccount")
	Users users;
}
