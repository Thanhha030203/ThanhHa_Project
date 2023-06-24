package com.NhanVanStore_ASM.entity;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.Email;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Null;

import org.springframework.format.annotation.DateTimeFormat;

import com.fasterxml.jackson.annotation.JsonIgnore;
import lombok.Data;

@SuppressWarnings("serial")
@Data
@Entity
@Table(name = "Users")
public class Users implements Serializable{
	@Id
	@Column(name = "phonenumber")
	@NotBlank
	String phoneNumber;
	@NotBlank
	@Column(name = "password")
	String password;
	@NotBlank(message="*Vui lòng nhập họ tên !")
	@Column(name = "fullname")
	String fullName;
	@NotBlank
	String address;
	@Email(message="*Chưa đúng định dạng email !")
	@NotBlank(message="*Vui lòng nhập email !")
	String email;
	@NotNull
	boolean gender;

	@Temporal(TemporalType.DATE)
	@Column(name = "birth") 
	Date birth = new Date();
	@Column(name = "userimage")

	String userImage;

	boolean role=false;
	

	@OneToMany(mappedBy = "users")
	List<Invoice> invoice;

	@OneToMany(mappedBy = "userId")
	List<Cart> carts;
}
