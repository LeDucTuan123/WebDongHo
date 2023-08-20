package com.poly.model;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Table;
import jakarta.persistence.Temporal;
import jakarta.persistence.TemporalType;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Entity
@Table(name = "Orders")
public class Order implements Serializable {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	Long id;
	@Temporal(TemporalType.DATE)
	Date createdate = new Date();
	String address;
	String phone;
	String fullname;
	String email;
	Double price;
	Boolean status;
	@ManyToOne
	@JoinColumn(name = "username")
	Account account;
	@OneToMany(mappedBy = "order")
	List<OrderDetail> list;
	
}
