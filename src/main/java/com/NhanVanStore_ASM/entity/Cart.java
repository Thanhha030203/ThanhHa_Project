package com.NhanVanStore_ASM.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import lombok.Data;
import lombok.ToString;

@Entity
@Data
@ToString
@Table(name = "Cart")
public class Cart {

		@Id
		@GeneratedValue(strategy = GenerationType.IDENTITY)
		@Column(name = "cartid")
		Long cartId;
		
		@ManyToOne
		@JoinColumn(name = "userid")
		Users userId;
		@ManyToOne
		@JoinColumn(name = "bookid")
		Book bookId;
		@Column(name = "quantitycart")
		int quantityCart;
		
		
		
}
