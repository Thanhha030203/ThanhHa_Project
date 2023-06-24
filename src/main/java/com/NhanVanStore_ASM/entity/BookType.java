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
@Table(name = "Booktype")
public class BookType {
	@Id
	@Column(name = "booktypecode")
	String bookTypeCode;
	@Column(name = "booktypename")
	String bookTypeName;
	
	@JsonIgnore
	@OneToMany(mappedBy = "booktype")
	List<Book> book;
}
