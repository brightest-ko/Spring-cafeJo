package com.cafeJo.heeJ.menu;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import com.cafeJo.heeJ.member.MemberVo;
import com.cafeJo.heeJ.qna.QnaVo;

public class MenuDao {
	private SqlSessionTemplate sqlSessionTemplate;

	public void setSqlSessionTemplate(SqlSessionTemplate sqlSessionTemplate) {
		this.sqlSessionTemplate = sqlSessionTemplate;
	}

	public int addmenu(MenuVo vo) {
		System.out.println(vo);
		return sqlSessionTemplate.insert("addmenu", vo);
	}

	private HashMap<String, Object> valueMap = new HashMap<String, Object>();

	//Coffee
	public int getCoffeeTotalNum() {
		return (Integer) sqlSessionTemplate.selectOne("getCoffeeTotalNum");
	}
	public List<MenuVo> getCoffeeList(int startArticleNum, int endArticleNum) {
		valueMap.put("startArticleNum", startArticleNum);
		valueMap.put("endArticleNum", endArticleNum);
		return sqlSessionTemplate.selectList("getCoffeeList", valueMap);
	}
	public int getSearchCoffeeTotalNum(String type, String keyword) {
		valueMap.put("type", type);
		valueMap.put("keyword", keyword);
		return (Integer) sqlSessionTemplate.selectOne("getSearchCoffeeTotalNum", valueMap);
	}
	public List<MenuVo> getSearchCoffee(String type, String keyword, int startArticleNum, int endArticleNum) {
		valueMap.put("type", type);
		valueMap.put("keyword", keyword);
		valueMap.put("startArticleNum", startArticleNum);
		valueMap.put("endArticleNum", endArticleNum);
		return sqlSessionTemplate.selectList("getSearchCoffee", valueMap);
	}

	//Beverage
	public int getBeverageTotalNum() {
		return (Integer) sqlSessionTemplate.selectOne("getBeverageTotalNum");
	}
	public List<MenuVo> getBeverageList(int startArticleNum, int endArticleNum) {
		valueMap.put("startArticleNum", startArticleNum);
		valueMap.put("endArticleNum", endArticleNum);
		return sqlSessionTemplate.selectList("getBeverageList", valueMap);
	}
	public int getSearchBeverageTotalNum(String type, String keyword) {
		valueMap.put("type", type);
		valueMap.put("keyword", keyword);
		return (Integer) sqlSessionTemplate.selectOne("getSearchBeverageTotalNum", valueMap);
	}
	public List<MenuVo> getSearchBeverage(String type, String keyword, int startArticleNum, int endArticleNum) {
		valueMap.put("type", type);
		valueMap.put("keyword", keyword);
		valueMap.put("startArticleNum", startArticleNum);
		valueMap.put("endArticleNum", endArticleNum);
		return sqlSessionTemplate.selectList("getSearchBeverage", valueMap);
	}

	//Dessert
	public int getDessertTotalNum() {
		return (Integer) sqlSessionTemplate.selectOne("getDessertTotalNum");
	}
	public List<MenuVo> getDessertList(int startArticleNum, int endArticleNum) {
		valueMap.put("startArticleNum", startArticleNum);
		valueMap.put("endArticleNum", endArticleNum);
		return sqlSessionTemplate.selectList("getDessertList", valueMap);
	}
	public int getSearchDessertTotalNum(String type, String keyword) {
		valueMap.put("type", type);
		valueMap.put("keyword", keyword);
		return (Integer) sqlSessionTemplate.selectOne("getSearchDessertTotalNum", valueMap);
	}
	public List<MenuVo> getSearchDessert(String type, String keyword, int startArticleNum, int endArticleNum) {
		valueMap.put("type", type);
		valueMap.put("keyword", keyword);
		valueMap.put("startArticleNum", startArticleNum);
		valueMap.put("endArticleNum", endArticleNum);
		return sqlSessionTemplate.selectList("getSearchDessert", valueMap);
	}
	
	public MenuVo getMenuview(int num) {
		return sqlSessionTemplate.selectOne("getMenuview",num);
	}

	public int updatemenu(MenuVo vo) {
		return sqlSessionTemplate.update("updatemenu",vo);
	}

	public int deletemenu(int num) {
		return sqlSessionTemplate.delete("deletemenu",num);
	}

}
