package com.poly.controller;

import java.util.Optional;

import org.apache.commons.lang3.RandomStringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.poly.DAO.AccountDAO;
import com.poly.bean.CookieService;
import com.poly.bean.MailerServiceImpl;
import com.poly.bean.ParamService;
import com.poly.bean.SessionService;
import com.poly.model.Account;

import jakarta.mail.MessagingException;
import jakarta.validation.Valid;

@Controller
public class LoginController {

	@Autowired
	AccountDAO adao;
	@Autowired
	CookieService cookiese;
	@Autowired
	ParamService paramse;
	@Autowired
	SessionService sessionse;
	@Autowired
	MailerServiceImpl mail;

	@RequestMapping(value = "/form/in")
	public String form(@CookieValue(required = false, name = "username") String username,
			@CookieValue(required = false, name = "password") String password, Model model,
			@RequestAttribute(required = false, name = "message") String message) {
		model.addAttribute("username", username);
		model.addAttribute("pass", password);
		model.addAttribute("message", message);
		return "sign-in";
	}

	@PostMapping("/login")
	public String login(@RequestParam("username") String un, @RequestParam("password") String pw,
			@RequestParam(required = false, name = "remember") String rm, Model model) {
		String username = paramse.getString(un, "");
		String password = paramse.getString(pw, "");
		Boolean remember = paramse.getBoolean(rm, false);
		try {
			Optional<Account> acc = adao.findById(username);
			if (acc != null) {
				System.out.println(acc.get().getUsername());
				if (acc.get().getUsername().equals(username) && acc.get().getPassword().equals(password)
						&& acc.get().getActivated()) {
					sessionse.set("user", acc.get());
					if (remember) {
						cookiese.add("username", username, 24);
						cookiese.add("password", password, 24);
					}
				} else {
					model.addAttribute("message", "Chưa nhập đúng thông tin tài khoản");
					return "forward:/form/in";
				}
			}
		} catch (Exception e) {
			model.addAttribute("message", "Nhập sai tên đăng nhập");
			return "forward:/form/in";
		}

		return "forward:/";

	}

	@RequestMapping("/form/out")
	public String out() {
		sessionse.remove("user");
		return "redirect:/";
	}

	@RequestMapping("/signUp")
	public String signIn(@ModelAttribute("account") Account acc) {
		return "signUp";
	}

	@PostMapping("/SignUp")
	public String doSignUp(@Valid @ModelAttribute("account") Account acc, BindingResult result,
			@RequestParam("rePass") String rePass, Model model) {
		Optional<Account> account = adao.findById(acc.getUsername());
		if (account.isPresent()) {
			if (account.get().getActivated()) {
				model.addAttribute("isHave", true);
				return "signUp";
			}
		} else {
			model.addAttribute("isHave", false);
		}
		if (adao.findByEmail(acc.getEmail()) != null) {
			model.addAttribute("isEmail", true);
			return "signUp";
		} else {
			model.addAttribute("isEmail", false);
		}

		if (acc.getPassword().equals(rePass) && !result.hasErrors()) {
			String otp = RandomStringUtils.randomNumeric(6);
			acc.setOtp(otp);
			adao.save(acc);
			try {
				mail.send(acc.getEmail(), "Mã xác nhận Otp", "Không gửi mã xác nhận này cho bất kỳ ai: " + otp);
			} catch (MessagingException e) {
				e.printStackTrace();
			}
			return "forward:/confirm";
		} else {
			model.addAttribute("re", true);
		}

		return "signUp";

	}

	@RequestMapping("/confirm")
	public String xacnhan(@ModelAttribute("account") Account acc, Model model) {
		model.addAttribute("email1", acc.getEmail());
		return "xacnhan";
	}

	@PostMapping("/xacnhanMail")
	public String confirm(@RequestParam("otp") String otp, @RequestParam("email") String email) {
		Account acc = adao.findByEmail(email);
		if (acc.getOtp().equals(otp)) {
			acc.setOtp(null);
			acc.setActivated(true);
			adao.save(acc);
			return "redirect:/form/in";
		}
		return "xacnhan";
	}

	@RequestMapping("/getp")
	public String toGetPass() {
		return "GetPass";
	}

	@PostMapping("/GetPass")
	public String getPass(@RequestParam("email") String email, Model model) {
		Account acc = adao.findByEmail(email);
		if (acc != null) {
			try {
				mail.send(email, "Lấy lại mât khẩu cũ trên web deltaWatch", "Tên đăng nhập của bạn là: "
						+ acc.getUsername() + " <br/> Mật khẩu của bạn là: " + acc.getPassword()
						+ "<div style=\"display: flex;\">\r\n\"\r\n"
						+ "					+ \"        <a style=\"display: inline-block; padding: 10px; background-color: aqua; text-decoration: none; color: #fff; text-align: center; margin: auto;\" href=\"http://localhost:8080/form/in\">Đăng nhập</a>\r\n\"\r\n"
						+ "					\"    </div>");
				model.addAttribute("isSendEmail", true);
			} catch (MessagingException e) {
				e.printStackTrace();
			}
		} else {
			model.addAttribute("isHaveEmail", true);
		}
		return "forward:/getp";

	}
}
