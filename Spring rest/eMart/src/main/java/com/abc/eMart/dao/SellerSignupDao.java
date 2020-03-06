package com.abc.eMart.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import com.abc.eMart.dao.entity.SellerSignupEntity;

@Repository
public interface SellerSignupDao extends JpaRepository<SellerSignupEntity, Integer> {

}
