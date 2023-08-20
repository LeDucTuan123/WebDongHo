package com.poly.bean;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import jakarta.servlet.http.HttpSession;

@Service
public class SessionService {
	@Autowired
	HttpSession session;
	
	public <T> T get (String name) {
		Object obj = session.getAttribute(name);
		if(obj == null) {
			return null;
		}
		return (T) obj;
	}
	
	public void set(String name, Object value) {
		session.setAttribute(name, value);
	}
	
	public void remove(String name) {
		session.removeAttribute(name);
	}
}
