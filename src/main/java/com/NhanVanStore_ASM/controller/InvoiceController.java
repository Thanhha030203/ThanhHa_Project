package com.NhanVanStore_ASM.controller;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.NhanVanStore_ASM.Service.HelperService;
import com.NhanVanStore_ASM.Service.SessionService;
import com.NhanVanStore_ASM.dao.DetailInvoiceDao;
import com.NhanVanStore_ASM.dao.InvoiceDao;
import com.NhanVanStore_ASM.entity.DetailInvoice;

import com.NhanVanStore_ASM.entity.Users;

@Controller
public class InvoiceController {
	
	
	@Autowired 
	InvoiceDao invoicedao;
	
	@Autowired 
	DetailInvoiceDao detaildao;
	@Autowired 
	HelperService helperService;
	@Autowired 
	SessionService sessionService;
	@RequestMapping("user/invoice")
	public String invoiceList(Model model, @RequestParam("p") Optional<Integer> p) { 
		Users userinvoice = sessionService.get("userAction");
		
		model.addAttribute("userlistInvoice", invoicedao.findByByerAccountLike(userinvoice.getPhoneNumber(), PageRequest.of(p.orElse(0), 5)));
		return "forward:/user/historyPurchse";
	}
	
	@RequestMapping("/action/editInvoice/{invoiceCode}")
	public String DetailList(Model model, @PathVariable("invoiceCode") String invoiceCode) { 
//		Users userinvoice = sessionService.get("userAction");
		System.out.println("InVoice"+ invoiceCode);
		List<DetailInvoice> listDetailinvoiceUser =detaildao.findByCodeInvoiceLike(invoiceCode);
		System.out.println("ins"+listDetailinvoiceUser.size());
		model.addAttribute("listdetailinvoice", listDetailinvoiceUser);
	model.addAttribute("listdetailinvoice", listDetailinvoiceUser);

		return "forward:/user/invoice";
	}
}
