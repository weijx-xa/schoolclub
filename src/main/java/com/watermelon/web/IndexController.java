package com.watermelon.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.watermelon.pojo.User;

@Controller
public class IndexController {
	@Autowired
	private WebUtils webUtils;
	@RequestMapping("/")
	public ModelAndView root(HttpServletRequest request,HttpServletResponse response){
       		ModelAndView modelAndView=new ModelAndView("redirect:/index");
	          return modelAndView;
	}
	
	@RequestMapping("/index")
	public ModelAndView index()
	{
		User user =(User) webUtils.getSession("user");
		ModelAndView modelAndView=new ModelAndView("index");
		if(user!=null)
		{
			modelAndView.addObject("user", user);
		}
		return modelAndView;
	}
}
