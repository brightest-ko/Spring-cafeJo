package com.cafeJo.heeJ.store;

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


public class StoreService {
	private StoreDao dao;

	public void setDao(StoreDao dao) {
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
	
	public ModelAndView getStore(HttpServletRequest request){
		
		String type = null;
		String keyword = null;
		String doadress = null;
		String gooadress = null;
		// set variables from request parameter
		if(request.getParameter("page") == null || request.getParameter("page").trim().isEmpty() || request.getParameter("page").equals("0")) {
			currentPage = 1;
		} else {
			currentPage = Integer.parseInt(request.getParameter("page"));
		}
		
		if(request.getParameter("type") != null){
			type = request.getParameter("type").trim();
			System.out.println(type);
		}

		if(request.getParameter("keyword") != null){
			keyword = request.getParameter("keyword").trim();
			System.out.println(keyword);
		}
		if(request.getParameter("doadress") != null){
			doadress = request.getParameter("doadress").trim();
			System.out.println(doadress);
		}
		if(request.getParameter("gooadress") != null){
			gooadress = request.getParameter("gooadress").trim();
			System.out.println(gooadress);
		}
		
		// expression article variables value
		startArticleNum = (currentPage - 1) * showArticleLimit + 1;
		endArticleNum = startArticleNum + showArticleLimit -1;
		
		// get storelist and get page html code
		List<StoreVo> storelist;
		int realTotalNum = dao.getStoreTotalNum();
		if(type != null && keyword != null){
			storelist = dao.getSearchStore(type, keyword,doadress,gooadress, startArticleNum, endArticleNum);
			totalNum = dao.getSearchStoreTotalNum(type, keyword);
		} else {
			storelist = dao.getStoreList(startArticleNum, endArticleNum);
			totalNum = dao.getStoreTotalNum();
		}
		StringBuffer pageHtml = getPageHtml(currentPage, totalNum, showArticleLimit, showPageLimit, type, keyword);
		ModelAndView mav = new ModelAndView();
		mav.addObject("storelist", storelist);
		mav.addObject("pageHtml", pageHtml);
		mav.addObject("realTotalNum", realTotalNum);
		mav.addObject("currentPage", currentPage);
		mav.setViewName("/brand/store");
		
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
				pagingHtml.append("<span><a href=\"store.js?page=" + (startPage - 1) + "\">");
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
					pagingHtml.append("&nbsp;<a href=\"store.js?page=" + i + "\">");
					pagingHtml.append(i);
					pagingHtml.append("</a>");
				}
				pagingHtml.append("&nbsp;");
			}
			pagingHtml.append("&nbsp;&nbsp;|&nbsp;&nbsp;");
			// 다음 block 페이지
			if (totalNum - startPage >= showPageLimit) {
				pagingHtml.append("<a href=\"store.js?page=" + (endPage + 1) + "\">");
				pagingHtml.append("다음");
				pagingHtml.append("</a>");
			}
		} else {
			if (currentPage > showPageLimit) {
				pagingHtml.append("<span><a href=\"store.js?page=" + (startPage - 1) + "&type=" + type + "&keyword=" + keyword + "\">");
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
					pagingHtml.append("&nbsp;<a href=\"store.js?page="+i + "&type=" + type + "&keyword=" + keyword + "\">");
					pagingHtml.append(i);
					pagingHtml.append("</a>");
				}
				pagingHtml.append("&nbsp;");
			}
			pagingHtml.append("&nbsp;&nbsp;|&nbsp;&nbsp;");
			// 다음 block 페이지
			if (totalNum - startPage >= showPageLimit) {
				pagingHtml.append("<a href=\"store.js?page=" + (endPage + 1) + "&type=" + type + "&keyword=" + keyword + "\">");
				pagingHtml.append("다음");
				pagingHtml.append("</a>");
			}		
		}
		return pagingHtml;
	}
	public StoreVo getStoreview(int storenum) {
		return dao.getStoreview(storenum);
	}
	public int addstore(StoreVo vo) {
		String content =  vo.getStoremore ().replaceAll("\r\n", "<br />");		
		vo.setStoremore(content);
		int result  = dao.addstore(vo);
		int result2 = -1;
		if(result>0){
			result2  = dao.maxstorenum();
		}
		return result2;
	}

	public int updatestore(StoreVo vo) {
		String content =  vo.getStoremore ().replaceAll("\r\n", "<br />");		
		vo.setStoremore (content);
		int result  = -1;
		result = dao.updatestore(vo);
		return result;
	}

	public int deletestore(int storenum) {
		return dao.deletestore(storenum);
	}
}
