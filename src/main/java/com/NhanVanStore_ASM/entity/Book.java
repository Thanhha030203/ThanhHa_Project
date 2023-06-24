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

import lombok.Data;
import lombok.ToString;

@SuppressWarnings("serial")
@Data
@ToString
@Entity 
@Table(name = "Book")
public class Book implements Serializable{
	@Id
	@Column(name = "bookcode")
	String bookCode;
	@Column(name = "booktitle")
	String bookTitle;
	@Column(name = "publishingcompany")
	String publishingCompany;
	@Column(name = "publishedyear")
	Integer publishedYear;
	Double price;
	Integer quantity;
	String size;
	@Column(name = "pagenumber")
	Integer pageNumber;
	String author;
	String content;
	@Column(name = "bookclassification")
	String bookClassification;
	@Column(name = "bookimage")
	String bookImage;
	
	@ManyToOne
	@JoinColumn(name = "supplierid")
	Supplier supplier;
	
	@ManyToOne
	@JoinColumn(name = "booktypeID")
	BookType booktype;
	
	@OneToMany(mappedBy = "bookId")
	List<Cart> carts;
	@OneToMany(mappedBy = "detailInvoiceCode")
	List<DetailInvoice> detailInvoice;
}
