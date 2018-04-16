package com.cafeJo.heeJ.notice;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.cafeJo.heeJ.menu.MenuVo;


@Controller
public class NoticeController {
	private NoticeService noticeService;

	public void setNoticeService(NoticeService noticeService) {
		this.noticeService = noticeService;
	}
	
	@RequestMapping("/")
	public ModelAndView getIndex(Model model,HttpServletRequest request) {
		return noticeService.getNotice2(request);
	}
	@RequestMapping("/index.do")
	public ModelAndView getIndex2(Model model,HttpServletRequest request){/*(Model model, HttpSession session) {
		String username = memberService.findUsername(session);
		model.addAttribute("username", username);*/
		return noticeService.getNotice2(request);
	}
	
	@RequestMapping("/customer/notice.js")
	public ModelAndView getNotice(HttpServletRequest request){
		return noticeService.getNotice(request);
	}
	@RequestMapping("/customer/addnotice.js")
	public String getAddnotice(Model model, NoticeVo vo){
		return "customer/addnotice";
	}
	@RequestMapping("/customer/addnotice.do")
	public String addnotice(Model model, NoticeVo vo){
		int result = -1;
		result = noticeService.addnotice(vo);
		if(result>0){
			return "redirect:/customer/noticeview.js?page=1&nnum="+result;
		}
		return "customer/addnotice";
	}
	@RequestMapping("/customer/noticeview.js")
	public String getNoticeview(Model model, int nnum){
		NoticeVo noticevo = noticeService.getNoticeview(nnum);
		model.addAttribute("noticevo", noticevo);
		return "customer/noticeview";
	}
	@RequestMapping("/customer/updatenotice.js")
	public String getUpdatenotice(Model model, int nnum){
		NoticeVo noticevo = noticeService.getNoticeview(nnum);
		model.addAttribute("noticevo", noticevo);
		return "customer/updatenotice";
	}
	@RequestMapping("/customer/updatenotice.do")
	public String updatenotice(Model model, NoticeVo vo, int page){
		int result = -1;
		result = noticeService.updatenotice(vo);
		if(result>0){
			return "redirect:/customer/noticeview.js?page="+page+"&nnum="+vo.getNnum();
		}
		return "redirect:/customer/updatenotice.js?nnum="+vo.getNnum()+"&page="+page;
	}
	@RequestMapping("/customer/deletenotice.do")
	public String deletenotice(Model model, int nnum, int page){
		int result = -1;
		result = noticeService.deletenotice(nnum);
		if(result>0){
			return "redirect:/customer/notice.js?page="+page;
		}
		return "redirect:/customer/noticeview.js?page="+page+"&nnum="+nnum;
	}
}
