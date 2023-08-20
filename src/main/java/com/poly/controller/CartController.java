package com.poly.controller;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
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
public class CartController {

	@Autowired
	SessionService sessionse;
	@Autowired
	OrderDAO odao;
	@Autowired
	OrderDetailDAO ddao;
	@Autowired
	ProductDAO pdao;
	
	@RequestMapping("/cart")
	public String cart(Model model) {
		
		Account acc = sessionse.get("user");
		double sum = 0;
		if(acc != null) {
			List<OrderDetail> listOrder = ddao.findAllByUsernameA(acc.getUsername());
			model.addAttribute("items", listOrder);
			
			for(OrderDetail od : listOrder) {
				sum+=od.getPrice() * od.getQuantity();
			}
			
		}
		model.addAttribute("sum", sum);
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
		return "cart";
	}

	@RequestMapping("/cart/{id}")
	public String insert(Model model, @PathVariable("id") Integer id, @RequestParam(required = false, value="qty") Integer qty ) {
		
		Account acc = sessionse.get("user");
		
		List<Order> list = odao.findByUsername(acc.getUsername());
		Order order = null;
		for(Order o : list) {
			if(o.getAddress() == null) {
				System.out.println("hello");
				order = o;
			}
		}
		if(order == null) {
			order = new Order();
			order.setAccount(acc);
			order.setCreatedate(new Date());
			odao.save(order);
		}

		Product product = pdao.getOne(id);
		
		OrderDetail od = ddao.findByProductId(id, order.getId());
		if(od == null) {
			od = new OrderDetail();
			od.setOrder(order);
			od.setPrice(product.getPrice() - (product.getDiscount() * product.getPrice() / 100));
			od.setProduct(product);
			if(qty == null ) {
				od.setQuantity(1);
			}else {
				od.setQuantity(qty);
			}
		}else {
			if(qty == null ) {
				od.setQuantity(od.getQuantity() + 1);
			}else {
				od.setQuantity(od.getQuantity() + qty);
			}
			
		}
		ddao.save(od);
		
		return "redirect:/cart";
	}
	
	@PostMapping("/cart/update/{id}")
	public String cartUpdate(Model model, @RequestParam("quantity") Integer qty, @PathVariable("id") Long id) {
		OrderDetail orderDetail = ddao.getOne(id);
		orderDetail.setQuantity(qty);
		ddao.save(orderDetail);
		return "redirect:/cart";
	}
	
	@RequestMapping("/cart/delete/{id}")
	public String cartDelete(@PathVariable("id") Long id) {
		OrderDetail orderDetail = ddao.getOne(id);
		ddao.delete(orderDetail);
		return "redirect:/cart";
	}
}
