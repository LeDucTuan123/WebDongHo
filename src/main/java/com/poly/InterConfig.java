package com.poly;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import com.poly.bean.AuthInterceptor;

@Configuration 
public class InterConfig implements WebMvcConfigurer {
	@Autowired
	AuthInterceptor auth;
	
	@Override
	public void addInterceptors(InterceptorRegistry registry) {
		registry.addInterceptor(auth).addPathPatterns("/cart", "/cart/**", "/pay", "/success", "/hoadon/**", "/hoadonchitiet/**", "/admin/**").excludePathPatterns("/views/css/**", "/views/image/**", "/views/js/**");
	}
}
