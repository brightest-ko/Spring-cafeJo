package com.cafeJo.heeJ.menu;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
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
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.cafeJo.heeJ.member.MemberVo;
import com.cafeJo.heeJ.qna.QnaVo;


@Controller
public class MenuController {
	private MenuService menuService;

	public void setmenuService(MenuService menuService) {
		this.menuService = menuService;
	}
	
	@RequestMapping("/menu/newMenu.js")
	public String getNewMenu(Model model) {
		return "menu/newMenu";
	}
	@RequestMapping("/menu/coffee.js")
	public ModelAndView getCoffee(HttpServletRequest request) {
		return menuService.getCoffee(request);
	}	
	@RequestMapping("/menu/beverage.js")
	public ModelAndView getBeverage(HttpServletRequest request) {
		return menuService.getBeverage(request);
	}	
	@RequestMapping("/menu/dessert.js")
	public ModelAndView getDessert(HttpServletRequest request) {
		return menuService.getDessert(request);
	}
	@RequestMapping("/menu/delhi.js")
	public ModelAndView getDelhi(HttpServletRequest request) {
		return menuService.getDelhi(request);
	}
	@RequestMapping("/menu/md.js")
	public ModelAndView getMd(HttpServletRequest request) {
		return menuService.getMd(request);
	}
	
	@RequestMapping("/menu/addmenu.js")
	public String getAddmenu(Model model) {
		return "menu/addmenu";
	}
	@RequestMapping("/menu/addmenu.do")
	public String addmenu(MenuVo vo,String pagekind, MultipartHttpServletRequest request){
		int result = menuService.addmenu(vo,request);
		return "redirect:/menu/"+pagekind+".js";
	}
	@RequestMapping("/menu/updatemenu.js")
	public String getUpdatemenu(Model model, int num) {
		MenuVo menuvo = menuService.getMenuview(num);
		model.addAttribute("menuvo", menuvo);
		return "menu/updatemenu";
	}
	@RequestMapping("/menu/updatemenu.do")
	public String updatemenu(Model model, MenuVo vo, int page, String beforefile,String pagekind, MultipartHttpServletRequest request){
		int result = -1;
		result = menuService.updatemenu(vo,request,beforefile);
		if(result>0){
			return "redirect:/menu/"+vo.getKind()+".js?page="+page;
		}
		return "redirect:/menu/updatemenu.js?num="+vo.getNum()+"&page="+page+"&pagekind="+pagekind;
		
	}
	@RequestMapping("/menu/deletemenu.do")
	public String deletemenu(Model model, int num, int page, String pagekind, MultipartHttpServletRequest request){
		int result = -1;
		result = menuService.deletemenu(num,request);
		return "redirect:/menu/"+pagekind+".js";
	}
	
}
