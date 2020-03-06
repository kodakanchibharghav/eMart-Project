package com.abc.eMart.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import com.abc.eMart.dao.entity.SubCategoryEntity;

@Repository
public interface SubCategoryDao extends JpaRepository<SubCategoryEntity, Integer> {

}
