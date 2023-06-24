package com.NhanVanStore_ASM.controller;


import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Optional;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.NhanVanStore_ASM.Service.HelperService;
import com.NhanVanStore_ASM.Service.SessionService;
import com.NhanVanStore_ASM.dao.BookDao;
import com.NhanVanStore_ASM.dao.CartDao;
import com.NhanVanStore_ASM.dao.DetailInvoiceDao;
import com.NhanVanStore_ASM.dao.InvoiceDao;
import com.NhanVanStore_ASM.entity.Book;
import com.NhanVanStore_ASM.entity.Cart;
import com.NhanVanStore_ASM.entity.DetailInvoice;
import com.NhanVanStore_ASM.entity.Invoice;
import com.NhanVanStore_ASM.entity.Users;

@Controller
public class CartController {
	
	@Autowired
	HelperService helperservice;
	@Autowired
	SessionService session;
	@Autowired
	BookDao bookdao;
	@Autowired
	CartDao cartdao;
	@Autowired
	InvoiceDao invoicedao;
	@Autowired
	DetailInvoiceDao detailinvoicedao;
	@Autowired
	HttpServletRequest req;
	@RequestMapping("/cart/deleteitem/{cartid}")
	public String deleteCartitem(@PathVariable("cartid") Long cartid ) { 
		cartdao.deleteById(cartid);
		System.out.println("Xoá thành công");
		return "redirect:/home/cart";
	}
	
	@RequestMapping("/cart/updateitem/{cartid}")
	public String UpdateCartitem(@PathVariable("cartid") Long cartid,@RequestParam("quantityCartitem") Integer quantityCartitem ) {
		Cart cart = cartdao.getById(cartid);
		cart.setQuantityCart(quantityCartitem);
		cartdao.save(cart);
		System.out.println("upate thành công");
		return "redirect:/home/cart";
	}
	
	@RequestMapping("/action/buy")
	public String buyUser(Model model) { 
		System.out.println("HI buýcrrt");
		Users userequal = session.get("userAction");
		System.out.println("user"+ userequal.getPassword());
		List<Cart> listcart  = cartdao.findByUser(userequal.getPhoneNumber());
		System.out.println("list.2"+ listcart.size());
model.addAttribute("listcart", listcart);
		 
		Optional<Long> totalPrice = cartdao.totalPrice(userequal.getPhoneNumber());
	model.addAttribute("totalPrice", Long.valueOf(totalPrice.orElse((long) 0.0)));
	req.setAttribute("viewhome", "deal.jsp");
	
	return "forward:/home/index1";
	}
	@RequestMapping("/user/buy/{totalPrice}")
	public String buy(@RequestParam("buyname") String buyname,@RequestParam("buyaddress") String buyaddress,
			@RequestParam("buyphone") String buyphone,@PathVariable("totalPrice") String totalPrice) throws ParseException {
		System.out.println("kljsdklfjs");
		Invoice invoice = new Invoice();
		invoice.setInvoiceCode("IV000");
		invoice.setByerName(buyname);
		invoice.setByerAddress(buyaddress);
		invoice.setByerPhone(buyphone);
		invoice.setByerName(buyname);
		System.out.println("kđfsđsdđ");
		Date date = new Date();
		DateFormat df= new SimpleDateFormat("yyyy/MM/dd");
		String dats = df.format(date);
		invoice.setPurchaseDate(df.parse(dats));
		Users users = session.get("userAction");
		invoice.setUsers(users);
		System.out.println("kđfsđsdđ"+ totalPrice);
	invoice.setTotalInvoice(Double.parseDouble(totalPrice));
	invoicedao.save(invoice);
	session.set("invoice", invoice);
	insertDetailInvoice();
		System.out.println("Lưu thành công");
		
		return "redirect:/home/cart";
	}
	
	public void insertDetailInvoice() { 
		Users userequal = session.get("userAction");
		Invoice invoice =  invoicedao.Findinvoice(userequal.getPhoneNumber());
		System.out.println("session"+ invoice.getInvoiceCode());
		List<Cart> listcart  = cartdao.findByUser(userequal.getPhoneNumber());
		System.out.println("In ra list"+ listcart.size());
		for(int i=1; i<=listcart.size();i++) { 
			DetailInvoice detail = new DetailInvoice();
			detail.setBookCode(listcart.get(i-1).getBookId());
			detail.setNumber(listcart.get(i-1).getQuantityCart());
			detail.setTotal(listcart.get(i-1).getQuantityCart()*(listcart.get(i-1).getBookId().getPrice()));
			detail.setInvoice(invoice);
			detail.setDetailInvoiceCode("DIC00"+i+"-IV"+invoice.getInvoiceCode());
			detailinvoicedao.save(detail);	
		}
		for(int i=0;i<listcart.size();i++) {
			cartdao.deleteById(listcart.get(i-1).getCartId());
		}
	}

}
