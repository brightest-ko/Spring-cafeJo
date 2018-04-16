package com.cafeJo.heeJ.qna;

import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.cafeJo.heeJ.member.MemberVo;


public class QnaService {
	private QnaDao dao;

	public void setDao(QnaDao dao) {
		this.dao = dao;
	}
	
	public MemberVo getMemberInfo(HttpSession session) {
		MemberVo vo = null;
		String userid = (String) session.getAttribute("userid");
		if(userid!=null&&!userid.equals("")){
			vo = dao.getMemberInfo(userid);
		}
		return vo;
	}
	
	public int addqna(QnaVo vo) {
		String content =  vo.getQcontent().replaceAll("\r\n", "<br />");		
		vo.setQcontent(content);
		int result  = dao.addqna(vo);
		int maxqnum = -1;
		if(result>0){
			maxqnum  = dao.maxqnum();
			dao.insertqref(maxqnum);
		}
		return maxqnum;
	}

	public QnaVo getQnaview(int qnum) {
		return dao.getQnaview(qnum);
	}

	// article, page variables
	private int currentPage = 1;
	private int showArticleLimit = 10; // change value if want to show more articles by one page
	private int showPageLimit = 5; // change value if want to show more page links
	private int startArticleNum = 0;
	private int endArticleNum = 0;
	private int totalNum = 0;
	
	public ModelAndView getQna(HttpServletRequest request){
		
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
			if(type.equals("qreply")){
				if(keyword.equals("y")||keyword.equals("Y")){
				keyword = "yes";}
				if(keyword.equals("n")||keyword.equals("N")){
				keyword = "no";}
			}
		}
			
		// expression article variables value
		startArticleNum = (currentPage - 1) * showArticleLimit + 1;
		endArticleNum = startArticleNum + showArticleLimit -1;
		
		// get qnalist and get page html code
		List<QnaVo> qnalist;
		int realTotalNum = dao.getQnaTotalNum();
		if(type != null && keyword != null){
			qnalist = dao.getSearchQna(type, keyword, startArticleNum, endArticleNum);
			totalNum = dao.getSearchQnaTotalNum(type, keyword);
		} else {
			qnalist = dao.getQnaList(startArticleNum, endArticleNum);
			totalNum = dao.getQnaTotalNum();
		}

		String kind = "qna";
		StringBuffer pageHtml = getPageHtml(currentPage, totalNum, showArticleLimit, showPageLimit, type, keyword,kind);
		ModelAndView mav = new ModelAndView();
		mav.addObject("qnalist", qnalist);
		mav.addObject("pageHtml", pageHtml);
		mav.addObject("realTotalNum", realTotalNum);
		mav.addObject("currentPage", currentPage);
		mav.setViewName("/franchise/qna");
		
		return mav;
	}
	public ModelAndView getMyqna(HttpServletRequest request, HttpSession session){
		
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
			if(type.equals("qreply")&&keyword.equals("y")){
				keyword = "yes";
			}
		}
			
		// expression article variables value
		startArticleNum = (currentPage - 1) * showArticleLimit + 1;
		endArticleNum = startArticleNum + showArticleLimit -1;
		
		String userid=(String) session.getAttribute("userid");
		// get myqnalist and get page html code
		List<QnaVo> myqnalist;
		int realTotalNum = dao.getMyqnaTotalNum(userid);
		if(type != null && keyword != null){
			myqnalist = dao.getSearchMyqna(type, keyword, startArticleNum, endArticleNum,userid);
			totalNum = dao.getSearchMyqnaTotalNum(type, keyword,userid);
		} else {
			myqnalist = dao.getMyqnaList(startArticleNum, endArticleNum,userid);
			totalNum = dao.getMyqnaTotalNum(userid);
		}
		
		String kind = "myqna";
		StringBuffer pageHtml = getPageHtml(currentPage, totalNum, showArticleLimit, showPageLimit, type, keyword,kind);
		ModelAndView mav = new ModelAndView();
		mav.addObject("myqnalist", myqnalist);
		mav.addObject("pageHtml", pageHtml);
		mav.addObject("realTotalNum", realTotalNum);
		mav.addObject("currentPage", currentPage);
		mav.setViewName("/member/myqna");
		
		return mav;
	}
	
	public StringBuffer getPageHtml(int currentPage, int totalNum, int showArticleLimit, int showPageLimit, String type, String keyword,String kind) {
		
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
				pagingHtml.append("<span><a href=\""+kind+".js?page=" + (startPage - 1) + "\">");
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
					pagingHtml.append("&nbsp;<a href=\""+kind+".js?page=" + i + "\">");
					pagingHtml.append(i);
					pagingHtml.append("</a>");
				}
				pagingHtml.append("&nbsp;");
			}
			pagingHtml.append("&nbsp;&nbsp;|&nbsp;&nbsp;");
			// 다음 block 페이지
			if (totalNum - startPage >= showPageLimit) {
				pagingHtml.append("<a href=\""+kind+".js?page=" + (endPage + 1) + "\">");
				pagingHtml.append("다음");
				pagingHtml.append("</a>");
			}
		} else {
			if (currentPage > showPageLimit) {
				pagingHtml.append("<span><a href=\""+kind+".js?page=" + (startPage - 1) + "&type=" + type + "&keyword=" + keyword + "\">");
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
					pagingHtml.append("&nbsp;<a href=\""+kind+".js?page="+i + "&type=" + type + "&keyword=" + keyword + "\">");
					pagingHtml.append(i);
					pagingHtml.append("</a>");
				}
				pagingHtml.append("&nbsp;");
			}
			pagingHtml.append("&nbsp;&nbsp;|&nbsp;&nbsp;");
			// 다음 block 페이지
			if (totalNum - startPage >= showPageLimit) {
				pagingHtml.append("<a href=\""+kind+".js?page=" + (endPage + 1) + "&type=" + type + "&keyword=" + keyword + "\">");
				pagingHtml.append("다음");
				pagingHtml.append("</a>");
			}		
		}
		return pagingHtml;
	}

	public int deleteqna(int qnum) {
		return dao.deleteqna(qnum);
	}

	public int updateqna(QnaVo vo) {
		String content =  vo.getQcontent().replaceAll("\r\n", "<br />");		
		vo.setQcontent(content);
		int result  = -1;
		result = dao.updateqna(vo);
		return result;
	}

	public int addadminqna(QnaVo vo) {
		int qnum = vo.getQref();
		String qrefid = dao.getQnaview(qnum).getUserid();
		vo.setQrefid(qrefid);
		
		String content =  vo.getQcontent().replaceAll("\r\n", "<br />");		
		vo.setQcontent(content);
		int result  = dao.addadminqna(vo);
		int maxqnum = -1;
		if(result>0){
			result=dao.yesreply(vo.getQref());
			if(result>0){
			maxqnum  = dao.maxqnum();
			}
		}
		return maxqnum;
	}
}
