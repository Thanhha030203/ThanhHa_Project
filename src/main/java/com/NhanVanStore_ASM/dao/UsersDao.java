package com.NhanVanStore_ASM.dao;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.NhanVanStore_ASM.entity.Users;

public interface UsersDao extends JpaRepository<Users, String>{
	Users findByPhoneNumberAndPassword(String phone, String password);
	
	@Query("SELECT o FROM Users o WHERE o.fullName LIKE ?1")
	Page<Users> findByKeywords(String keywords, Pageable pageable1);
	
	
}
