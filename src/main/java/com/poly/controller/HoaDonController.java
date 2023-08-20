package com.poly.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.poly.DAO.OrderDAO;
import com.poly.DAO.OrderDetailDAO;
import com.poly.bean.SessionService;
import com.poly.model.Account;
import com.poly.model.Order;
import com.poly.model.OrderDetail;

@Controller
public class HoaDonController {
	
	@Autowired
	SessionService sessionse;
	@Autowired
	OrderDetailDAO ddao;
	@Autowired
	OrderDAO odao;
	
	@RequestMapping("/hoadon")
	public String hoadon(Model model) {
		
		Account acc = sessionse.get("user");
		
		List<Order> list = odao.findByUsername(acc.getUsername());
		model.addAttribute("items", list);
		
		
		if(acc == null) {
			model.addAttribute("sign", "Đăng nhập");
			model.addAttribute("link", "in");
			model.addAttribute("count", 0);
		}else {
			model.addAttribute("sign", "Đăng xuất"); 
			model.addAttribute("link", "out");
			int count = 0;
			for(OrderDetail od : ddao.findAllByUsernameA(acc.getUsername())) {
				count++;
			}
			model.addAttribute("count", count);
		}
		return "hoadon";
	}
	
	@RequestMapping("/hoadon/delete/{id}")
	public String delete(Model model, @PathVariable("id") Long id) {
		Order o = odao.getOne(id);
		if(!o.getStatus()) {
			odao.delete(o);
			return "redirect:/hoadon";
		}
		return "redirect:/hoadonchitiet/" + id;
		
	}
	
	@RequestMapping("/hoadonchitiet/{id}")
	public String  hoadonchitiet(Model model, @PathVariable("id") Long id) {
		model.addAttribute("id", id);
		Order order = odao.getOne(id);
		model.addAttribute("status", order.getStatus());
		List<OrderDetail> list = ddao.findByOrderId(id);
		model.addAttribute("items", list);
		double oldSum = 0;
		double newSum = 0;
		for(OrderDetail o : list) {
			oldSum+=o.getProduct().getPrice() * o.getQuantity();
			newSum+=o.getPrice() * o.getQuantity();
		}
		model.addAttribute("oldSum", oldSum);
		model.addAttribute("newSum", newSum);
		model.addAttribute("discount", oldSum - newSum);
		
		return "hoadonchitiet";
	}
}
