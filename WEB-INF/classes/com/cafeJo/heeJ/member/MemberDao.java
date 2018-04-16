package com.cafeJo.heeJ.member;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

public class MemberDao {
	private SqlSessionTemplate sqlSessionTemplate;

	public void setSqlSessionTemplate(SqlSessionTemplate sqlSessionTemplate) {
		this.sqlSessionTemplate = sqlSessionTemplate;
	}
	public String login(String userid) {
		return sqlSessionTemplate.selectOne("login", userid);
	}
	public MemberVo findUser(String userid) {
		return sqlSessionTemplate.selectOne("findUser", userid);
	}
	public int signup(MemberVo vo) {
		System.out.println(vo.getGrade());
		return sqlSessionTemplate.insert("signup", vo);
	}
	
	private HashMap<String, Object> valueMap = new HashMap<String, Object>();
	
	public int getMemberTotalNum() {
		return (Integer) sqlSessionTemplate.selectOne("getMemberTotalNum");
	}
	public List<MemberVo> getMemberList(int startArticleNum, int endArticleNum) {
		valueMap.put("startArticleNum", startArticleNum);
		valueMap.put("endArticleNum", endArticleNum);
		return sqlSessionTemplate.selectList("getMemberList", valueMap);
	}
	public int getSearchMemberTotalNum(String type, String keyword) {
		valueMap.put("type", type);
		valueMap.put("keyword", keyword);
		return (Integer) sqlSessionTemplate.selectOne("getSearchMemberTotalNum", valueMap);
	}
	public List<MemberVo> getSearchMember(String type, String keyword, int startArticleNum, int endArticleNum) {
		valueMap.put("type", type);
		valueMap.put("keyword", keyword);
		valueMap.put("startArticleNum", startArticleNum);
		valueMap.put("endArticleNum", endArticleNum);
		return sqlSessionTemplate.selectList("getSearchMember", valueMap);
	}
	public MemberVo getMemberview(String userid) {
		return sqlSessionTemplate.selectOne("getMemberview",userid);
	}
	public int idcheck(String userid) {
		return sqlSessionTemplate.selectOne("idcheck",userid);
	}
	public int updatemyinfo(MemberVo vo) {
		return sqlSessionTemplate.update("updatemyinfo",vo);
	}
	public int updatemyinfo2(MemberVo vo) {
		return sqlSessionTemplate.update("updatemyinfo2",vo);
	}
	public int deletemyinfo(String userid){ 
	return sqlSessionTemplate.update("deletemyinfo",userid);
	}
	public int addmemberagain(String userid){ 
	return sqlSessionTemplate.update("addmemberagain",userid);
	}
	public String findid(MemberVo vo) {
		return sqlSessionTemplate.selectOne("findid",vo);
	}
	public String findpw(MemberVo vo) {
		return sqlSessionTemplate.selectOne("findpw",vo);
	}
	public int setnewpw(MemberVo vo) {
		return sqlSessionTemplate.update("setnewpw",vo);
	}
	public String getnewpw(String userid) {
		return sqlSessionTemplate.selectOne("getnewpw",userid);
	}
	public int deleteuserqna(String userid) {
		return sqlSessionTemplate.delete("deleteuserqna",userid);
	}
	public int deleteinfo(String userid) {
		return sqlSessionTemplate.delete("deleteinfo",userid);
	}
	public int qnacount(String userid) {
		return sqlSessionTemplate.selectOne("qnacount",userid);
	}

/*	public List<MemberVo> getList(HashMap<String, String> map) {
		return sqlSessionTemplate.selectList("getList", map);
	}

	public MemberVo getInfo(int num) {
		return (MemberVo) sqlSessionTemplate.selectOne("getInfo", num);
	}

	public int getCount(HashMap<String, String> map) {
		return (Integer) sqlSessionTemplate.selectOne("getCount", map);
	}

	public int addHit(int num) {
		return sqlSessionTemplate.update("addHit", num);
	}

	public MemberVo getPrev(int num) {
		return (MemberVo) sqlSessionTemplate.selectOne("getPrev", num);
	}

	public MemberVo getNext(int num) {
		return (MemberVo) sqlSessionTemplate.selectOne("getNext", num);
	}

	public int insert(MemberVo vo) {
		return sqlSessionTemplate.insert("insert", vo);
	}*/
}
