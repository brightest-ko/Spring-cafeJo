package com.cafeJo.heeJ.menu;

import java.io.File;
import java.io.UnsupportedEncodingException;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

public class MenuService {
	private MenuDao dao;

	public void setDao(MenuDao dao) {
		this.dao = dao;
	}

	public int addmenu(MenuVo vo, MultipartHttpServletRequest request) {
		// file upload path
		String uploadPath = request.getServletContext().getRealPath("resources/upload/menu");
		//String uploadPath = "C:/files/";
		System.out.println(uploadPath);
		
		MultipartFile file = request.getFile("file");
		String fileName = file.getOriginalFilename();
		
		
		File uploadFile = null;
		//System.out.println(uploadFile);
		// when file exists as same name
		if(!fileName.equals("")&&fileName!=null){
			fileName = new Date().getTime() + fileName;
			uploadFile = new File(uploadPath +"/"+fileName);
		}
		
		// save upload file to uploadPath
		try {
			file.transferTo(uploadFile);
		} catch (Exception e) {
			
		}
		vo.setFilename(fileName);
		String content =  vo.getDescription().replaceAll("\r\n", "<br />");		
		vo.setDescription(content);
		return dao.addmenu(vo);
	}

	
	// * User variable
	// article, page variables
	private int currentPage = 1;
	private int showArticleLimit = 12; // change value if want to show more articles by one page
	private int showPageLimit = 5; // change value if want to show more page links
	private int startArticleNum = 0;
	private int endArticleNum = 0;
	private int totalNum = 0;
	public ModelAndView getCoffee(HttpServletRequest request) {
		
		String type = "menuname"; //검색할 조건이 많아지면 null로 바꿔주기
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
		
		// get coffeelist and get page html code
		List<MenuVo> coffeelist;
		int realTotalNum = dao.getCoffeeTotalNum();
		if(type != null && keyword != null){
			coffeelist = dao.getSearchCoffee(type, keyword, startArticleNum, endArticleNum);
			totalNum = dao.getSearchCoffeeTotalNum(type, keyword);
		} else {
			coffeelist = dao.getCoffeeList(startArticleNum, endArticleNum);
			totalNum = dao.getCoffeeTotalNum();
		}
		String menukind = "coffee";
		StringBuffer pageHtml = getPageHtml(currentPage, totalNum, showArticleLimit, showPageLimit, type, keyword,menukind);
		//
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("coffeelist", coffeelist);
		mav.addObject("pageHtml", pageHtml);
		mav.addObject("realTotalNum", realTotalNum);
		mav.addObject("currentPage", currentPage);
		mav.setViewName("/menu/coffee");
		
		return mav;
	}
	
	public ModelAndView getBeverage(HttpServletRequest request) {
		
		String type = "menuname"; //검색할 조건이 많아지면 null로 바꿔주기
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
		
		// get beveragelist and get page html code
		List<MenuVo> beveragelist;
		int realTotalNum = dao.getBeverageTotalNum();
		if(type != null && keyword != null){
			beveragelist = dao.getSearchBeverage(type, keyword, startArticleNum, endArticleNum);
			totalNum = dao.getSearchBeverageTotalNum(type, keyword);
		} else {
			beveragelist = dao.getBeverageList(startArticleNum, endArticleNum);
			totalNum = dao.getBeverageTotalNum();
		}
		String menukind = "beverage";
		StringBuffer pageHtml = getPageHtml(currentPage, totalNum, showArticleLimit, showPageLimit, type, keyword,menukind);
		//
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("beveragelist", beveragelist);
		mav.addObject("pageHtml", pageHtml);
		mav.addObject("realTotalNum", realTotalNum);
		mav.addObject("currentPage", currentPage);
		mav.setViewName("/menu/beverage");
		
		return mav;
	}
	
	public ModelAndView getDessert(HttpServletRequest request) {
		
		String type = "menuname"; //검색할 조건이 많아지면 null로 바꿔주기
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
		
		// get dessertlist and get page html code
		List<MenuVo> dessertlist;
		int realTotalNum = dao.getDessertTotalNum();
		if(type != null && keyword != null){
			dessertlist = dao.getSearchDessert(type, keyword, startArticleNum, endArticleNum);
			totalNum = dao.getSearchDessertTotalNum(type, keyword);
		} else {
			dessertlist = dao.getDessertList(startArticleNum, endArticleNum);
			totalNum = dao.getDessertTotalNum();
		}
		String menukind = "dessert";
		StringBuffer pageHtml = getPageHtml(currentPage, totalNum, showArticleLimit, showPageLimit, type, keyword,menukind);
		//
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("dessertlist", dessertlist);
		mav.addObject("pageHtml", pageHtml);
		mav.addObject("realTotalNum", realTotalNum);
		mav.addObject("currentPage", currentPage);
		mav.setViewName("/menu/dessert");
		
		return mav;
	}
	public ModelAndView getDelhi(HttpServletRequest request) {
		
		String type = "menuname"; //검색할 조건이 많아지면 null로 바꿔주기
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
		System.out.println("startArticleNum : "+startArticleNum);
		endArticleNum = startArticleNum + showArticleLimit -1;
		System.out.println("endArticleNum : "+endArticleNum);
		
		// get delhilist and get page html code
		List<MenuVo> delhilist;
		int realTotalNum = dao.getDessertTotalNum();
		if(type != null && keyword != null){
			delhilist = dao.getSearchDessert(type, keyword, startArticleNum, endArticleNum);
			totalNum = dao.getSearchDessertTotalNum(type, keyword);
		} else {
			delhilist = dao.getDessertList(startArticleNum, endArticleNum);
			totalNum = dao.getDessertTotalNum();
		}
		String menukind = "delhi";
		StringBuffer pageHtml = getPageHtml(currentPage, totalNum, showArticleLimit, showPageLimit, type, keyword,menukind);
		//
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("delhilist", delhilist);
		mav.addObject("pageHtml", pageHtml);
		mav.addObject("realTotalNum", realTotalNum);
		mav.addObject("currentPage", currentPage);
		mav.setViewName("/menu/delhi");
		
		return mav;
	}
	public ModelAndView getMd(HttpServletRequest request) {
		
		String type = "menuname"; //검색할 조건이 많아지면 null로 바꿔주기
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
		
		// get mdlist and get page html code
		List<MenuVo> mdlist;
		int realTotalNum = dao.getDessertTotalNum();
		if(type != null && keyword != null){
			mdlist = dao.getSearchDessert(type, keyword, startArticleNum, endArticleNum);
			totalNum = dao.getSearchDessertTotalNum(type, keyword);
		} else {
			mdlist = dao.getDessertList(startArticleNum, endArticleNum);
			totalNum = dao.getDessertTotalNum();
		}
		String menukind = "md";
		StringBuffer pageHtml = getPageHtml(currentPage, totalNum, showArticleLimit, showPageLimit, type, keyword,menukind);
		//
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("mdlist", mdlist);
		mav.addObject("pageHtml", pageHtml);
		mav.addObject("realTotalNum", realTotalNum);
		mav.addObject("currentPage", currentPage);
		mav.setViewName("/menu/md");
		
		return mav;
	}
	
	public StringBuffer getPageHtml(int currentPage, int totalNum, int showArticleLimit, int showPageLimit, String type, String keyword,String menukind) {
		
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
				pagingHtml.append("<span><a href=\""+menukind+".js?page=" + (startPage - 1) + "\">");
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
					pagingHtml.append("&nbsp;<a href=\""+menukind+".js?page=" + i + "\">");
					pagingHtml.append(i);
					pagingHtml.append("</a>");
				}
				pagingHtml.append("&nbsp;");
			}
			pagingHtml.append("&nbsp;&nbsp;|&nbsp;&nbsp;");
			// 다음 block 페이지
			if (totalNum - startPage >= showPageLimit) {
				pagingHtml.append("<a href=\""+menukind+".js?page=" + (endPage + 1) + "\">");
				pagingHtml.append("다음");
				pagingHtml.append("</a>");
			}
		} else {
			if (currentPage > showPageLimit) {
				pagingHtml.append("<span><a href=\""+menukind+".js?page=" + (startPage - 1) + "&type=" + type + "&keyword=" + keyword + "\">");
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
					pagingHtml.append("&nbsp;<a href=\""+menukind+".js?page="+i + "&type=" + type + "&keyword=" + keyword + "\">");
					pagingHtml.append(i);
					pagingHtml.append("</a>");
				}
				pagingHtml.append("&nbsp;");
			}
			pagingHtml.append("&nbsp;&nbsp;|&nbsp;&nbsp;");
			// 다음 block 페이지
			if (totalNum - startPage >= showPageLimit) {
				pagingHtml.append("<a href=\""+menukind+".js?page=" + (endPage + 1) + "&type=" + type + "&keyword=" + keyword + "\">");
				pagingHtml.append("다음");
				pagingHtml.append("</a>");
			}		
		}
		return pagingHtml;
	}

	public MenuVo getMenuview(int num) {
		return dao.getMenuview(num);
	}

	public int updatemenu(MenuVo vo, MultipartHttpServletRequest request,String beforefile) {
		// file upload path
		String uploadPath = request.getServletContext().getRealPath("resources/upload/menu");
		//String uploadPath = "C:/files/";
		System.out.println(uploadPath);
		MultipartFile file = request.getFile("file");
		String fileName = file.getOriginalFilename();
		
		
		File uploadFile = null;
		//System.out.println(uploadFile);
		// when file exists as same name
		if(!fileName.equals("")&&fileName!=null){
			if(beforefile != null || !beforefile.equals("")){
				// remove uploaded file
				File removeFile = new File(uploadPath+"/"+beforefile);
				removeFile.delete();
			}
			fileName = new Date().getTime() + fileName;
			uploadFile = new File(uploadPath +"/"+fileName);
			// save upload file to uploadPath
			try {
				file.transferTo(uploadFile);
			} catch (Exception e) {
				System.out.println("error");
			}
		}else{
			fileName = beforefile;			
		}

		vo.setFilename(fileName);		
		String content =  vo.getDescription().replaceAll("\r\n", "<br />");		
		vo.setDescription(content);
		int result  = -1;
		result = dao.updatemenu(vo);
		return result;
	}

	public int deletemenu(int num, MultipartHttpServletRequest request) {
		String uploadPath = request.getServletContext().getRealPath("resources/upload/menu");
		
		String filename  = dao.getMenuview(num).getFilename();
		if(filename != null || !filename.equals("")){
			// remove uploaded file
			File removeFile = new File(uploadPath+"/"+filename);
			removeFile.delete();
		}
		return dao.deletemenu(num);
	}

}
