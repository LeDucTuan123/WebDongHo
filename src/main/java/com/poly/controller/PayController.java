package com.poly.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.poly.DAO.AccountDAO;
import com.poly.DAO.OrderDAO;
import com.poly.DAO.OrderDetailDAO;
import com.poly.bean.MailerServiceImpl;
import com.poly.bean.SessionService;
import com.poly.model.Account;
import com.poly.model.Order;
import com.poly.model.OrderDetail;

import jakarta.mail.MessagingException;

@Controller
public class PayController {

	@Autowired
	SessionService sessionse;
	@Autowired
	OrderDetailDAO ddao;
	@Autowired
	AccountDAO adao;
	@Autowired
	OrderDAO odao;
	@Autowired
	MailerServiceImpl mail;

	@RequestMapping("/pay")
	public String form(Model model) {

		Account acc = sessionse.get("user");
		double oldSum = 0;
		double newSum = 0;
		if (acc != null) {
			List<OrderDetail> listOrder = ddao.findAllByUsernameA(acc.getUsername());
			model.addAttribute("items", listOrder);

			for (OrderDetail od : listOrder) {
				oldSum += od.getProduct().getPrice() * od.getQuantity();
				newSum += od.getPrice() * od.getQuantity();

			}
			double discount;
			model.addAttribute("oldSum", oldSum);
			model.addAttribute("newSum", newSum);
			model.addAttribute("discount", oldSum - newSum);

		}

		model.addAttribute("user", acc);
		if (acc == null) {
			model.addAttribute("sign", "Đăng nhập");
			model.addAttribute("link", "in");
			model.addAttribute("count", 0);
		} else {
			model.addAttribute("sign", "Đăng xuất");
			model.addAttribute("link", "out");
			int count = 0;
			for (OrderDetail od : ddao.findAllByUsernameA(acc.getUsername())) {
				count++;
			}
			model.addAttribute("count", count);
		}

		return "pay";
	}

	@RequestMapping("/success")
	public String success(Model model, @RequestParam("fullname") String fullname, @RequestParam("email") String email, @RequestParam("phone") String phone, @RequestParam("address") String address) {
		Account acc = sessionse.get("user");
		
		Order order = odao.findByAddressU(acc.getUsername());
		List<OrderDetail> listOrder = ddao.findAllByUsernameA(acc.getUsername());
		double sum = 0;
		for (OrderDetail od : listOrder) {
			sum += od.getPrice() * od.getQuantity();

		}
		order.setFullname(fullname);
		order.setEmail(email);
		order.setAddress(address);
		order.setPhone(phone);
		order.setStatus(false);
		order.setPrice(sum);
		odao.save(order);
		
		if (acc == null) {
			model.addAttribute("sign", "Đăng nhập");
			model.addAttribute("link", "in");
			model.addAttribute("count", 0);
		} else {
			model.addAttribute("sign", "Đăng xuất");
			model.addAttribute("link", "out");
			int count = 0;
			for (OrderDetail od : ddao.findAllByUsernameA(acc.getUsername())) {
				count++;
			}
			model.addAttribute("count", count);
		}
		try {
			mail.send(acc.getEmail(), "Xác nhận thanh toán", "<body>\r\n"
					+ "    <p>Cảm ơn bạn đã mua hàng trên website Delta watch. Để kiểm tra hóa đơn bạn có thể bấm vào đường linh ở dưới</p>\r\n"
					+ "    <div style=\"display: flex;\">\r\n"
					+ "        <a style=\"display: inline-block; padding: 10px; background-color: aqua; text-decoration: none; color: #fff; text-align: center; margin: auto;\" href=\"http://localhost:8080/hoadon\">Kiểm tra hóa đơn</a>\r\n"
					+ "    </div>\r\n"
					+ "    <hr>\r\n"
					+ "    <p><span style=\"font-weight: 700; font-size: larger;\">Mã hóa đơn: </span> <span style=\"font-size: larger; margin-left: 50px; color: red;\"> "+ order.getId() +" </span></p>\r\n"
					+ "    <p><span style=\"font-weight: 700; font-size: larger;\">Họ và tên: </span> <span style=\"font-size: larger; margin-left: 50px; color: red;\">"+ order.getFullname()  +"</span></p>\r\n"
					+ "    <p><span style=\"font-weight: 700; font-size: larger;\">Số điện thoại: </span> <span style=\"font-size: larger; margin-left: 50px; color: red;\">" + order.getPhone()+"</span></p>\r\n"
					+ "    <p><span style=\"font-weight: 700; font-size: larger;\">Tổng tiền: </span> <span style=\"font-size: larger; margin-left: 50px; color: red;\">" +order.getPrice()  +"đ</span></p>\r\n"
					+ "    <p><span style=\"font-weight: 700; font-size: larger;\">Địa chỉ: </span> <span style=\"font-size: larger; margin-left: 50px; color: red;\">" +order.getAddress() + "</span></p>\r\n"
					+ "</body>");
		} catch (MessagingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "thanhcong";
	}
}
