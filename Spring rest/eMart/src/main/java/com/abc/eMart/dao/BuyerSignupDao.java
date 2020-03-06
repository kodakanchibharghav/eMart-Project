package com.abc.eMart.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import com.abc.eMart.dao.entity.BuyerSignupEntity;

@Repository
public interface BuyerSignupDao extends JpaRepository<BuyerSignupEntity, Integer> {

	BuyerSignupEntity findByBuyerUsernameAndBuyerPassword(String username, String password);
}
