package com.abc.eMart.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import com.abc.eMart.dao.entity.BillEntity;

@Repository
public interface BillDao extends JpaRepository<BillEntity, Integer> {

}
