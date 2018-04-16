package com.cafeJo.heeJ.event;

import java.io.File;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.cafeJo.heeJ.member.MemberVo;
import com.cafeJo.heeJ.event.EventVo;


public class EventService {
	private EventDao dao;

	public void setDao(EventDao dao) {
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
	
	public ModelAndView getEvent(HttpServletRequest request){
		
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
			
		// get eventlist and get page html code
		List<EventVo> eventlist;
		int realTotalNum = dao.getEventTotalNum();
		if(type != null && keyword != null){
			eventlist = dao.getSearchEvent(type, keyword, startArticleNum, endArticleNum);
			totalNum = dao.getSearchEventTotalNum(type, keyword);
		} else {
			eventlist = dao.getEventList(startArticleNum, endArticleNum);
			totalNum = dao.getEventTotalNum();
		}
		String kind = "event";
		StringBuffer pageHtml = getPageHtml(currentPage, totalNum, showArticleLimit, showPageLimit, type, keyword,kind);
		

		ModelAndView mav = new ModelAndView();
		mav.addObject("eventlist", eventlist);
		mav.addObject("pageHtml", pageHtml);
		mav.addObject("realTotalNum", realTotalNum);
		mav.addObject("currentPage", currentPage);
		mav.setViewName("/customer/event");
		
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
	
	public EventVo getEventview(int eventnum) {
		int result = dao.eventhitup(eventnum);
		return dao.getEventview(eventnum);
	}
	public int addevent(EventVo vo, MultipartHttpServletRequest request) {
		// file upload path
		String uploadPath = request.getServletContext().getRealPath("resources/upload/event");
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
		String content =  vo.getEcontent().replaceAll("\r\n", "<br />");		
		vo.setEcontent(content);
		int result  = dao.addevent(vo);
		int result2 = -1;
		if(result>0){
			result2  = dao.maxeventnum();
		}
		return result2;
	}

	public int updateevent(EventVo vo, MultipartHttpServletRequest request, String beforefile) {
		// file upload path
		String uploadPath = request.getServletContext().getRealPath("resources/upload/event");
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
		String content =  vo.getEcontent().replaceAll("\r\n", "<br />");		
		vo.setEcontent(content);
		int result  = -1;
		result = dao.updateevent(vo);
		return result;
	}

	public int deleteevent(int eventnum, MultipartHttpServletRequest request) {
		dao.deleteeventmember(eventnum);
		String uploadPath = request.getServletContext().getRealPath("resources/upload/event");
		
		String filename  = dao.getEventview(eventnum).getFilename();
		if(filename != null || !filename.equals("")){
			// remove uploaded file
			File removeFile = new File(uploadPath+"/"+filename);
			removeFile.delete();
		}
		return dao.deleteevent(eventnum);
	}

	public MemberVo getUserinfo(String userid) {
		return dao.getUserinfo(userid);
	}

	public int event(MemberVo memberVo, int eventnum) {
		EventmemberVo eventmemberVo = new EventmemberVo(memberVo.getUserid(),memberVo.getUsername(),memberVo.getHp(),memberVo.getMail(),eventnum);
		if(eventmemberVo.getMail()==null){
			eventmemberVo.setMail("");
		}
		dao.eventdo(eventmemberVo);
		int result = dao.eventnowcountup(eventnum);
		
		if((Integer)dao.getEventcount(eventnum)!=0&&(Integer)dao.getEventnowcount(eventnum)>=(Integer)dao.getEventcount(eventnum)){
			dao.updateEventfinish(eventnum);
		}
		return result;
	}

	public int eventcheck(String userid, int eventnum) {
		EventmemberVo eventmemberVo = new EventmemberVo(userid,eventnum);
		return dao.eventcheck(eventmemberVo);
	}

	public String getEventfinish(int eventnum) {
		return dao.getEventfinish(eventnum);
	}

	public ModelAndView getMyevent(HttpServletRequest request, HttpSession session) {
		
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
		//
			
		// expression article variables value
		startArticleNum = (currentPage - 1) * showArticleLimit + 1;
		endArticleNum = startArticleNum + showArticleLimit -1;
		
		String userid=(String) session.getAttribute("userid");
		// get myeventlist and get page html code
		List<EventmemberVo> myeventlist;
		int realTotalNum = dao.getMyeventTotalNum(userid);
		if(type != null && keyword != null){
			myeventlist = dao.getSearchMyevent(type, keyword, startArticleNum, endArticleNum,userid);
			totalNum = dao.getSearchMyeventTotalNum(type, keyword,userid);
		} else {
			myeventlist = dao.getMyeventList(startArticleNum, endArticleNum,userid);
			totalNum = dao.getMyeventTotalNum(userid);
		}
		
		String kind = "myevent";
		StringBuffer pageHtml = getPageHtml(currentPage, totalNum, showArticleLimit, showPageLimit, type, keyword,kind);
		//System.out.println(myeventlist);
		for(int i=0;i<myeventlist.size();i++){
			String etitle = dao.getEtitle(myeventlist.get(i).getEventnum());
			myeventlist.get(i).setEtitle(etitle);
		}
		ModelAndView mav = new ModelAndView();
		mav.addObject("myeventlist", myeventlist);
		mav.addObject("pageHtml", pageHtml);
		mav.addObject("realTotalNum", realTotalNum);
		mav.addObject("currentPage", currentPage);
		mav.setViewName("/member/myevent");
		
		return mav;
	}

	public ModelAndView getEventmember(HttpServletRequest request) {
			
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
		//

		// expression article variables value
		startArticleNum = (currentPage - 1) * showArticleLimit + 1;
		endArticleNum = startArticleNum + showArticleLimit -1;
		
		// get eventmemberlist and get page html code
		List<EventmemberVo> eventmemberlist;
		int realTotalNum = dao.getEventmemberTotalNum();
		if(type != null && keyword != null){
			eventmemberlist = dao.getSearchEventmember(type, keyword, startArticleNum, endArticleNum);
			totalNum = dao.getSearchEventmemberTotalNum(type, keyword);
		} else {
			eventmemberlist = dao.getEventmemberList(startArticleNum, endArticleNum);
			totalNum = dao.getEventmemberTotalNum();
		}
		String kind = "eventmember";
		StringBuffer pageHtml = getPageHtml(currentPage, totalNum, showArticleLimit, showPageLimit, type, keyword,kind);
		
		for(int i=0;i<eventmemberlist.size();i++){
			String etitle = dao.getEtitle(eventmemberlist.get(i).getEventnum());
			eventmemberlist.get(i).setEtitle(etitle);
		}
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("eventmemberlist", eventmemberlist);
		mav.addObject("pageHtml", pageHtml);
		mav.addObject("realTotalNum", realTotalNum);
		mav.addObject("currentPage", currentPage);
		mav.setViewName("/customer/eventmember");
		
		return mav;
	}
}
