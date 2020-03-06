package com.abc.eMart.service;

import com.abc.eMart.model.BuyerSignupPojo;

public interface BuyerSignupService {

	BuyerSignupPojo validateBuyer(BuyerSignupPojo buyerSignupPojo);

	BuyerSignupPojo getBuyer(Integer buyerId);

}
