package com.cafeJo.heeJ.notice;

import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;


public class NoticeService {
	private NoticeDao dao;

	public void setDao(NoticeDao dao) {
		this.dao = dao;
	}
	
	// * User variable
	// article, page variables
	private int currentPage = 1;
	private int showArticleLimit = 10; // change value if want to show more articles by one page
	private int showPageLimit = 5; // change value if want to show more page links
	private int startArticleNum = 0;
	private int endArticleNum = 0;
	private int totalNum = 0;
	
	public ModelAndView getNotice(HttpServletRequest request){
		showArticleLimit = 10;		
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
		}
		
		// expression article variables value
		startArticleNum = (currentPage - 1) * showArticleLimit + 1;
		endArticleNum = startArticleNum + showArticleLimit -1;
		
		// get noticelist and get page html code
		List<NoticeVo> noticelist;
		int realTotalNum = dao.getNoticeTotalNum();
		if(type != null && keyword != null){
			noticelist = dao.getSearchNotice(type, keyword, startArticleNum, endArticleNum);
			totalNum = dao.getSearchNoticeTotalNum(type, keyword);
		} else {
			noticelist = dao.getNoticeList(startArticleNum, endArticleNum);
			totalNum = dao.getNoticeTotalNum();
		}
		StringBuffer pageHtml = getPageHtml(currentPage, totalNum, showArticleLimit, showPageLimit, type, keyword);
		ModelAndView mav = new ModelAndView();
		mav.addObject("noticelist", noticelist);
		mav.addObject("pageHtml", pageHtml);
		mav.addObject("realTotalNum", realTotalNum);
		mav.addObject("currentPage", currentPage);
		mav.setViewName("/customer/notice");
		
		return mav;
	}
	public ModelAndView getNotice2(HttpServletRequest request){
		showArticleLimit = 5;
		ModelAndView mav = new ModelAndView();		
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
			mav.addObject("keyword", keyword);
			mav.setViewName("redirect:/menu/"+type+".js");
			return mav;		
		}
		
		// expression article variables value
		startArticleNum = (currentPage - 1) * showArticleLimit + 1;
		endArticleNum = startArticleNum + showArticleLimit -1;
		
		// get noticelist and get page html code
		List<NoticeVo> noticelist;
		int realTotalNum = dao.getNoticeTotalNum();
		if(type != null && keyword != null){
			noticelist = dao.getSearchNotice(type, keyword, startArticleNum, endArticleNum);
			totalNum = dao.getSearchNoticeTotalNum(type, keyword);
		} else {
			noticelist = dao.getNoticeList(startArticleNum, endArticleNum);
			totalNum = dao.getNoticeTotalNum();
		}
		StringBuffer pageHtml = getPageHtml(currentPage, totalNum, showArticleLimit, showPageLimit, type, keyword);

		mav.addObject("noticelist", noticelist);
		mav.addObject("pageHtml", pageHtml);
		mav.addObject("realTotalNum", realTotalNum);
		mav.addObject("currentPage", currentPage);
		mav.setViewName("/index");
		
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
				pagingHtml.append("<span><a href=\"notice.js?page=" + (startPage - 1) + "\">");
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
					pagingHtml.append("&nbsp;<a href=\"notice.js?page=" + i + "\">");
					pagingHtml.append(i);
					pagingHtml.append("</a>");
				}
				pagingHtml.append("&nbsp;");
			}
			pagingHtml.append("&nbsp;&nbsp;|&nbsp;&nbsp;");
			// 다음 block 페이지
			if (totalNum - startPage >= showPageLimit) {
				pagingHtml.append("<a href=\"notice.js?page=" + (endPage + 1) + "\">");
				pagingHtml.append("다음");
				pagingHtml.append("</a>");
			}
		} else {
			if (currentPage > showPageLimit) {
				pagingHtml.append("<span><a href=\"notice.js?page=" + (startPage - 1) + "&type=" + type + "&keyword=" + keyword + "\">");
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
					pagingHtml.append("&nbsp;<a href=\"notice.js?page="+i + "&type=" + type + "&keyword=" + keyword + "\">");
					pagingHtml.append(i);
					pagingHtml.append("</a>");
				}
				pagingHtml.append("&nbsp;");
			}
			pagingHtml.append("&nbsp;&nbsp;|&nbsp;&nbsp;");
			// 다음 block 페이지
			if (totalNum - startPage >= showPageLimit) {
				pagingHtml.append("<a href=\"notice.js?page=" + (endPage + 1) + "&type=" + type + "&keyword=" + keyword + "\">");
				pagingHtml.append("다음");
				pagingHtml.append("</a>");
			}		
		}
		return pagingHtml;
	}
	public NoticeVo getNoticeview(int nnum) {
		int result = dao.noticehitup(nnum);
		return dao.getNoticeview(nnum);
	}
	public int addnotice(NoticeVo vo) {
		String content =  vo.getNcontent().replaceAll("\r\n", "<br />");		
		vo.setNcontent(content);
		int result  = dao.addnotice(vo);
		int result2 = -1;
		if(result>0){
			result2  = dao.maxnnum();
		}
		return result2;
	}

	public int updatenotice(NoticeVo vo) {
		String content =  vo.getNcontent().replaceAll("\r\n", "<br />");		
		vo.setNcontent(content);
		int result  = -1;
		result = dao.updatenotice(vo);
		return result;
	}

	public int deletenotice(int nnum) {
		return dao.deletenotice(nnum);
	}
}
