package com.cafeJo.heeJ.event;

import java.io.IOException;
import java.io.PrintWriter;
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
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.cafeJo.heeJ.member.MemberVo;
import com.cafeJo.heeJ.menu.MenuVo;


@Controller
public class EventController {
	private EventService eventService;

	public void setEventService(EventService eventService) {
		this.eventService = eventService;
	}

	@RequestMapping("/customer/event.js")
	public ModelAndView getEvent(HttpServletRequest request){
		return eventService.getEvent(request);
	}
	@RequestMapping("/customer/eventmember.js")
	public ModelAndView getEventmember(HttpServletRequest request){
		return eventService.getEventmember(request);
	}
	@RequestMapping("/customer/addevent.js")
	public String getAddevent(Model model, EventVo vo){
		return "customer/addevent";
	}
	@RequestMapping("/customer/addevent.do")
	public String addevent(Model model, EventVo vo, MultipartHttpServletRequest request){
		int result = -1;
		result = eventService.addevent(vo,request);
		if(result>0){
			return "redirect:/customer/eventview.js?page=1&eventnum="+result;
		}
		return "customer/addevent";
	}
	@RequestMapping("/customer/eventview.js")
	public String getEventview(Model model, int eventnum){
		EventVo eventvo = eventService.getEventview(eventnum);
		model.addAttribute("eventvo", eventvo);
		return "customer/eventview";
	}
	@RequestMapping("/customer/updateevent.js")
	public String getUpdateevent(Model model, int eventnum){
		EventVo eventvo = eventService.getEventview(eventnum);
		model.addAttribute("eventvo", eventvo);
		return "customer/updateevent";
	}
	@RequestMapping("/customer/updateevent.do")
	public String updateevent(Model model, EventVo vo, int page, String beforefile, MultipartHttpServletRequest request){
		int result = -1;
		result = eventService.updateevent(vo,request,beforefile);
		if(result>0){
			return "redirect:/customer/eventview.js?page="+page+"&eventnum="+vo.getEventnum();
		}
		return "redirect:/customer/updateevent.js?eventnum="+vo.getEventnum()+"&page="+page;
	}
	@RequestMapping("/customer/deleteevent.do")
	public String deleteevent(Model model, int eventnum, int page, MultipartHttpServletRequest request){
		int result = -1;
		result = eventService.deleteevent(eventnum,request);
		if(result>0){
			return "redirect:/customer/event.js?page="+page;
		}
		return "redirect:/customer/eventview.js?page="+page+"&eventnum="+eventnum;
	}
	
	@RequestMapping("/customer/event.do")
	public void event(HttpServletResponse response, HttpSession session, int eventnum) throws IOException{
		PrintWriter out = response.getWriter();
		int result = -1;
		String str = "fail";
		String eventfinish = eventService.getEventfinish(eventnum);
		if(eventfinish.equals("finishevent")){
			str="finishevent";
		}
		else{
		String userid=(String)session.getAttribute("userid");
		MemberVo memberVo= eventService.getUserinfo(userid);
		if(userid==null){
			str="noid";
		}else{
			result = eventService.eventcheck(userid, eventnum);
			System.out.println(result);
			if(result!=0){
				str="already";
			}else{
				if(memberVo!=null){
					result = eventService.event(memberVo, eventnum);//이벤트 참여함
					if(result>0){
						str="success";
					}
				}
			}
		}
		}
		out.print(str);
	}

	@RequestMapping("/member/myevent.js")
	public ModelAndView getMyevent(HttpServletRequest request,HttpSession session){
		return eventService.getMyevent(request,session);
	}
}
