package com.poly.model;

import java.io.Serializable;
import java.util.List;

import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Table;
import jakarta.validation.constraints.Email;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Entity
@Table(name = "Accounts")
public class Account implements Serializable {
	@Id
	@NotNull()
	@NotBlank()
	String username;
	@NotNull()
	@NotBlank()
	String password;
	@NotNull()
	@NotBlank()
	String fullname;
	@NotNull()
	@Email
	@NotBlank()
	String email;
	String photo;
	Boolean activated = false;
	Boolean admin = false;
	String otp;
	@OneToMany(mappedBy = "account")
	List<Order> orders;
	
}
