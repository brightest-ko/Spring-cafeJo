package com.cafeJo.heeJ.store;

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
public class StoreController {
	private StoreService storeService;

	public void setStoreService(StoreService storeService) {
		this.storeService = storeService;
	}
	
	
	
	@RequestMapping("/brand/store.js")
	public ModelAndView getStore(HttpServletRequest request){
		return storeService.getStore(request);
	}
	@RequestMapping("/brand/addstore.js")
	public String getAddstore(Model model, StoreVo vo){
		return "brand/addstore";
	}
	@RequestMapping("/brand/addstore.do")
	public String addstore(Model model, StoreVo vo){
		int result = -1;
		result = storeService.addstore(vo);
		if(result>0){
			return "redirect:/brand/storeview.js?page=1&storenum="+result;
		}
		return "brand/addstore";
	}
	@RequestMapping("/brand/storeview.js")
	public String getStoreview(Model model, int storenum){
		StoreVo storevo = storeService.getStoreview(storenum);
		model.addAttribute("storevo", storevo);
		return "brand/storeview";
	}
	@RequestMapping("/brand/updatestore.js")
	public String getUpdatestore(Model model, int storenum){
		StoreVo storevo = storeService.getStoreview(storenum);
		model.addAttribute("storevo", storevo);
		return "brand/updatestore";
	}
	@RequestMapping("/brand/updatestore.do")
	public String updatestore(Model model, StoreVo vo, int page){
		int result = -1;
		result = storeService.updatestore(vo);
		if(result>0){
			return "redirect:/brand/storeview.js?page="+page+"&storenum="+vo.getStorenum();
		}
		return "redirect:/brand/updatestore.js?storenum="+vo.getStorenum()+"&page="+page;
	}
	@RequestMapping("/brand/deletestore.do")
	public String deletestore(Model model, int storenum, int page){
		int result = -1;
		result = storeService.deletestore(storenum);
		if(result>0){
			return "redirect:/brand/store.js?page="+page;
		}
		return "redirect:/brand/storeview.js?page="+page+"&storenum="+storenum;
	}
}
