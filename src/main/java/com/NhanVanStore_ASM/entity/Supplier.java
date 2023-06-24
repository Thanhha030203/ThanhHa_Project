package com.NhanVanStore_ASM.entity;

import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonIgnore;

import lombok.Data;

@SuppressWarnings("serial")
@Data
@Entity 
@Table(name = "Supplier")
public class Supplier {
	@Id
	@Column(name = "suppliercode")
	String supplierCode;
	@Column(name = "suppliername")
	String supplierName;
	@Column(name = "supplieraddress")
	String supplierAddress;
	@Column(name = "supplierphone")
	String supplierPhone;
	@Column(name = "supplieremail")
	String supplierEmail;
	@JsonIgnore
	@OneToMany(mappedBy = "supplier")
	List<Book> book;
}
