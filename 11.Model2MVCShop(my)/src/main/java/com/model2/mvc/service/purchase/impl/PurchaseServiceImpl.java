package com.model2.mvc.service.purchase.impl;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.model2.mvc.common.Search;
import com.model2.mvc.service.domain.Purchase;
import com.model2.mvc.service.product.ProductDao;
import com.model2.mvc.service.purchase.PurchaseDao;
import com.model2.mvc.service.purchase.PurchaseService;

@Service("purchaseServiceImpl")
public class PurchaseServiceImpl implements PurchaseService {
	@Autowired
	@Qualifier("purchaseDaoImpl")
	private PurchaseDao purchaseDao;
	@Autowired
	@Qualifier("productDaoImpl")
	private ProductDao productDao;

	public PurchaseServiceImpl() {
		System.out.println(this.getClass());
	}

	@Override
	public Purchase addPurchase(Purchase purchase) throws Exception {
		// ��� ������ ��ǰ ���� ��� �� SQL�� �� �� �����ϱ�.
		int newProdQuantity = productDao.findProduct(purchase.getPurchaseProd().getProdNo()).getProdQuantity()
				- purchase.getTranQuantity();
		if (newProdQuantity < 0) {
			purchase.setTranQuantity(purchase.getTranQuantity() + newProdQuantity);
			newProdQuantity = 0;
		}
		purchase.getPurchaseProd().setProdQuantity(newProdQuantity);

		// ����ֱ�
		productDao.updateQuantity(purchase.getPurchaseProd());
		purchaseDao.insertPurchase(purchase);

		return purchase;
	}

	@Override
	public Purchase getPurchase(int tranNo) throws Exception {
		return purchaseDao.findPurchase(tranNo);
	}

	@Override
	public Map<String, Object> getPurchaseList(Search search, String buyer_Id) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", purchaseDao.getPurchaseList(search, buyer_Id));
		map.put("totalCount", purchaseDao.getTotalCount(buyer_Id));

		return map;
	}

	@Override
	public Purchase updatePurchase(Purchase purchase) throws Exception {
		// ��� ������ ��ǰ ���� ��� �� SQL�� �� �� �����ϱ�.
		Purchase defaultPurchase=purchaseDao.findPurchase(purchase.getTranNo());
		int newProdQuantity = defaultPurchase.getPurchaseProd().getProdQuantity()
				+ defaultPurchase.getTranQuantity() - purchase.getTranQuantity();

		if (newProdQuantity < 0) {
			purchase.setTranQuantity(purchase.getTranQuantity() + newProdQuantity);
			newProdQuantity = 0;
		}
		System.out.println("PurchaseServiceImpl.updatePurchase.newProdQuantity : "+ newProdQuantity);
		defaultPurchase.getPurchaseProd().setProdQuantity(newProdQuantity);

		// ����ֱ�
		productDao.updateQuantity(defaultPurchase.getPurchaseProd());
		purchaseDao.updatePurchase(purchase);
		return purchaseDao.findPurchase(purchase.getTranNo());
	}

	@Override
	public void updateTranCode(Purchase purchase) throws Exception {
		purchaseDao.updateTranCode(purchase);
	}

	@Override
	public Map<String, Object> getSaleList(Search search) throws Exception {

		return null;
	}

	public Map<String, Object> getDeliveryList(Search search) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", purchaseDao.getDeliveryList(search));
		map.put("totalCount", purchaseDao.getTotalCountOfDeliveryList(search));

		return map;
	}

	public void setPurchaseDao(PurchaseDao purchaseDao) {
		this.purchaseDao = purchaseDao;
	}

}
