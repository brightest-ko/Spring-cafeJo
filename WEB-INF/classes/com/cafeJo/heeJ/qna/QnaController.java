package com.cafeJo.heeJ.qna;

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

import com.cafeJo.heeJ.member.Member;
import com.cafeJo.heeJ.member.MemberVo;
import com.cafeJo.heeJ.menu.MenuVo;


@Controller
public class QnaController {
	private QnaService qnaService;

	public void setQnaService(QnaService qnaService) {
		this.qnaService = qnaService;
	}
	@RequestMapping("/franchise/faq.js")
	public String getFaq(Model model) {
		return "franchise/faq";
	}
	@RequestMapping("/franchise/info.js")
	public String getInfo(Model model) {
		return "franchise/info";
	}
	
	@RequestMapping("/franchise/qna.js")
	public ModelAndView getQna(HttpServletRequest request){
		return qnaService.getQna(request);
	}
	@RequestMapping("/franchise/addqna.js")
	public String getAddqna(Model model,HttpSession session) {
		MemberVo membervo = new MemberVo();
		membervo = qnaService.getMemberInfo(session);
		model.addAttribute("membervo", membervo);
		return "franchise/addqna";
	}
	@RequestMapping("/franchise/addqna.do")
	public String addqna(Model model, QnaVo vo){
		int result = -1;
		result = qnaService.addqna(vo);
		if(result>0){
			return "redirect:/franchise/qnaview.js?page=1&qnum="+result;
		}
		return "franchise/addqna";
	}
	@RequestMapping("/franchise/addadminqna.js")
	public String getAddadminqna(Model model,HttpSession session) {
		MemberVo membervo = new MemberVo();
		membervo = qnaService.getMemberInfo(session);
		model.addAttribute("membervo", membervo);
		return "franchise/addadminqna";
	}
	@RequestMapping("/franchise/addadminqna.do")
	public String addadminqna(Model model, QnaVo vo){
		int result = -1;
		result = qnaService.addadminqna(vo);
		if(result>0){
			return "redirect:/franchise/qnaview.js?page=1&qnum="+result;
		}
		return "franchise/addqna";
	}
	@RequestMapping("/franchise/qnaview.js")
	public String getQnaview(Model model, int qnum){
		QnaVo qnavo = qnaService.getQnaview(qnum);
		model.addAttribute("qnavo", qnavo);
		return "franchise/qnaview";
	}
	@RequestMapping("/franchise/deleteqna.do")
	public String deleteqna(Model model, int qnum, int page,HttpSession session){
		int result = -1;
		result = qnaService.deleteqna(qnum);
		if(result>0){
			if(session.getAttribute("grade").equals("ADMIN")){
				return "redirect:/franchise/qna.js?page="+page;
			}
			else{
				return "redirect:/franchise/qnaview.js.js?page="+page+"&userid="+session.getAttribute("userid");	
			}
		}
		return "redirect:/franchise/qnaview.js?page="+page+"&qnum="+qnum;
	}

	@RequestMapping("/franchise/updateqna.js")
	public String getUpdateqna(Model model, int qnum){
		QnaVo qnavo = qnaService.getQnaview(qnum);
		model.addAttribute("qnavo", qnavo);
		return "franchise/updateqna";
	}
	@RequestMapping("/franchise/updateqna.do")
	public String updateqna(Model model, QnaVo vo, int page,HttpSession session){
		int result = -1;
		result = qnaService.updateqna(vo);
		if(result>0){
			return "redirect:/franchise/qnaview.js?page="+page+"&qnum="+vo.getQnum();
		}
		return "redirect:/franchise/updateqna.js?nnum="+vo.getQnum()+"&page="+page;
	}
	@RequestMapping("/member/myqna.js")
	public ModelAndView getMyqna(HttpServletRequest request,HttpSession session){
		return qnaService.getMyqna(request,session);
	}
	
/*	@RequestMapping("/franchise/qna.js")
	public ModelAndView getQna(HttpServletRequest request){
		return qnaService.getQna(request);
	}*/
}
