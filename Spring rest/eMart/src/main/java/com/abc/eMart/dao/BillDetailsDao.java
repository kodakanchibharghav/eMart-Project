package com.abc.eMart.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import com.abc.eMart.dao.entity.BillDetailsEntity;

@Repository
public interface BillDetailsDao extends JpaRepository<BillDetailsEntity, Integer> {

}
