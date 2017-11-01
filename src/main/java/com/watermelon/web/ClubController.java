package com.watermelon.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("club")
public class ClubController {
  
	@RequestMapping("list")
	public ModelAndView list()
	{
		ModelAndView modelAndView=new ModelAndView("club");
		return modelAndView;
	}
	
	
	@RequestMapping("detail")
	public ModelAndView detail()
	{
		ModelAndView modelAndView=new ModelAndView("singleclub");
		return modelAndView;
	}
	
	@RequestMapping("create1")
	public ModelAndView create1()
	{
		ModelAndView modelAndView=new ModelAndView("createclub1");
		return modelAndView;
	}
	
	@RequestMapping("create2")
	public ModelAndView create2()
	{
		ModelAndView modelAndView=new ModelAndView("createclub2");
		return modelAndView;
	}
}
