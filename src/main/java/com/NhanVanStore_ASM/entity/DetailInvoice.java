package com.NhanVanStore_ASM.entity;

import java.io.Serializable;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonIgnore;

import lombok.Data;

@SuppressWarnings("serial")
@Data
@Entity 
@Table(name = "Detailinvoice")
public class DetailInvoice implements Serializable{
	@Id
	@Column(name = "detailinvoicecode")
	String detailInvoiceCode;
	
	@ManyToOne
	@JoinColumn(name = "bookcode")
	Book bookCode;
	Integer number;
	Double total;
	
	@JsonIgnore
	@OneToMany(mappedBy = "detailinvoice")
	List<Feeback> feeback;
	
	@ManyToOne
	@JoinColumn(name = "invoicecode")
	Invoice invoice;
}
