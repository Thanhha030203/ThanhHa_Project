package com.NhanVanStore_ASM.dao;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.NhanVanStore_ASM.entity.Book;


public interface BookDao extends JpaRepository<Book, String>{
	
	List<Book> findByBookCode(String b);

	@Query("SELECT o FROM Book o")
	Page<Book> findByPro6(Pageable pageable);
	
	@Query("SELECT o FROM Book o WHERE o.bookTitle LIKE ?1")
	Page<Book> findByKeywords(String keywords, Pageable pageable2);
}
