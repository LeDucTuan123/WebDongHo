package com.poly.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.poly.DAO.OrderDAO;
import com.poly.DAO.OrderDetailDAO;
import com.poly.DAO.ProductDAO;
import com.poly.bean.SessionService;
import com.poly.model.Account;
import com.poly.model.Order;
import com.poly.model.OrderDetail;
import com.poly.model.Product;

@Controller
public class DetailsController {
	
	@Autowired
	ProductDAO pdao;
	@Autowired
	SessionService sessionse;
	@Autowired
	OrderDetailDAO ddao;
	@Autowired
	OrderDAO odao;
	
	@RequestMapping("/details/{id}")
	public String details(@PathVariable("id") Integer id, Model model) {
		Product p = pdao.getOne(id);
		Pageable page = PageRequest.of(0, 6);
		model.addAttribute("products", pdao.findByCategoryId(p.getCategory().getId(), page));
		model.addAttribute("product", p);
		Account acc = sessionse.get("user");
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
		return "details";
	}
}
