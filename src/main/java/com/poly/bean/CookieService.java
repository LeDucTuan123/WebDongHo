package com.poly.bean;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;



@Service
public class CookieService {
	@Autowired
	HttpServletRequest request;
	@Autowired
	HttpServletResponse response;
	
	public Cookie get(String name) {
		Cookie[] cookies = request.getCookies();
		for(Cookie cookie : cookies) {
			if(cookie.getName().equals(name)) {
				return cookie;
			}
		}
		return null;
	}
	
	public String getValue(String name) {
		Cookie cookie = this.get(name);
		if(cookie != null) {
			return cookie.getValue();
		}
		return "";
	}
	
	public Cookie add(String name, String value, int hours) {
		Cookie cookie = new Cookie(name, value);
		cookie.setMaxAge(hours * 60 * 60);
		cookie.setPath("/");
		response.addCookie(cookie);
		return cookie;
	}
	
	public void remove(String name) {
		Cookie cookie = this.get(name);
		cookie.setMaxAge(0);
	}
}
