package com.poly.controller;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.util.Arrays;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.poly.DAO.AccountDAO;
import com.poly.DAO.CategoryDAO;
import com.poly.DAO.OrderDAO;
import com.poly.DAO.OrderDetailDAO;
import com.poly.DAO.ProductDAO;
import com.poly.bean.SessionService;
import com.poly.model.Account;
import com.poly.model.Category;
import com.poly.model.Order;
import com.poly.model.OrderDetail;
import com.poly.model.Product;

import jakarta.mail.Session;
import jakarta.servlet.ServletContext;


@Controller
public class AdminOrderController {
	
	
	@Autowired
	OrderDAO oDao;	
	
	@Autowired
	ServletContext app;
	
	@Autowired
	SessionService session;
	
	@Autowired
	OrderDetailDAO ddao;
	


	// don hang---------------------------
	@RequestMapping("/admin/order/order")
	public String OrderList(Model model, @ModelAttribute("otherItem") Order o) {		
		model.addAttribute("OrderItems", oDao.findAll());
		return "Admin/order/order";
	}
	
	
	@PostMapping("/admin/order/update")
	public String OrderUpdate(@RequestParam(value = "isStatus", required= false) String status, @RequestParam("id") Long id) {
		Boolean status1 = false;
		if(status == null) {
			status1 = false;
		}else {
			status1 = Boolean.valueOf(status);
		}
		Order o = oDao.findById(id).get();
		o.setStatus(status1);
		oDao.save(o);
		return "redirect:/admin/order/order";
	}
	
	
	
	

}
