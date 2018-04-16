package com.cafeJo.heeJ.qna;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import com.cafeJo.heeJ.member.MemberVo;

public class QnaDao {
	private SqlSessionTemplate sqlSessionTemplate;

	public void setSqlSessionTemplate(SqlSessionTemplate sqlSessionTemplate) {
		this.sqlSessionTemplate = sqlSessionTemplate;
	}
	
	public MemberVo getMemberInfo(String userid) {
		return sqlSessionTemplate.selectOne("getMemberInfo", userid);
	}

	public int addqna(QnaVo vo) {
		return sqlSessionTemplate.insert("addqna",vo);
	}
	public int maxqnum() {
		return sqlSessionTemplate.selectOne("maxqnum");
	}
	public int insertqref(int maxqnum) {
		return sqlSessionTemplate.update("insertqref",maxqnum);
	}
	public QnaVo getQnaview(int qnum) {
		return sqlSessionTemplate.selectOne("getQnaview",qnum);
	}

	
	private HashMap<String, Object> valueMap = new HashMap<String, Object>();
	
	public int getQnaTotalNum() {
		return (Integer) sqlSessionTemplate.selectOne("getQnaTotalNum");
	}
	public List<QnaVo> getQnaList(int startArticleNum, int endArticleNum) {
		valueMap.put("startArticleNum", startArticleNum);
		valueMap.put("endArticleNum", endArticleNum);
		return sqlSessionTemplate.selectList("getQnaList", valueMap);
	}
	public int getSearchQnaTotalNum(String type, String keyword) {
		valueMap.put("type", type);
		valueMap.put("keyword", keyword);
		return (Integer) sqlSessionTemplate.selectOne("getSearchQnaTotalNum", valueMap);
	}
	public List<QnaVo> getSearchQna(String type, String keyword, int startArticleNum, int endArticleNum) {
		valueMap.put("type", type);
		valueMap.put("keyword", keyword);
		valueMap.put("startArticleNum", startArticleNum);
		valueMap.put("endArticleNum", endArticleNum);
		return sqlSessionTemplate.selectList("getSearchQna", valueMap);
	}
	public int deleteqna(int qnum) {
		return sqlSessionTemplate.delete("deleteqna",qnum);
	}

	public int updateqna(QnaVo vo) {
		return sqlSessionTemplate.update("updateqna",vo);
	}

	public int addadminqna(QnaVo vo) {
		return sqlSessionTemplate.insert("addadminqna",vo);
	}

	public int yesreply(int qref) {
		return sqlSessionTemplate.update("yesreply",qref);
	}

	
	public int getMyqnaTotalNum(String qrefid ) {
		return (Integer) sqlSessionTemplate.selectOne("getMyqnaTotalNum",qrefid );
	}
	public List<QnaVo> getMyqnaList(int startArticleNum, int endArticleNum,String qrefid ) {
		valueMap.put("startArticleNum", startArticleNum);
		valueMap.put("endArticleNum", endArticleNum);
		valueMap.put("qrefid", qrefid );
		return sqlSessionTemplate.selectList("getMyqnaList", valueMap);
	}
	public int getSearchMyqnaTotalNum(String type, String keyword,String qrefid ) {
		valueMap.put("type", type);
		valueMap.put("keyword", keyword);
		valueMap.put("qrefid", qrefid );
		return (Integer) sqlSessionTemplate.selectOne("getSearchMyqnaTotalNum", valueMap);
	}
	public List<QnaVo> getSearchMyqna(String type, String keyword, int startArticleNum, int endArticleNum,String qrefid ) {
		valueMap.put("type", type);
		valueMap.put("keyword", keyword);
		valueMap.put("startArticleNum", startArticleNum);
		valueMap.put("endArticleNum", endArticleNum);
		valueMap.put("qrefid", qrefid );
		return sqlSessionTemplate.selectList("getSearchMyqna", valueMap);
	}
	
}
