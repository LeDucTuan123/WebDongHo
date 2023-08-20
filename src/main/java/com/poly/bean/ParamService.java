package com.poly.bean;

import java.io.File;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import jakarta.servlet.ServletContext;
import jakarta.servlet.http.HttpServletRequest;


@Service
public class ParamService {
	@Autowired
	HttpServletRequest request;
	@Autowired
	ServletContext app;
	
	public String getString(String name, String defaultValue) {
		if(name != null) {
			return name.length() == 0 ? defaultValue : name;
		}
		return defaultValue;
			
	}
	
	public int getInt(String name, int defaultValue) {
		if(name != null) {
			return name.length() == 0 ? defaultValue : Integer.parseInt(name);
		}
		return defaultValue;
	}
	
	public double getDouble(String name, double defaultValue) {
		if(name != null) {
			return name.length() == 0 ? defaultValue : Double.parseDouble(name);
		}
		return defaultValue;
		
	}
	
	public Boolean getBoolean(String name, boolean defaultValue) {
		if(name != null) {
			return Boolean.parseBoolean(name);
		}
		return defaultValue;
	}
	
	public Date GetDate(String name, String pattern) {
		SimpleDateFormat format = new SimpleDateFormat();
		try {
			format.applyPattern(pattern);
			if(name != null && name.length() > 0) {
				Date date = format.parse(name);
				return date;
			}
			return null;
		} catch (Exception e) {
			throw new RuntimeException();
		}
	}
	
	public File save(MultipartFile file, String path) {
		File folder = new File(app.getRealPath(path));
		if(!folder.exists()) {
			folder.mkdirs();
		}
		try {
			File savefile = new File(folder, file.getOriginalFilename());
			file.transferTo(savefile);
			return savefile;
		} catch (Exception e) {
			throw new RuntimeException();
		}
	}
}
