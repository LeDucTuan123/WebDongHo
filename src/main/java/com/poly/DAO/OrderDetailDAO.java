package com.poly.DAO;

import java.util.List;

import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.poly.model.OrderDetail;
import com.poly.model.Product;

public interface OrderDetailDAO extends JpaRepository<OrderDetail, Long>{
	@Query("select o from OrderDetail o where o.product.id = ?1 and o.order.id = ?2")
	OrderDetail findByProductId(Integer id, Long idO);
	@Query("select o from OrderDetail o where o.order.account.username like ?1")
	List<OrderDetail> findAllByUsername(String username);
	@Query("select o from OrderDetail o where o.order.account.username like ?1 and o.order.address is null")
	List<OrderDetail> findAllByUsernameA(String username);
	@Query("select o from OrderDetail o where o.order.id = ?1")
	List<OrderDetail> findByOrderId(Long id);
	@Query("select DISTINCT(o.product.id), count(o.product) as soLuong from OrderDetail o group by o.product.id order by count(o.product)")
	List<Object[]> findMostSale(Pageable pageable);
}
