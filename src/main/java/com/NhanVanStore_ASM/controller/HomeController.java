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
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.NhanVanStore_ASM.Service.CookieService;
import com.NhanVanStore_ASM.Service.HelperService;
import com.NhanVanStore_ASM.Service.ParamService;
import com.NhanVanStore_ASM.Service.SessionService;
import com.NhanVanStore_ASM.dao.BookDao;
import com.NhanVanStore_ASM.dao.CartDao;
import com.NhanVanStore_ASM.dao.UsersDao;
import com.NhanVanStore_ASM.entity.Users;
import com.NhanVanStore_ASM.entity.Cart;

@Controller
public class HomeController {
	@Autowired
	HttpServletRequest req;
@Autowired
UsersDao userdao;
@Autowired
BookDao bookdao;
@Autowired
CookieService cookie;
@Autowired
CartDao cartdao;
@Autowired
ParamService paramService;
@Autowired
SessionService session;
@Autowired
HelperService helperservice;
	@RequestMapping("/home/index")
	public String home(Model model, @RequestParam("p") Optional<Integer> p) {
		req.setAttribute("viewhome", "content.jsp");
		helperservice.checkAccount(model);
		model.addAttribute("page0", bookdao.findByPro6(PageRequest.of(0,6)));
		model.addAttribute("page1", bookdao.findByPro6(PageRequest.of(1,6)));
		model.addAttribute("page2", bookdao.findByPro6(PageRequest.of(2,6)));
		model.addAttribute("page3", bookdao.findByPro6(PageRequest.of(1,12)));
		model.addAttribute("page4", bookdao.findByPro6(PageRequest.of(2,12)));
		return "users/index";
	}
	@RequestMapping("/home/createAccount")
	public String createAccount(@ModelAttribute("userCreate") Users user) {	
		return "users/createAccount";
	}

	@RequestMapping("/home/index1")
	public String home1(Model model) {
		helperservice.checkAccount(model);
		return "users/index";
	}

	@RequestMapping({"/home/cart","/home/content","/home/product"})
	public String homeAdmin(Model model) {
	
		String url = req.getRequestURI();
		System.out.println("url: "+ url);
		if(url.contains("cart")) {
			req.setAttribute("viewhome", "cart.jsp");
			helperservice.listcartUser(model);
		}
		else if(url.contains("content")) { 
			model.addAttribute("page0", bookdao.findByPro6(PageRequest.of(0,6)));
			model.addAttribute("page1", bookdao.findByPro6(PageRequest.of(1,6)));
			model.addAttribute("page2", bookdao.findByPro6(PageRequest.of(2,6)));
			model.addAttribute("page3", bookdao.findByPro6(PageRequest.of(1,12)));
			model.addAttribute("page4", bookdao.findByPro6(PageRequest.of(2,12)));
			req.setAttribute("viewhome", "content.jsp");
		}
		else if(url.contains("product")) { 
			req.setAttribute("viewhome", "product.jsp");
		}
		return "forward:/home/index1";
	}
	@ModelAttribute("genders")
	public Map<Boolean, String> getGender(){ 
		Map<Boolean,String> map = new HashMap<>();
		map.put(true,"Male");
		map.put(false, "Female");
		return map;
	}
	
	@RequestMapping("/home/login")
	public String login(Model model) { 
		model.addAttribute("phoneNumberlogin", cookie.getValue("phoneNumberlogin"));
		model.addAttribute("password", cookie.getValue("password"));
		return "users/login";
	}
	@PostMapping("/action/login")
	public String Actionlogin(@RequestParam("phoneNumberlogin") String phonenumber,@RequestParam("passwordlogin") String passwordlogin, Model model ) { 
		Users user = userdao.findByPhoneNumberAndPassword(phonenumber,passwordlogin);
		if(user!=null) { 
			boolean remember = paramService.getBoolean("remember", false);
			System.out.println("rem"+remember);
			if(remember) {
				cookie.add("phoneNumberlogin", phonenumber, 1);
				cookie.add("password", passwordlogin, 1);
				
			
			}
			else {
				cookie.remove("phoneNumberlogin");
				cookie.remove("password");
			}
			System.out.println("role "+ user.isRole());
			helperservice.checkRole(model, user);
			if(user.isRole()) { 
				
				return "admin/admin";
			}
			else { 
				return "forward:/home/index";
			}
			
			
		}
		else { 
			model.addAttribute("messageforlogin", "Đăng nhập thất bại! Vui lòng kiểm tra lại");
			System.out.println("thất bại");
			return "users/login";
		}
		
	}
	
	
}
