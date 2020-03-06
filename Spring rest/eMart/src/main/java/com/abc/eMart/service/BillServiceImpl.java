package com.abc.eMart.service;

import java.util.HashSet;
import java.util.Set;
import javax.transaction.Transactional;
import org.apache.log4j.BasicConfigurator;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.abc.eMart.dao.BillDao;
import com.abc.eMart.dao.BillDetailsDao;
import com.abc.eMart.dao.entity.BillDetailsEntity;
import com.abc.eMart.dao.entity.BillEntity;
import com.abc.eMart.dao.entity.BuyerSignupEntity;
import com.abc.eMart.dao.entity.CategoryEntity;
import com.abc.eMart.dao.entity.ItemEntity;
import com.abc.eMart.dao.entity.SellerSignupEntity;
import com.abc.eMart.dao.entity.SubCategoryEntity;
import com.abc.eMart.model.BillDetailsPojo;
import com.abc.eMart.model.BillPojo;
import com.abc.eMart.model.BuyerSignupPojo;
import com.abc.eMart.model.CategoryPojo;
import com.abc.eMart.model.ItemPojo;
import com.abc.eMart.model.SellerSignupPojo;
import com.abc.eMart.model.SubCategoryPojo;

@Service
public class BillServiceImpl implements BillService {
	static Logger LOG = Logger.getLogger(BillServiceImpl.class.getClass());
	@Autowired
	BillDao billDao;

	@Autowired
	BillDetailsDao BillDetailsDao;

	@Override
	// adds the bill to the database
	@Transactional
	public BillPojo saveBill(BillPojo billPojo) {
		LOG.info("Entered saveBill() ");
		BuyerSignupPojo buyerSignupPojo = billPojo.getBuyerPojo();
		BuyerSignupEntity buyerSignupEntity = new BuyerSignupEntity(buyerSignupPojo.getBuyerId(),
				buyerSignupPojo.getBuyerUsername(), buyerSignupPojo.getBuyerPassword(), buyerSignupPojo.getBuyerEmail(),
				buyerSignupPojo.getBuyerMobile(), buyerSignupPojo.getBuyerDate(), null);

		BillEntity billEntity = new BillEntity();
		billEntity.setBillId(0);
		billEntity.setBillAmount(billPojo.getBillAmount());
		billEntity.setBillRemarks(billPojo.getBillRemarks());
		billEntity.setBillType(billPojo.getBillType());
		billEntity.setBillDate(billPojo.getBillDate());
		billEntity.setBuyer(buyerSignupEntity);
		billEntity = billDao.saveAndFlush(billEntity);
		billPojo.setBillId(billEntity.getBillId());

		BillEntity setBillEntity = billDao.findById(billEntity.getBillId()).get();

		Set<BillDetailsEntity> allBillDetailsEntity = new HashSet<BillDetailsEntity>();
		Set<BillDetailsPojo> allBillDetailsPojo = billPojo.getAllBillDetails();

		for (BillDetailsPojo billDetailsPojo : allBillDetailsPojo) {
			ItemPojo itemPojo = billDetailsPojo.getItemPojo();
			SubCategoryPojo subCategoryPojo = itemPojo.getSubCategoryPojo();
			CategoryPojo categoryPojo = subCategoryPojo.getCategoryPojo();
			SellerSignupPojo sellerSignupPojo = itemPojo.getSellerPojo();

			SellerSignupEntity sellerSignupEntity = new SellerSignupEntity(sellerSignupPojo.getSellerId(),
					sellerSignupPojo.getSellerUsername(), sellerSignupPojo.getSellerPassword(),
					sellerSignupPojo.getSellerCompany(), sellerSignupPojo.getSellerBrief(),
					sellerSignupPojo.getSellerGst(), sellerSignupPojo.getSellerAddress(),
					sellerSignupPojo.getSellerEmail(), sellerSignupPojo.getSellerContact(),
					sellerSignupPojo.getSellerWebsite());

			CategoryEntity categoryEntity = new CategoryEntity(categoryPojo.getCategoryId(),
					categoryPojo.getCategoryName(), categoryPojo.getCategoryBrief());

			SubCategoryEntity subCategoryEntity = new SubCategoryEntity(subCategoryPojo.getSubCategoryId(),
					subCategoryPojo.getSubCategoryName(), categoryEntity, subCategoryPojo.getSubCategoryBrief(),
					subCategoryPojo.getSubCategoryGst());

			ItemEntity itemEntity = new ItemEntity(itemPojo.getItemId(), itemPojo.getItemName(),
					itemPojo.getItemImage(), itemPojo.getItemPrice(), itemPojo.getItemStock(),
					itemPojo.getItemDescription(), subCategoryEntity, itemPojo.getItemRemarks(), sellerSignupEntity);

			BillDetailsEntity billDetailsEntity = new BillDetailsEntity(billDetailsPojo.getBillDetailsId(),
					setBillEntity, itemEntity);
			BillDetailsDao.save(billDetailsEntity);

		}
		BasicConfigurator.configure();
		LOG.info("Exited saveBill() ");
		return billPojo;
	}
}
