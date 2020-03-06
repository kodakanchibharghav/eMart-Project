package com.abc.eMart.service;

import java.util.*;
import com.abc.eMart.model.ItemPojo;

public interface ItemService {
	List<ItemPojo> getAllItems();

	ItemPojo getItem(Integer itemId);

	void deleteItem(Integer itemId);

	ItemPojo addItem(ItemPojo itemPojo);

	ItemPojo updateItem(ItemPojo itemPojo);
}
