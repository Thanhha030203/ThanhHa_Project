package com.NhanVanStore_ASM.Service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.NhanVanStore_ASM.dao.CartDao;
import com.NhanVanStore_ASM.entity.Cart;
import com.NhanVanStore_ASM.entity.Users;


@Service
public class HelperService {
	@Autowired
	CartDao cartdao;
	@Autowired
	SessionService session;
	public void checkRole(Model model, Users user) { 
		model.addAttribute("messageforlogin", "Đăng nhập thành công");
		session.set("userAction", user);
		model.addAttribute("messageUser",user.getFullName());

		if(user.isRole()) { 
			model.addAttribute("linkforlogin","home");
		}
		else { 
			model.addAttribute("linkforlogin","account");
		}
	}
	public void listcartUser(Model model) { 
		Users userequal = session.get("userAction");
		List<Cart> listcart  = cartdao.findByUser(userequal.getPhoneNumber());
		model.addAttribute("listcartUserAction", listcart);
		Optional<Long> totalPrice = cartdao.totalPrice(userequal.getPhoneNumber());
		model.addAttribute("totalPrice", Long.valueOf(totalPrice.orElse((long) 0.0)));
	}
	public void checkAccount(Model model) { 
		if(session.get("userAction")==null) { 
			model.addAttribute("linkforlogin","login");
			model.addAttribute("linktocart","login");
			model.addAttribute("messageUser","Đăng nhập/Đăng nhập");
		}
		else { 
			Users user = session.get("userAction");
			model.addAttribute("messageUser",user.getFullName());
			model.addAttribute("linkforlogin","account");
			model.addAttribute("linktocart","cart");
			
			
			if(user.isRole()) { 
				model.addAttribute("linkforlogin","");
			}
			else { 
				model.addAttribute("linkforlogin","account");
			
				
			}
		}
	}
}
