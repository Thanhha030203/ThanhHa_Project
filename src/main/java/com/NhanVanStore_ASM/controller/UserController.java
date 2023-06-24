package com.NhanVanStore_ASM.controller;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.Map;
import java.util.Optional;
import java.util.concurrent.ThreadLocalRandom;

import javax.mail.MessagingException;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.NhanVanStore_ASM.Service.HelperService;
import com.NhanVanStore_ASM.Service.MailService;
import com.NhanVanStore_ASM.Service.SessionService;
import com.NhanVanStore_ASM.dao.UsersDao;
import com.NhanVanStore_ASM.entity.MailInfo;
import com.NhanVanStore_ASM.entity.Users;

@Controller
public class UserController {
		@Autowired 
		UsersDao userdao;
		@Autowired
		SessionService session;
		@Autowired
		HttpServletRequest req;
@Autowired
HelperService helperservice;
@Autowired 
MailService mailservice;
	@PostMapping("/home/saveAccount")
	public String saveAccount(@Validated @ModelAttribute("user") Users user,@RequestParam("image") MultipartFile file, BindingResult result, Model model) { 
		Optional<Users> usertest = userdao.findById(user.getPhoneNumber());
		if(!usertest.isPresent()) { 
			userdao.save(user);
			model.addAttribute("messageforcreateAccount", "Đăng ký thành công");
			
		}
		else { 
			model.addAttribute("messageforcreateAccount", "Tài khoản này đã tồn tại");
		}
		return "redirect:/home/index";
	}
	@RequestMapping("home/account")
	public String userInfo(Model model) { 
	Users username = session.get("userAction");
		model.addAttribute("username",username.getFullName().subSequence(username.getFullName().lastIndexOf(" "), username.getFullName().length()));
		return "users/userInfo";
	}
	@RequestMapping("user/logout")
	public String userLogout(Model model) { 
		session.set("userAction", null);
		helperservice.checkAccount(model);
		return "forward:/home/index";
	}
	@RequestMapping("user/deleteAccountPage")
	public String userDelete(Model model) { 
		//deleteAccount
		Users userdelete = session.get("userAction");
		System.out.println("12"+ userdelete.getPhoneNumber());
		userdao.deleteById(userdelete.getPhoneNumber());
		session.set("userAction",null);

		return "forward:/home/index";
	}
	@RequestMapping("/action/change-password")
	public String actionChangePassword(@RequestParam("password") String passwordNew,Model  model) { 
		//deleteAccount
		Users userupdate = session.get("userAction");
		userupdate.setPassword(passwordNew);
		req.setAttribute("viewsUserInfo","userInformation.jsp");
		model.addAttribute("userInfor", userupdate);
		userdao.save(userupdate);
		return "forward:/home/account";
	}
	@RequestMapping("/action/change-password2")
	public String actionChangePassword2(@RequestParam("password") String passwordNew,Model  model) { 
		//deleteAccount
		Users userupdate = session.get("userforgotPassword");
		userupdate.setPassword(passwordNew);
		userdao.save(userupdate);
		return "forward:/home/login";
	}
	
	
	@RequestMapping("/action/forgotpassword")
	public String forgotPassword() { 
		return "users/forgotpassword";
	}
	@RequestMapping("/action/sendmail")
	public String forgotPassword(@RequestParam("phoneNumber") String phoneNumber) throws MessagingException { 
		Optional<Users> usersendmail = userdao.findById(phoneNumber);
		if(!usersendmail.isEmpty()) { 
			Users usersa = usersendmail.get();
			int number = ThreadLocalRandom.current().nextInt(100000, 999999 + 1);
			String body = "Đây là mã xác nhận tài khoản của bạn . Vui lòng không cung cấp cho bất kì ai \n Mã của bạn là : "+ number;
			MailInfo mailinfo = new MailInfo(usersa.getEmail(),"MÃ XÁC NHẬN TÀI KHOẢN", body);
			mailservice.send(mailinfo);
			session.set("defineCode", number);
			session.set("userforgotPassword", usersa);
		}
		return "users/codedefine";
	}
	@RequestMapping("/user/defineCode")
	public String defineCode(@RequestParam("defineCode") Integer defineCode) { 
		System.out.println("codedefine" + defineCode);
		System.out.println("codedefine" + session.get("defineCode"));
		int define = session.get("defineCode");
		if(defineCode == define) { 
			System.out.println("ĐÚng");
			return "users/action";	
		}
		else {
			System.out.println("sai");
		return "users/userInfo";
		}
	}
	@RequestMapping("user/{action}")
	public String userActionInInformation(@PathVariable("action") String action,Model model,@ModelAttribute("userInfor") Users user,@RequestParam("passwordpersent") Optional<String> pass) { 
		Users userAction = session.get("userAction");
		
		switch (action) {
		case "change-password":{
			System.out.println("Passaa"+ pass);
			Users usertest = session.get("userAction");
			if(pass.get().equals(usertest.getPassword())) {
				req.setAttribute("viewsUserInfo","userChangePassword.jsp");
			}
			
			break;
		}
		
		case "update-information":{
			Users userindex = userdao.getById(userAction.getPhoneNumber());
			model.addAttribute("userInfor", userindex);
			req.setAttribute("viewsUserInfo","updateuser.jsp");
			break;
		}
		case "user-information":{
			req.setAttribute("viewsUserInfo","userInformation.jsp");
			DateFormat df = new SimpleDateFormat("yyyy/MM/dd");
//			userAction.setBirth(df.format(userAction.getBirth()));
			Users userindex = userdao.getById(userAction.getPhoneNumber());
			model.addAttribute("userInfor", userindex);
			
			break;
		}
		case "historyPurchse":{
			req.setAttribute("viewsUserInfo","userHistoryPurchse.jsp");
			break;
		}
	}
		return "forward:/home/account";
		
	}
	@RequestMapping("action/updateUser")
	public String updateUser(@Validated @ModelAttribute("userInfor") Users users) { 
		System.out.println("Users"+ users.getPhoneNumber());
		userdao.save(users);
		session.set("userAction", users);
		
		return "forward:/home/account";
	}
	@ModelAttribute("genders")
	public Map<Boolean, String> getGender(){ 
		Map<Boolean,String> map = new HashMap<>();
		map.put(true,"Male");
		map.put(false, "Female");
		return map;
	}
}
	
