package com.poly.DAO;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.poly.model.Product;

public interface ProductDAO extends JpaRepository<Product, Integer> {
	@Query("select p from Product p where p.category.id = ?1")
	Page<Product> findByCategoryId(String id, Pageable pageable);
	@Query("select p from Product p order by p.createdate")
	List<Product> findOrderByDate(Pageable pageable);
}
