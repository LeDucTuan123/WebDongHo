package com.poly.bean;



import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.poly.DAO.AccountDAO;
import com.poly.model.Account;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;


@Service
public class AuthInterceptor implements HandlerInterceptor {
	@Autowired
	SessionService sessionse;
	@Autowired
	AccountDAO adao;
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object object) throws Exception {
		String uri = request.getRequestURI();
		Account acc = sessionse.get("user");
		String error="";
		if(acc == null) {
			response.sendRedirect("/form/in");
			return false;
		}else if(!acc.getAdmin()&& uri.startsWith("/admin/")) {
			error = "loi tumlum!";
			response.sendRedirect("/form/in?error="+error);
			return false;
		}
		return true;
		
		
	}
}
