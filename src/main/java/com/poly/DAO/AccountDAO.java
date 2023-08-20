package com.poly.DAO;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.poly.model.Account;

public interface AccountDAO extends JpaRepository<Account, String>{
	Account findByEmail(String email);
}
