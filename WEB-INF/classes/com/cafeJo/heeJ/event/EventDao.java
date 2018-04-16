package com.cafeJo.heeJ.event;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import com.cafeJo.heeJ.member.MemberVo;

public class EventDao {
	private SqlSessionTemplate sqlSessionTemplate;

	public void setSqlSessionTemplate(SqlSessionTemplate sqlSessionTemplate) {
		this.sqlSessionTemplate = sqlSessionTemplate;
	}
	
	private HashMap<String, Object> valueMap = new HashMap<String, Object>();

	public int getEventTotalNum() {
		return (Integer) sqlSessionTemplate.selectOne("getEventTotalNum");
	}
	public List<EventVo> getEventList(int startArticleNum, int endArticleNum) {
		valueMap.put("startArticleNum", startArticleNum);
		valueMap.put("endArticleNum", endArticleNum);
		return sqlSessionTemplate.selectList("getEventList", valueMap);
	}
	public int getSearchEventTotalNum(String type, String keyword) {
		valueMap.put("type", type);
		valueMap.put("keyword", keyword);
		return (Integer) sqlSessionTemplate.selectOne("getSearchEventTotalNum", valueMap);
	}
	public List<EventVo> getSearchEvent(String type, String keyword, int startArticleNum, int endArticleNum) {
		valueMap.put("type", type);
		valueMap.put("keyword", keyword);
		valueMap.put("startArticleNum", startArticleNum);
		valueMap.put("endArticleNum", endArticleNum);
		return sqlSessionTemplate.selectList("getSearchEvent", valueMap);
	}
	public int getEventmemberTotalNum() {
		return (Integer) sqlSessionTemplate.selectOne("getEventmemberTotalNum");
	}
	public List<EventmemberVo> getEventmemberList(int startArticleNum, int endArticleNum) {
		valueMap.put("startArticleNum", startArticleNum);
		valueMap.put("endArticleNum", endArticleNum);
		return sqlSessionTemplate.selectList("getEventmemberList", valueMap);
	}
	public int getSearchEventmemberTotalNum(String type, String keyword) {
		valueMap.put("type", type);
		valueMap.put("keyword", keyword);
		return (Integer) sqlSessionTemplate.selectOne("getSearchEventmemberTotalNum", valueMap);
	}
	public List<EventmemberVo> getSearchEventmember(String type, String keyword, int startArticleNum, int endArticleNum) {
		valueMap.put("type", type);
		valueMap.put("keyword", keyword);
		valueMap.put("startArticleNum", startArticleNum);
		valueMap.put("endArticleNum", endArticleNum);
		return sqlSessionTemplate.selectList("getSearchEventmember", valueMap);
	}
	
	public int eventhitup(int eventnum) {
		return sqlSessionTemplate.update("eventhitup",eventnum);
	}
	public EventVo getEventview(int eventnum) {
		return sqlSessionTemplate.selectOne("getEventview",eventnum);
	}
	public int addevent(EventVo vo) {
		return sqlSessionTemplate.insert("addevent",vo);
	}
	public int maxeventnum() {
		return sqlSessionTemplate.selectOne("maxeventnum");
	}
	public int updateevent(EventVo vo) {
		return sqlSessionTemplate.update("updateevent",vo);
	}
	public int deleteevent(int eventnum) {
		return sqlSessionTemplate.delete("deleteevent",eventnum);
	}
	public int deleteeventmember(int eventnum) {
		return sqlSessionTemplate.delete("deleteeventmember",eventnum);
	}
	public MemberVo getUserinfo(String userid) {
		return sqlSessionTemplate.selectOne("getUserinfo",userid);
	}
	public int eventdo(EventmemberVo eventmemberVo) {
		return sqlSessionTemplate.insert("eventdo",eventmemberVo);
	}
	public int eventcheck(EventmemberVo eventmemberVo) {
		return sqlSessionTemplate.selectOne("eventcheck",eventmemberVo);
	}
	public int eventnowcountup(int eventnum) {
		return sqlSessionTemplate.update("eventnowcountup",eventnum);
	}
	public int getEventnowcount(int eventnum) {
		return sqlSessionTemplate.selectOne("getEventnowcount",eventnum);
	}
	public int getEventcount(int eventnum) {
		return sqlSessionTemplate.selectOne("getEventcount",eventnum);
	}
	public int updateEventfinish(int eventnum) {
		return sqlSessionTemplate.update("updateEventfinish",eventnum);
	}
	public String getEventfinish(int eventnum) {
		return sqlSessionTemplate.selectOne("getEventfinish",eventnum);
	}
	
	public int getMyeventTotalNum(String qrefid ) {
		return (Integer) sqlSessionTemplate.selectOne("getMyeventTotalNum",qrefid );
	}
	public List<EventmemberVo> getMyeventList(int startArticleNum, int endArticleNum,String userid ) {
		valueMap.put("startArticleNum", startArticleNum);
		valueMap.put("endArticleNum", endArticleNum);
		valueMap.put("userid", userid );
		return sqlSessionTemplate.selectList("getMyeventList", valueMap);
	}
	public int getSearchMyeventTotalNum(String type, String keyword,String userid ) {
		valueMap.put("type", type);
		valueMap.put("keyword", keyword);
		valueMap.put("userid", userid );
		return (Integer) sqlSessionTemplate.selectOne("getSearchMyeventTotalNum", valueMap);
	}
	public List<EventmemberVo> getSearchMyevent(String type, String keyword, int startArticleNum, int endArticleNum,String qrefid ) {
		valueMap.put("type", type);
		valueMap.put("keyword", keyword);
		valueMap.put("startArticleNum", startArticleNum);
		valueMap.put("endArticleNum", endArticleNum);
		valueMap.put("qrefid", qrefid );
		return sqlSessionTemplate.selectList("getSearchMyevent", valueMap);
	}
	public String getEtitle(int eventnum) {
		return sqlSessionTemplate.selectOne("getEtitle", eventnum);
	}
}
