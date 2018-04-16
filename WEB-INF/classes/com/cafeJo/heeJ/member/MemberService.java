package com.cafeJo.heeJ.member;

import java.io.File;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.cafeJo.heeJ.member.MemberVo;
import com.cafeJo.heeJ.notice.NoticeVo;



public class MemberService {
	private MemberDao dao;

	public void setDao(MemberDao dao) {
		this.dao = dao;
	}
	
	public int login(HttpSession session, String userid, String passwd) {
		int result=-1;
		String loginPass = dao.login(userid);
		if (loginPass != null) {
			result =2;
			if (loginPass.equals(passwd)){
				session.setAttribute("userid", userid);			
				String username = dao.findUser(userid).getUsername(); //세션에 넣는 방법 말고 다른 방법은 없을까?
				String grade = dao.findUser(userid).getGrade();
				session.setAttribute("username", username);
				session.setAttribute("grade", grade);
				result = 1;}
		}
		return result;
	}
	public int signup(MemberVo vo) {
		return dao.signup(vo);
	}

	public String findUsername(HttpSession session) {
		String username = null;
		String userid = (String) session.getAttribute("userid");
		if(userid!=null&&!userid.equals("")){
			username = dao.findUser(userid).getUsername();
		}
		return username;
	}
	
	// article, page variables
	private int currentPage = 1;
	private int showArticleLimit = 10; // change value if want to show more articles by one page
	private int showPageLimit = 5; // change value if want to show more page links
	private int startArticleNum = 0;
	private int endArticleNum = 0;
	private int totalNum = 0;
	
	public ModelAndView getMemberinfo(HttpServletRequest request){
		
		String type = null;
		String keyword = null;
		// set variables from request parameter
		if(request.getParameter("page") == null || request.getParameter("page").trim().isEmpty() || request.getParameter("page").equals("0")) {
			currentPage = 1;
		} else {
			currentPage = Integer.parseInt(request.getParameter("page"));
		}
		
		if(request.getParameter("type") != null){
			type = request.getParameter("type").trim();
		}
		
		if(request.getParameter("keyword") != null){
			keyword = request.getParameter("keyword").trim();
			if(type.equals("grade")){
				keyword = keyword.toUpperCase();
			}
			if(type.equals("hpget")||type.equals("mailget")){
				keyword = keyword.toLowerCase();
			}
		}
		
		// expression article variables value
		startArticleNum = (currentPage - 1) * showArticleLimit + 1;
		endArticleNum = startArticleNum + showArticleLimit -1;
		
		// get memberlist and get page html code
		List<MemberVo> memberlist;
		int realTotalNum = dao.getMemberTotalNum();
		if(type != null && keyword != null){
			memberlist = dao.getSearchMember(type, keyword, startArticleNum, endArticleNum);
			totalNum = dao.getSearchMemberTotalNum(type, keyword);
		} else {
			memberlist = dao.getMemberList(startArticleNum, endArticleNum);
			totalNum = dao.getMemberTotalNum();
		}
		StringBuffer pageHtml = getPageHtml(currentPage, totalNum, showArticleLimit, showPageLimit, type, keyword);
		ModelAndView mav = new ModelAndView();
		mav.addObject("memberlist", memberlist);
		mav.addObject("pageHtml", pageHtml);
		mav.addObject("realTotalNum", realTotalNum);
		mav.addObject("currentPage", currentPage);
		mav.setViewName("/member/memberinfo");
		
		return mav;
	}
	
	public StringBuffer getPageHtml(int currentPage, int totalNum, int showArticleLimit, int showPageLimit, String type, String keyword) {
		
		totalNum = (int) Math.ceil((double) totalNum / showArticleLimit);
		if (totalNum == 0) {
			totalNum = 1;
		}
		// 현재 페이지가 전체 페이지 수보다 크면 전체 페이지 수로 설정
		if (currentPage > totalNum) {
			currentPage = totalNum;
		}
		
		// 시작 페이지와 마지막 페이지 값 구하기.
		int startPage = (int) ((currentPage - 1) / showPageLimit) * showPageLimit + 1;
		int endPage = startPage + showPageLimit - 1;
		// 마지막 페이지가 전체 페이지 수보다 크면 전체 페이지 수로 설정
		if (endPage > totalNum) {
			endPage = totalNum;
		}

		// 이전 block 페이지
		StringBuffer pagingHtml = new StringBuffer();
		if(type == null && keyword == null){			

			if (currentPage > showPageLimit) {
				pagingHtml.append("<span><a href=\"memberinfo.js?page=" + (startPage - 1) + "\">");
				pagingHtml.append("이전");
				pagingHtml.append("</a>");
			}
			pagingHtml.append("&nbsp;|&nbsp;");
			// 페이지 번호. 현재 페이지는 회색으로 강조하고 링크를 제거.
			for (int i = startPage; i <= endPage; i++) {
				if (i > totalNum) {
					break;
				}

				if (i == currentPage) {
					pagingHtml.append("&nbsp;<strong> <font color='gray'>");
					pagingHtml.append(i);
					pagingHtml.append("</font></strong>");
				} else {
					pagingHtml.append("&nbsp;<a href=\"memberinfo.js?page=" + i + "\">");
					pagingHtml.append(i);
					pagingHtml.append("</a>");
				}
				pagingHtml.append("&nbsp;");
			}
			pagingHtml.append("&nbsp;&nbsp;|&nbsp;&nbsp;");
			// 다음 block 페이지
			if (totalNum - startPage >= showPageLimit) {
				pagingHtml.append("<a href=\"memberinfo.js?page=" + (endPage + 1) + "\">");
				pagingHtml.append("다음");
				pagingHtml.append("</a>");
			}
		} else {
			if (currentPage > showPageLimit) {
				pagingHtml.append("<span><a href=\"memberinfo.js?page=" + (startPage - 1) + "&type=" + type + "&keyword=" + keyword + "\">");
				pagingHtml.append("이전");
				pagingHtml.append("</a>");
			}
			pagingHtml.append("&nbsp;|&nbsp;");
			// 페이지 번호. 현재 페이지는 회색으로 강조하고 링크를 제거.
			for (int i = startPage; i <= endPage; i++) {
				if (i > totalNum) {
					break;
				}
				if (i == currentPage) {
					pagingHtml.append("&nbsp;<strong> <font color='gray'>");
					pagingHtml.append(i);
					pagingHtml.append("</font></strong>");
				} else {
					pagingHtml.append("&nbsp;<a href=\"memberinfo.js?page="+i + "&type=" + type + "&keyword=" + keyword + "\">");
					pagingHtml.append(i);
					pagingHtml.append("</a>");
				}
				pagingHtml.append("&nbsp;");
			}
			pagingHtml.append("&nbsp;&nbsp;|&nbsp;&nbsp;");
			// 다음 block 페이지
			if (totalNum - startPage >= showPageLimit) {
				pagingHtml.append("<a href=\"memberinfo.js?page=" + (endPage + 1) + "&type=" + type + "&keyword=" + keyword + "\">");
				pagingHtml.append("다음");
				pagingHtml.append("</a>");
			}		
		}
		return pagingHtml;
	}

	public MemberVo getMemberview(Model model, String userid) {
		int qnacount = dao.qnacount(userid);
		model.addAttribute("qnacount", qnacount);
		return dao.getMemberview(userid);
	}

	public int idcheck(String userid) {
		return dao.idcheck(userid);
	}

	public MemberVo getUpdatemyinfo(HttpSession session, String passwd) {
		MemberVo membervo=null;
		String userid = (String) session.getAttribute("userid");
		String loginPass = dao.login(userid);
		if (loginPass != null) {
			if (loginPass.equals(passwd)){
				membervo = dao.findUser(userid);
			}
		}
		return membervo;
	}
	
	public MemberVo myinfo(HttpSession session) {
		MemberVo membervo=null;
		String userid = (String) session.getAttribute("userid");
		membervo = dao.findUser(userid);
		return membervo;
	}

	public int updatemyinfo(MemberVo vo){
		int result = -1;
		if(vo.getMail()!=null){
			result = dao.updatemyinfo(vo);
		}
		else{
			result = dao.updatemyinfo2(vo);
		}
		return result;
	}

	public int deletemyinfo(HttpSession session,String passwd) {
		String userid = (String) session.getAttribute("userid");
		String loginPass = dao.login(userid);
		int result = -1;
		if (loginPass != null) {
			if (loginPass.equals(passwd)){
				result = dao.deletemyinfo(userid);
			}
		}
		return result;
	}

	public String findid(MemberVo vo) {
		return dao.findid(vo);
	}

	public String findpw(Model model,MemberVo vo) {
		String usernewpasswd = null;
		String userid = dao.findpw(vo);
		vo.setUserid(userid);
		if(userid != null){
			long passwdlong = new Date().getTime();
			String passwd = Long.toString(passwdlong);
			vo.setPasswd(passwd);
			int result = dao.setnewpw(vo);
			if(result>0){
				usernewpasswd = dao.getnewpw(userid);	
			}
			model.addAttribute("usernewpasswd", usernewpasswd);
		}
		return usernewpasswd;
	}

	public MemberVo getMemberupdate(String userid) {
		MemberVo membervo = dao.findUser(userid);
		return membervo;
	}

	public int deletemember(String userid) {
		return dao.deletemyinfo(userid);
	}

	public int addmemberagain(String userid) {
		return dao.addmemberagain(userid);
	}

	public int deleteinfo(String userid) {
		int result = -1;
		result = dao.deleteuserqna(userid);
		if(result>-1){
			result = dao.deleteinfo(userid);
		}
		return result;
	}

}
