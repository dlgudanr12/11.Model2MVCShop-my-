package com.model2.mvc.service.purchase.impl;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.model2.mvc.common.Search;
import com.model2.mvc.service.domain.Purchase;
import com.model2.mvc.service.purchase.PurchaseDao;

@Repository("purchaseDaoImpl")
public class PurchaseDaoImpl implements PurchaseDao {

	@Autowired
	@Qualifier("sqlSessionTemplate")
	private SqlSession sqlSession;

	public PurchaseDaoImpl() {
		System.out.println(this.getClass());
	}

	public void addPurchase(Purchase purchase) throws Exception {
		sqlSession.insert("PurchaseMapper.addPurchase", purchase);
	}

	public Purchase getPurchase(int tranNo) throws Exception {
		return sqlSession.selectOne("PurchaseMapper.getPurchase", tranNo);
	}

	public void updatePurchase(Purchase purchase) throws Exception {
		sqlSession.update("PurchaseMapper.updatePurchase", purchase);
	}

	public void updateTranCode(Map<String, Object> map) throws Exception {
		sqlSession.update("PurchaseMapper.updateTranCode", map);
	}

	public List<Purchase> getPurchaseList(Map<String, Object> map) throws Exception {
		return sqlSession.selectList("PurchaseMapper.getPurchaseList", map);
	}

	public int getTotalCount(Map<String, Object> map) throws Exception {
		return sqlSession.selectOne("PurchaseMapper.getTotalCount", map);
	}

	public Map<String, Object> getSaleList(Search search) {
		return null;
	}

	public List<Purchase> getDeliveryList(Search search) throws Exception {
		return sqlSession.selectList("PurchaseMapper.getDeliveryList", search);
	}

	public int getTotalCountOfDeliveryList(Search search) throws Exception {
		return sqlSession.selectOne("PurchaseMapper.getTotalCountOfDeliveryList", search);
	}

	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
}
