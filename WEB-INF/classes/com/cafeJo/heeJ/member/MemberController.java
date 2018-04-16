package com.cafeJo.heeJ.member;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;



@Controller
public class MemberController {
	private MemberService memberService;

	public void setMemberService(MemberService memberService) {
		this.memberService = memberService;
	}
	@RequestMapping("/brand.js")
	public String getBrand(Model model) {
		return "brand/brand";
	}
	@RequestMapping("/member/signup.js")
	public String getSignup(Model model) {
		return "member/join";
	}
	@RequestMapping("/member/findid.js")
	public String getFindid(Model model) {
		return "member/findid";
	}
	@RequestMapping("/member/findid.do")
	public String findid(Model model,MemberVo vo,String dateYear,String dateMonth,String dateDay){
		vo.setBirth(dateYear+"-"+dateMonth+"-"+dateDay);
		String userid = memberService.findid(vo);
		model.addAttribute("userid", userid);
		return "member/getid";
	}
	@RequestMapping("/member/findpw.js")
	public String getFindpw(Model model) {
		return "member/findpw";
	}
	@RequestMapping("/member/findpw.do")
	public String findpw(Model model,MemberVo vo,String dateYear,String dateMonth,String dateDay){
		vo.setBirth(dateYear+"-"+dateMonth+"-"+dateDay);
		String usernewpasswd = memberService.findpw(model,vo);
		return "member/getpw";
	}
	@RequestMapping("/member/signup.do")
	public String signup(MemberVo vo, HttpServletResponse response,HttpSession session,String dateYear,String dateMonth,String dateDay) throws IOException {
		vo.setBirth(dateYear+"-"+dateMonth+"-"+dateDay);
		int result = memberService.signup(vo);
		//다른 창으로 바꾸기
		PrintWriter writer = response.getWriter();
		if(result<=0){
			writer.println("<script type='text/javascript'>");
			writer.println("alert('가입이 완료되었습니다.');");
			writer.println("</script>");}
		if(session.getAttribute("grade")!=null){
			if(session.getAttribute("grade").equals("ADMIN")){
			return "member/memberinfo";}
			else{return "redirect:/member/login.js";}
		}
		else{
			return "redirect:/member/login.js";	
		}
	}
	@RequestMapping("/member/idcheck.do")
	public void idcheck(String userid , HttpServletResponse response) throws IOException{
		PrintWriter out = response.getWriter();
		int result = -1;
		String str = "";
		if(userid==null||userid.trim().equals("")){
			userid="";
		}
		if(!userid.equals("")){
			result=memberService.idcheck(userid);
		}
		if(result>0){
			str="havethisid";
		}else if(userid.equals("")){
			str="noid";
		}else if(userid.length()<6){
			str="shortid";
		}else if(userid.length()>16){
			str="longid";
		}else{
			str="YES";
		}
		boolean flag = java.util.regex.Pattern.matches("^[a-zA-Z0-9]*$", userid);
		if(flag==false){
			str="wrongid";
		}
		out.print(str);
	}
	@RequestMapping("/member/login.js")
	public String getLogin(Model model) {
		return "member/login";
	}
	@RequestMapping("/member/login.do")
	public String login(Model model, HttpSession session, String userid, String passwd, String rememberid, HttpServletResponse response) throws IOException {
		int result = memberService.login(session, userid, passwd);
		PrintWriter writer = response.getWriter();
		String alert ="";
		if(result!=1){
			model.addAttribute("result",result);
			if(rememberid!=null&&rememberid.equals("yesremember")){
				System.out.println(rememberid);
			model.addAttribute("rememberid",userid);}
			return "redirect:/member/login.js";
		}
		return "redirect:/index.do";
	}
	@RequestMapping("/member/logout.do")
	protected String logout(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		session.invalidate();
		return "redirect:/index.do";
	}
	@RequestMapping("/member/myinfo.js")
	public String getMyinfo(Model model,HttpSession session) {
		MemberVo membervo = memberService.myinfo(session);
		model.addAttribute("membervo", membervo);
		return "member/myinfo";
	}
	@RequestMapping("/member/myinfo2.js")
	public String getMyinfo2(Model model) {
		return "member/myinfo2";
	}
	@RequestMapping("/member/updatemyinfo.js")
	public String getUpdatemyinfo(Model model,HttpSession session, String passwd){
		MemberVo membervo = memberService.getUpdatemyinfo(session, passwd);
		if(membervo!=null){
			model.addAttribute("membervo", membervo);
			return "member/updatemyinfo";}
		return "redirect:/member/myinfo.js";
	}
	@RequestMapping("/member/updatemyinfo.do")
	public String updatemyinfo(MemberVo vo, HttpServletResponse response){
		int result = memberService.updatemyinfo(vo);
		return "redirect:/member/myinfo.js";
	}
	@RequestMapping("/member/deletemyinfo.js")
	public String getDeletemyinfo(Model model) {
		return "member/deletemyinfo";
	}
	@RequestMapping("/member/deletemyinfo.do")
	public String deletemyinfo(HttpServletRequest request,HttpSession session,String passwd) {
		int result = memberService.deletemyinfo(session,passwd);
		if(result>0){
			session.invalidate();
			return "redirect:/index.do";
		}
		return "redirect:/member/deletemyinfo.js";	
	}
	
	@RequestMapping("/member/memberinfo.js")
	public ModelAndView getMemberinfo(HttpServletRequest request){
		return memberService.getMemberinfo(request);
	}
	@RequestMapping("/member/memberview.js")
	public String getNoticeview(Model model, String userid,int page){
		MemberVo membervo = memberService.getMemberview(model,userid);
		model.addAttribute("membervo", membervo);
		model.addAttribute("page", page);
		return "member/memberview";
	}
	@RequestMapping("/member/memberupdate.js")
	public String getMemberupdate(Model model, String userid, int page){
		MemberVo membervo = memberService.getMemberupdate(userid);
		if(membervo!=null){
			model.addAttribute("membervo", membervo);
			return "member/memberupdate";}
		return "redirect:/member/memberview.js?userid="+userid+"&page="+page;
	}
	@RequestMapping("/member/memberupdate.do")
	public String memberupdate(MemberVo vo, HttpServletResponse response,int page){
		int result = memberService.updatemyinfo(vo);
		return "redirect:/member/memberview.js?userid="+vo.getUserid()+"&page="+page;
	}
	@RequestMapping("/member/deletemember.do")
	public String deletemember(String userid,int page) {
		int result = memberService.deletemember(userid);
		return "redirect:/member/memberview.js?userid="+userid+"&page="+page;
	}
	@RequestMapping("/member/addmemberagain.do")
	public String addmemberagain(String userid,int page) {
		int result = memberService.addmemberagain(userid);
		return "redirect:/member/memberview.js?userid="+userid+"&page="+page;
	}
	@RequestMapping("/member/deleteinfo.do")
	public String deleteinfo(String userid,int page) {
		int result = memberService.deleteinfo(userid);
		return "redirect:/member/memberinfo.js?page="+page;	
	}
}
