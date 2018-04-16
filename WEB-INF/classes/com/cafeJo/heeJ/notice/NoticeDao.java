package com.cafeJo.heeJ.notice;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

public class NoticeDao {
	private SqlSessionTemplate sqlSessionTemplate;

	public void setSqlSessionTemplate(SqlSessionTemplate sqlSessionTemplate) {
		this.sqlSessionTemplate = sqlSessionTemplate;
	}
	
	private HashMap<String, Object> valueMap = new HashMap<String, Object>();

	public int getNoticeTotalNum() {
		return (Integer) sqlSessionTemplate.selectOne("getNoticeTotalNum");
	}
	public List<NoticeVo> getNoticeList(int startArticleNum, int endArticleNum) {
		valueMap.put("startArticleNum", startArticleNum);
		valueMap.put("endArticleNum", endArticleNum);
		return sqlSessionTemplate.selectList("getNoticeList", valueMap);
	}
	public int getSearchNoticeTotalNum(String type, String keyword) {
		valueMap.put("type", type);
		valueMap.put("keyword", keyword);
		return (Integer) sqlSessionTemplate.selectOne("getSearchNoticeTotalNum", valueMap);
	}
	public List<NoticeVo> getSearchNotice(String type, String keyword, int startArticleNum, int endArticleNum) {
		valueMap.put("type", type);
		valueMap.put("keyword", keyword);
		valueMap.put("startArticleNum", startArticleNum);
		valueMap.put("endArticleNum", endArticleNum);
		return sqlSessionTemplate.selectList("getSearchNotice", valueMap);
	}
	
	public int noticehitup(int nnum) {
		return sqlSessionTemplate.update("noticehitup",nnum);
	}
	public NoticeVo getNoticeview(int nnum) {
		return sqlSessionTemplate.selectOne("getNoticeview",nnum);
	}
	public int addnotice(NoticeVo vo) {
		return sqlSessionTemplate.insert("addnotice",vo);
	}
	public int maxnnum() {
		return sqlSessionTemplate.selectOne("maxnnum");
	}
	public int updatenotice(NoticeVo vo) {
		return sqlSessionTemplate.update("updatenotice",vo);
	}
	public int deletenotice(int nnum) {
		return sqlSessionTemplate.delete("deletenotice",nnum);
	}
}
