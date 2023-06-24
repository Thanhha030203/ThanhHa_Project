package com.NhanVanStore_ASM.controller;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.NhanVanStore_ASM.Service.SessionService;
import com.NhanVanStore_ASM.dao.BookDao;
import com.NhanVanStore_ASM.dao.CartDao;
import com.NhanVanStore_ASM.entity.Book;
import com.NhanVanStore_ASM.entity.Cart;
import com.NhanVanStore_ASM.entity.Users;

@Controller
public class ProductController {
		@Autowired
		BookDao bookdao;
		
		@Autowired
		CartDao cartdao;
		@Autowired
		SessionService session;
	@RequestMapping("/product/detail")
	public String productDetail(@RequestParam("id") String bookCode, Model model) {
		Book book = new Book();
		book = bookdao.getById(bookCode);
		model.addAttribute("product",book);
		session.set("book", book);
		System.out.println("In image"+ book.getBookImage());
	return "forward:/home/product";
	}
	
	@RequestMapping("/product/addcart")
	public String productAddCart( @RequestParam("quanlityBuy") Integer quanlityBuy,Model model) {
	
		Cart cart = new Cart();
		cart.setQuantityCart(quanlityBuy);
		cart.setUserId(session.get("userAction"));
		cart.setBookId(session.get("book"));
		List<Cart> cartlist = cartdao.findAll();
		model.addAttribute("product",session.get("book"));
		for (Cart cart2 : cartlist) {
			if((cart2.getUserId().getPhoneNumber().equalsIgnoreCase(cart.getUserId().getPhoneNumber()))
					&&(cart2.getBookId().getBookCode().equalsIgnoreCase(cart.getBookId().getBookCode()))){ 
						cart2.setQuantityCart(cart.getQuantityCart()+ cart2.getQuantityCart());
						cartdao.save(cart2);
						return "forward:/home/product";
					}
		}
	
		cartdao.save(cart);
	
		return "forward:/home/product";
	
	}
}
