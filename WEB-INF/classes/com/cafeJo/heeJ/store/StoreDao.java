package com.cafeJo.heeJ.store;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

public class StoreDao {
	private SqlSessionTemplate sqlSessionTemplate;

	public void setSqlSessionTemplate(SqlSessionTemplate sqlSessionTemplate) {
		this.sqlSessionTemplate = sqlSessionTemplate;
	}
	
	private HashMap<String, Object> valueMap = new HashMap<String, Object>();

	public int getStoreTotalNum() {
		return (Integer) sqlSessionTemplate.selectOne("getStoreTotalNum");
	}
	public List<StoreVo> getStoreList(int startArticleNum, int endArticleNum) {
		valueMap.put("startArticleNum", startArticleNum);
		valueMap.put("endArticleNum", endArticleNum);
		return sqlSessionTemplate.selectList("getStoreList", valueMap);
	}
	public int getSearchStoreTotalNum(String type, String keyword) {
		valueMap.put("type", type);
		valueMap.put("keyword", keyword);
		return (Integer) sqlSessionTemplate.selectOne("getSearchStoreTotalNum", valueMap);
	}
	public List<StoreVo> getSearchStore(String type, String keyword,String doadress,String gooadress, int startArticleNum, int endArticleNum) {
		valueMap.put("type", type);
		valueMap.put("keyword", keyword);
		valueMap.put("doadress", doadress);
		valueMap.put("gooadress", gooadress);
		valueMap.put("startArticleNum", startArticleNum);
		valueMap.put("endArticleNum", endArticleNum);
		return sqlSessionTemplate.selectList("getSearchStore", valueMap);
	}
	
	public int storehitup(int storenum) {
		return sqlSessionTemplate.update("storehitup",storenum);
	}
	public StoreVo getStoreview(int storenum) {
		return sqlSessionTemplate.selectOne("getStoreview",storenum);
	}
	public int addstore(StoreVo vo) {
		return sqlSessionTemplate.insert("addstore",vo);
	}
	public int maxstorenum() {
		return sqlSessionTemplate.selectOne("maxstorenum");
	}
	public int updatestore(StoreVo vo) {
		return sqlSessionTemplate.update("updatestore",vo);
	}
	public int deletestore(int storenum) {
		return sqlSessionTemplate.delete("deletestore",storenum);
	}
}
