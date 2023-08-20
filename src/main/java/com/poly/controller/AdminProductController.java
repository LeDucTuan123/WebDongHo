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
public class AdminProductController {
	
	@Autowired
	ProductDAO pDao;
	
	@Autowired
	CategoryDAO caDao;
	
	
	
	@Autowired
	ServletContext app;
	
	@Autowired
	SessionService session;
	


	
	// --- san pham--------------------------------
	
	@RequestMapping("/admin/product/formproduct")
	public String FormProduct(Model model, @ModelAttribute("productItem") Product sp) {
		sp.setId(null);
		sp.setName(null);
		sp.setPrice(null);
		sp.setDiscount(null);
		sp.setCategory(null);
		sp.setImage(null);
		sp.setCreatedate(null);
		model.addAttribute("productItems", pDao.findAll());
		return "Admin/product/form-product";
	}
	
	@ModelAttribute("listCategory")
	public List<Category> getFaculties(){
//		model.addAttribute("listCategorys", caDao.findAll());
		return caDao.findAll();
	}

	@PostMapping("/admin/product/create")
	public String ProductCreate(Model model,@Validated @ModelAttribute("productItem") Product sp, BindingResult result, @RequestParam("img") MultipartFile file) throws IllegalStateException, IOException{
		
		if(!file.isEmpty()) {
			
			String fileName = StringUtils.cleanPath(file.getOriginalFilename());

		try {
			Path path = Paths.get(app.getRealPath("\\views\\image\\product\\" + fileName));
			Files.copy(file.getInputStream(), path, StandardCopyOption.REPLACE_EXISTING);
			String dd = file.getOriginalFilename();
			sp.setImage(dd);
			if (!result.hasErrors()) {
				pDao.save(sp);
				model.addAttribute("success_product", "Create success!");		
			}
		} catch (Exception e) {
			e.printStackTrace();
		}	
		
		model.addAttribute("productItems", pDao.findAll());
		}
		return "Admin/product/form-product";
		
	}
	
	@PostMapping("/admin/product/update")
	public String ProductUpdate(Model model,@Validated @ModelAttribute("productItem") Product sp, BindingResult result, @RequestParam("img") MultipartFile file) throws IllegalStateException, IOException {
		if(!file.isEmpty()) {
			String fileName = StringUtils.cleanPath(file.getOriginalFilename());

		try {
			Path path = Paths.get(app.getRealPath("\\views\\image\\product\\" + fileName));
			Files.copy(file.getInputStream(), path, StandardCopyOption.REPLACE_EXISTING);
			String dd = file.getOriginalFilename();
			sp.setImage(dd);
			if (!result.hasErrors()) {
				if(pDao.findById(sp.getId()).isEmpty())
					model.addAttribute("error_product", "Id không tồn tại!");
				else {
				pDao.save(sp);
				model.addAttribute("success_product", "Update success!");
				}
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		}
		model.addAttribute("productItems", pDao.findAll());
		
		return "Admin/product/form-product";
	}
	
//	@PostMapping("/admin/product/delete")
//	public String ProductDelete(Model model,@ModelAttribute("productItem") Product sp) {
//		if(!sp.getId().equals("")) {
//			if(pDao.findById(sp.getId()).isEmpty())
//				model.addAttribute("error_product", "Id không tồn tại!");
//			else {
//				pDao.deleteById(sp.getId());
//				model.addAttribute("success_product", "Delete success!");
//			}
//		}
//		else
//		{
//			model.addAttribute("error_product", "Id không được rỗng");
//		}
//		model.addAttribute("productItems", pDao.findAll());
//		return "Admin/product/form-product";
//	}
	
	@GetMapping("/admin/product/edit")
	public String ProductEdit(Model model, @RequestParam("id") Integer id, @ModelAttribute("productItem") Product sp) {
		if(pDao.findById(sp.getId()).isEmpty())
			return "redirect:/admin/product/formproduct";
		else {
			Product product = pDao.findById(id).get();
			sp.setId(product.getId());
			sp.setName(product.getName());
			sp.setPrice(product.getPrice());
			sp.setDiscount(product.getDiscount());
			sp.setCategory(product.getCategory());
			sp.setImage(product.getImage());
			sp.setCreatedate(product.getCreatedate());
			
		}
		model.addAttribute("productItems", pDao.findAll());
		return "Admin/product/form-product";
	}
	
	@GetMapping("/admin/product/delete")
	public String ProductDelete(Model model, @RequestParam("id") Integer id, @ModelAttribute("productItem") Product sp) {
		if(pDao.findById(sp.getId()).isEmpty())
			return "redirect:/admin/product/formproduct";
		else {
			pDao.deleteById(id);
			model.addAttribute("success_product", "Delete success!");
		}
		model.addAttribute("productItems", pDao.findAll());
		return "Admin/product/form-product";
	}
	
//	@RequestMapping("/admin/product/searchproduct")
//	public String searchAndPage(Model model, @RequestParam("keywords") Optional<String> kw,
//			@RequestParam("p") Optional<Integer> p) {
//		String kwords = kw.orElse(session.get("keywords", ""));
//		session.set("keywords", kwords);
//		Pageable pageable = PageRequest.of(p.orElse(0), 5);
//		Page<Product> page = pDao.findByKeywords("%" + kwords + "%", pageable);
//		model.addAttribute("page", page);
//		return "Admin/product/form-product";
//	}
//	
	
	
	
	

}
