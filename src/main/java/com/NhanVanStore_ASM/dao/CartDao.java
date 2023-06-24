package com.NhanVanStore_ASM.dao;


import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.NhanVanStore_ASM.entity.Cart;

public interface CartDao extends JpaRepository<Cart, Long> {
		
	@Query("Select c from Cart c where c.userId.phoneNumber like ?1")
	List<Cart> findByUser(String userid);
	
	@Query("Select c from Cart c where c.bookId.bookCode like ?1")
	List<Cart> findByBook(String bookid);
	@Query("Select c from Cart c where c.userId.phoneNumber like ?1 and  c.bookId.bookCode like ?2")
	Optional<Cart> findByUserAndBook(String user, String book);
	@Query("Select c from Cart c where c.cartId = ?1")
	Cart findByUserAndBook1(Long long1);
	
	@Query("  Select  sum(c.quantityCart* c.bookId.price) from Cart c where c.userId.phoneNumber= ?1")
	Optional<Long> totalPrice(String id);
}
