package com.NhanVanStore_ASM.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.NhanVanStore_ASM.dao.BookDao;
import com.NhanVanStore_ASM.dao.DetailInvoiceDao;
import com.NhanVanStore_ASM.dao.InvoiceDao;
import com.NhanVanStore_ASM.dao.UsersDao;
import com.NhanVanStore_ASM.entity.Book;
import com.NhanVanStore_ASM.entity.DetailInvoice;
import com.NhanVanStore_ASM.entity.Invoice;
import com.NhanVanStore_ASM.entity.Users;
import com.NhanVanStore_ASM.Service.SessionService;

@Controller
public class AdminController {
	
	@Autowired
	UsersDao dao;
	
	@Autowired
	BookDao dao1;
	
	@Autowired
	InvoiceDao dao2;
	
	@Autowired
	DetailInvoiceDao dao3;
	
	@Autowired
	HttpServletRequest req;
	
	@Autowired
	SessionService session;
	
	@RequestMapping("/home")
	public String beginPage() { 
		return "admin/admin";
	}
	
	@RequestMapping({"/home/admin","/home/list-account","/home/list-book","/home/list-invoice","/home/revenue","/home/change-password"})
	public String homeAdmin(Model model,@RequestParam("keywords") Optional<String> kw, @RequestParam("p") Optional<Integer> p, @RequestParam("passwordpersent") Optional<String> pass) {
		String url = req.getRequestURI();
//		AdminStatisticController as = new AdminStatisticController();
		System.out.println("url: "+ url);
		if(url.contains("admin")) {
			req.setAttribute("views", "");
		}
		else if(url.contains("list-account")) { 
			req.setAttribute("views", "list-account.jsp");
			pageUser(model, kw, p);
		}
		else if(url.contains("list-book")) { 
			req.setAttribute("views", "list-book.jsp");
			pageBook(model, kw, p);
		}
		else if(url.contains("list-invoice")) { 
			req.setAttribute("views", "list-invoice.jsp");
			pageInvoice(model, kw, p);
		}
		else if(url.contains("revenue")) { 
			req.setAttribute("views", "revenue.jsp");
		}
		else if(url.contains("change-password")) { 
			Users usertest = session.get("userAction");
			if(pass.get().equals(usertest.getPassword())) {
				req.setAttribute("views","adminChangePassword.jsp");
			}
		}
		return "forward:/home";
	}

	
	
	@RequestMapping("/admin/change-password")
	public String actionChangePassword(@RequestParam("password") String passwordNew,Model  model) { 
		//deleteAccount
		Users userupdate = session.get("userAction");
		userupdate.setPassword(passwordNew);
		req.setAttribute("views","adminChangePassword.jsp");
		model.addAttribute("userInfor", userupdate);
		dao.save(userupdate);
		return "forward:/home/.login";
	}
	
// list-account // new-account
	public void pageUser(Model model,Optional<String> kw, Optional<Integer> p) {
		String keywords = kw.orElse(session.get("keywords", ""));
		session.set("keywords", keywords);
		model.addAttribute("pageUser", dao.findByKeywords("%"+keywords+"%", PageRequest.of(p.orElse(0), 6)));
	}
	
	@RequestMapping("/home/new-account")
	public String newAccount(@ModelAttribute("item") Users item) { 
		req.setAttribute("views", "new-account.jsp");
		return "forward:/home";
	}
	
	@ModelAttribute("genders")
	public Map<Boolean, String> getGender(){ 
		Map<Boolean,String> map = new HashMap<>();
		map.put(true,"Male");
		map.put(false, "Female");
		return map;
	}
	
	@ModelAttribute("roles")
	public Map<Boolean, String> getRole(){ 
		Map<Boolean,String> map = new HashMap<>();
		map.put(true,"Admin");
		map.put(false, "User");
		return map;
	}
	
	@PostMapping("user-crud")
	public String userCRUD(Model model) {
		Users item = new Users();
		model.addAttribute("item", item);
		return "redirect:/home/new-account";
	}

	@RequestMapping("/account/edit/{phoneNumber}")
	public String editUsers(@PathVariable("phoneNumber") String phoneNumber, Model model) {
		Users item = dao.getById(phoneNumber);
		model.addAttribute("item", item);
		req.setAttribute("views", "new-account.jsp");
		return "forward:/home";

	}
	
	@RequestMapping("/users/create")
	public String createUser(@Validated @ModelAttribute("item") Users item, Model model) {
		Optional<Users> usertest = dao.findById(item.getPhoneNumber());
		if(usertest.isEmpty()) { 
			dao.save(item);
			model.addAttribute("newaccountpass", "Tạo mới thành công");
			System.out.println("Tạo mới thành công");
		}
		else { 
			model.addAttribute("newaccountfail", "Tài khoản này đã tồn tại");
			System.out.println("Tài khoản này đã tồn tại");
		}
	
		return "redirect:/home/new-account";
	}

	@RequestMapping("/users/update")
	public String updateUser(Users item) {
		dao.save(item);
		return "redirect:/home/new-account";
	}

	@RequestMapping("/users/delete")
	public String deleteUser(@ModelAttribute("item") Users phoneNumber) {
		dao.delete(phoneNumber);
		return "redirect:/home/new-account";
	}
	
// list-book // new-book
	public void pageBook(Model model,Optional<String> kw, Optional<Integer> p) {
		String keywords = kw.orElse(session.get("keywords", ""));
		session.set("keywords", keywords);
		model.addAttribute("pageBook", dao1.findByKeywords("%"+keywords+"%", PageRequest.of(p.orElse(0), 6)));
	}
	
	@RequestMapping("/home/new-book")
	public String newBook(@ModelAttribute("itemBook") Book itemBook) { 
		req.setAttribute("views", "new-book.jsp");
		return "forward:/home";
	}

	@RequestMapping("book-crud")
	public String bookCRUD(Model model) {
		Book itemBook = new Book();
		model.addAttribute("itemBook", itemBook);
		return "redirect:/home/new-book";
	}
	
	@RequestMapping("/book/edit/{bookCode}")
	public String editBook(@PathVariable("bookCode") String bookCode, Model model) {
		Book itemBook = dao1.getById(bookCode);
		model.addAttribute("itemBook", itemBook);
		req.setAttribute("views", "new-book.jsp");
		return "forward:/home";
	}
	
	@RequestMapping("/book/create")
	public String createBook(@Validated @ModelAttribute("itemBook") Book itemBook, Model model) {
		Optional<Book> booktest = dao1.findById(itemBook.getBookCode());
		if(booktest.isEmpty()) { 
			dao1.save(itemBook);
			model.addAttribute("newaccountpass", "Tạo mới thành công");
			System.out.println("Tạo mới thành công");
		}
		else { 
			model.addAttribute("newaccountfail", "Tài khoản này đã tồn tại");
			System.out.println("Tài khoản này đã tồn tại");
		}
		return "redirect:/home/new-book";
	}

	@RequestMapping("/book/update")
	public String updateBook(Book item) {
		dao1.save(item);
		return "redirect:/home/new-book";
	}

	@RequestMapping("/book/delete")
	public String deleteBook(@ModelAttribute("itemBook") Book bookCode) {
		System.out.println(bookCode);
		dao1.deleteById(bookCode.getBookCode());
		return "redirect:/home/new-book";
	}
	
// list invoice
	public void pageInvoice(Model model,Optional<String> kw, Optional<Integer> p) {
		String keywords = kw.orElse(session.get("keywords", ""));
		session.set("keywords", keywords);
		model.addAttribute("pageInvoice", dao2.findByByername("%"+keywords+"%", PageRequest.of(p.orElse(0), 8)));
	}
	
	
// detailInvoice

	@RequestMapping("/invoice/edit/{invoiceCode}")
	public String listDetailInvoice( Model model, @PathVariable("invoiceCode") String invoiceCode) {
		System.out.println(invoiceCode);
		if(invoiceCode=="") {
			List<DetailInvoice> itemDetailInvoice = dao3.findAll();
			model.addAttribute("itemDetailInvoice", itemDetailInvoice);
		}else {
			List<DetailInvoice> itemDetailInvoice = dao3.findByInvoiceCode(invoiceCode);	
			model.addAttribute("itemDetailInvoice", itemDetailInvoice);
			session.set("invoiceCodepersent", invoiceCode);
			
		}	
		return "forward:/home/list-invoice";
	}
	
	@RequestMapping("/delete/invoice/")
	public String deleteInvoice(Model model) {
		System.out.println("hhh");
		Invoice invoicedel = dao2.getById(session.get("invoiceCodepersent"));
		dao2.deleteById(invoicedel.getInvoiceCode());
		return "forward:/home/list-invoice";
	}
}
