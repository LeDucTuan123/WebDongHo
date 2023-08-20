package com.poly.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class CrudController {
	@RequestMapping("/crud")
	public String crud() {
		return "crud";
	}
}
