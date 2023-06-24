package com.NhanVanStore_ASM.entity;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import lombok.Data;

@SuppressWarnings("serial")
@Data
@Entity 
@Table(name = "Feeback")
public class Feeback {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "feebackid")
	Long feebackID;
	
	@ManyToOne
	@JoinColumn(name = "detailinvoicecode")
	DetailInvoice detailinvoice;
	
	@Temporal(TemporalType.DATE)
	@Column(name = "feebackdate")
	Date feebackDate = new Date();
	
	Double Star;
	String comment;
}
